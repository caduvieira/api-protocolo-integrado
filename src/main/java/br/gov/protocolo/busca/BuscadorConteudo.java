package br.gov.protocolo.busca;


import br.gov.protocolo.model.Documento;
import lombok.experimental.FieldDefaults;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.SearchHitField;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Stream;

import static java.lang.Integer.MAX_VALUE;
import static java.util.Collections.emptyList;
import static java.util.stream.Collectors.toList;
import static lombok.AccessLevel.PRIVATE;
import static org.elasticsearch.index.query.QueryBuilders.*;

@Component
@FieldDefaults(level = PRIVATE, makeFinal = true)
public class BuscadorConteudo {

    private static final int PAGE_SIZE = 2;

    ElasticsearchTemplate et;
    BuscaRepository buscaRepository;

    @Autowired
    BuscadorConteudo(ElasticsearchTemplate et, BuscaRepository buscaRepository) {
        this.et = et;
        this.buscaRepository = buscaRepository;
    }

    public List<Documento> busca(Optional<String> termoBuscado, Integer paginaAtual) {
        return executaQuery(termoBuscado, paginaAtual, q -> boolQuery()
                .must(multiMatchQuery(q, "nup", "numeroOrigemProtocolo", "assunto")
                        .prefixLength(0))
                .should(matchQuery("nup", q)
                        .boost(10))
                .should(matchQuery("assunto", q)
                        .boost(9))).getContent();
    }

    private List<Documento> executaQuery(Optional<String> termoBuscado, Function<String, QueryBuilder> criaQuery) {
        return executaQuery(termoBuscado, 0, MAX_VALUE, criaQuery).getContent();
    }

    private Page<Documento> executaQuery(Optional<String> termoBuscado, Integer paginaAtual, Function<String, QueryBuilder> criaQuery) {
        return executaQuery(termoBuscado, paginaAtual, PAGE_SIZE, criaQuery);
    }

    private Page<Documento> executaQuery(Optional<String> termoBuscado, Integer paginaAtual,
                                              Integer quantidadeDeResultados, Function<String, QueryBuilder> criaQuery) {
        String termo = termoBuscado.orElse("");
        PageRequest pageable = PageRequest.of(paginaAtual, quantidadeDeResultados);

        return buscaRepository.findByAssuntoLike(termo, pageable);
    }

}

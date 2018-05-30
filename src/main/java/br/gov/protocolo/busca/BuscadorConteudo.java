package br.gov.protocolo.busca;


import br.gov.protocolo.model.Documento;
import br.gov.protocolo.model.Resultado;
import lombok.experimental.FieldDefaults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

import static lombok.AccessLevel.PRIVATE;

@Service
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

    public Resultado busca(Optional<String> termoBuscado, Integer paginaAtual) {
        Page<Documento> resultados = executaQuery(termoBuscado, paginaAtual, PAGE_SIZE);
        return new Resultado(resultados.getTotalElements(),resultados.getTotalPages(),paginaAtual +1,resultados.getContent());
    }

    private Page<Documento> executaQuery(Optional<String> termoBuscado, Integer paginaAtual,
                                              Integer quantidadeDeResultados) {
        String termo = termoBuscado.orElse("");
        PageRequest pageable = PageRequest.of(paginaAtual, quantidadeDeResultados);

        return buscaRepository.findByAssuntoLike(termo, pageable);
    }
}

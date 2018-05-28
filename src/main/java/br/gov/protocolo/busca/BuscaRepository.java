package br.gov.protocolo.busca;

import br.gov.protocolo.model.Documento;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import java.util.List;

public interface BuscaRepository extends ElasticsearchRepository<Documento, String> {

    Page<Documento> findByAssuntoLike(String assunto, Pageable pageable);

    List<Documento> findByNup(String nup);

}

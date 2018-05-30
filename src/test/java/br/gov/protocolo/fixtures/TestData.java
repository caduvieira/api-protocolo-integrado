package br.gov.protocolo.fixtures;

import br.gov.protocolo.model.Documento;
import br.gov.protocolo.model.Resultado;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;


import java.util.List;

import static br.gov.protocolo.busca.BuscadorConteudo.PAGE_SIZE;
import static java.util.Arrays.asList;
import static java.util.Collections.unmodifiableList;


public class TestData {

    public static final Documento DOCUMENTO1 = new Documento()
            .withCodnup("codigo-teste1")
            .withNup("nup-teste1")
            .withAssunto("assunto-teste1");

    public static final Documento DOCUMENTO2 = new Documento()
            .withCodnup("codigo-teste2")
            .withNup("nup-teste2")
            .withAssunto("assunto-teste2");

    public static final Resultado RESULTADO = new Resultado()
            .withTotalResultados(2)
            .withTotalPaginas(1)
            .withPaginaAtual(1)
            .withResultadosPaginado( unmodifiableList(
              asList(
                DOCUMENTO1,
                DOCUMENTO2
              )));

    public static final Page<Documento> PAGE_DOCUMENTO = new PageImpl<Documento>(
              asList(
                DOCUMENTO1,
                DOCUMENTO2
              ),
              PageRequest.of(0, PAGE_SIZE),
              asList(
                DOCUMENTO1,
                DOCUMENTO2
              ).size()
    );
}

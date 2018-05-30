package br.gov.protocolo.fixtures;

import br.gov.protocolo.model.Documento;
import br.gov.protocolo.model.Resultado;

import java.util.List;

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
}

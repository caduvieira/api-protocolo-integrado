package br.gov.protocolo.busca;

import br.gov.protocolo.busca.BuscaController;
import br.gov.protocolo.busca.BuscadorConteudo;
import br.gov.protocolo.model.Resultado;
import lombok.experimental.FieldDefaults;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;


import static br.gov.protocolo.fixtures.TestData.RESULTADO;
import static lombok.AccessLevel.PRIVATE;
import static java.util.Optional.of;
import static org.mockito.Mockito.when;
import static org.junit.Assert.assertEquals;


@RunWith(MockitoJUnitRunner.class)
@FieldDefaults(level = PRIVATE)
public class BuscaControllerTest {

    @Mock
    BuscadorConteudo buscador;

    BuscaController controller;

    @Before
    public void setUp() {
        controller = new BuscaController(buscador);
    }

    @Test
    public void retornaBusca() throws Exception {
        when(buscador.busca(of("teste"),0)).thenReturn(RESULTADO);

        Resultado resultado = controller.busca("teste",1);
        assertEquals(resultado,RESULTADO);
    }

}

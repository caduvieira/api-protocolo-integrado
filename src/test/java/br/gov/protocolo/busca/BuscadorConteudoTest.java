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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;


import static br.gov.protocolo.fixtures.TestData.PAGE_DOCUMENTO;
import static br.gov.protocolo.fixtures.TestData.RESULTADO;
import static lombok.AccessLevel.PRIVATE;
import static java.util.Optional.of;
import static org.mockito.Mockito.when;
import static org.junit.Assert.assertEquals;


@RunWith(MockitoJUnitRunner.class)
@FieldDefaults(level = PRIVATE)
public class BuscadorConteudoTest {

    @Mock
    BuscaRepository buscaRepository;

    BuscadorConteudo buscadorConteudo;

    @Before
    public void setUp() {
        buscadorConteudo = new BuscadorConteudo(buscaRepository);
    }

    @Test
    public void retornaBusca() throws Exception {
        when(buscaRepository.findByAssuntoLike("teste",PageRequest.of(0,2))).thenReturn(PAGE_DOCUMENTO);

        Resultado resultado = buscadorConteudo.busca(of("teste"),0);
        assertEquals(resultado,RESULTADO);
    }

}

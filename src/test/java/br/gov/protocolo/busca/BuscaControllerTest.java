package br.gov.protocolo.busca;

import br.gov.protocolo.busca.BuscaController;
import br.gov.protocolo.busca.BuscadorConteudo;
import lombok.experimental.FieldDefaults;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;


import static br.gov.protocolo.fixtures.TestData.RESULTADO;
import static lombok.AccessLevel.PRIVATE;
import static java.util.Optional.of;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


@FieldDefaults(level = PRIVATE)
@RunWith(SpringRunner.class)
@WebMvcTest(BuscaController.class)
@AutoConfigureMockMvc
public class BuscaControllerTest {

    @MockBean
    BuscadorConteudo buscador;

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void retornaBusca() throws Exception {
        when(buscador.busca(of("teste"),0)).thenReturn(RESULTADO);

        this.mockMvc.perform(get("/busca").param("q", "teste")).andDo(print())
          .andExpect(status().isOk())
          .andExpect(jsonPath("$.totalResultados").value("2"))
          .andExpect(jsonPath("$.totalPaginas").value("1"))
          .andExpect(jsonPath("$.paginaAtual").value("1"));
    }

}

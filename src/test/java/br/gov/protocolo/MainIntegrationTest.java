package br.gov.protocolo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest(classes = Main.class)
public class MainIntegrationTest {

    @Test
    public void carregaContextoSemExcecoes() {
    }

}

package br.gov.protocolo.busca;

import br.gov.protocolo.model.Resultado;
import lombok.experimental.FieldDefaults;
import net.rossillo.spring.web.mvc.CacheControl;
import net.rossillo.spring.web.mvc.CachePolicy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static java.util.Optional.ofNullable;
import static lombok.AccessLevel.PRIVATE;

@RestController
@FieldDefaults(level = PRIVATE, makeFinal = true)
class BuscaController {

    BuscadorConteudo buscador;

    @Autowired
    BuscaController(BuscadorConteudo buscador) {
       this.buscador = buscador;
    }

    @CacheControl(maxAge=31556926, policy = { CachePolicy.MUST_REVALIDATE })
    @CrossOrigin
    @RequestMapping("/busca")
    public Resultado busca(@RequestParam(required = false) String q,
                                 @RequestParam(required = false, defaultValue = "1") Integer pagina) {
        return buscador.busca(ofNullable(q), pagina -1);
    }
}

package br.gov.protocolo.busca;

import br.gov.protocolo.model.Documento;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import static lombok.AccessLevel.PRIVATE;
import static org.springframework.http.HttpStatus.OK;

@RestController
class BuscaController {

    @RequestMapping("/busca")
    public Documento busca(@RequestParam(required = true) String q) {
        return new Documento(1, q);
    }
}

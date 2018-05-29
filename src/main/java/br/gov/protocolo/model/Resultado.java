package br.gov.protocolo.model;

import br.gov.protocolo.model.Documento;

import java.util.List;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.experimental.FieldDefaults;

import static lombok.AccessLevel.PRIVATE;

@Data
@AllArgsConstructor
@FieldDefaults(level = PRIVATE, makeFinal = true)
public class Resultado {
  long totalResultados;
  int totalPaginas;
  Integer paginaAtual;
  List<Documento> resultadosPaginado;
}

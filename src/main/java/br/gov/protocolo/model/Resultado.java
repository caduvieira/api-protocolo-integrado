package br.gov.protocolo.model;

import br.gov.protocolo.model.Documento;

import java.util.List;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.Wither;

import static lombok.AccessLevel.PRIVATE;

@Wither
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = PRIVATE)
public class Resultado {
  long totalResultados;
  int totalPaginas;
  Integer paginaAtual;
  List<Documento> resultadosPaginado;
}

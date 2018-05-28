package br.gov.protocolo.model;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;


import static lombok.AccessLevel.PRIVATE;

@Data
@AllArgsConstructor
@FieldDefaults(level = PRIVATE, makeFinal = true)
@Document(indexName = "documento_index", type = "doc")
public class Documento {
  @Id
  String codnup;
  String nup;
  String indicadordocumento;
  String numeroorigemprotocolo;
  long orgaoorigem;
  long unidadeorigem;
  String especietipodocumental;
  String assunto;
  String iddocumento;
  Date dataproducao;
  int numerovolumes;
  int numeroanexos;
  String codsituacao;
  Date dataalteracaosituacao;
  Date dataultimaatualizacao;
}

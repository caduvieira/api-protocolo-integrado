package br.gov.protocolo.model;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Value;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.Wither;

import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;


import static lombok.AccessLevel.PRIVATE;

@Value
@Data
@Wither
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = PRIVATE)
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

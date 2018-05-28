-- MySQL Script generated by MySQL Workbench
-- sáb 26 mai 2018 18:22:41 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `SituacaoProcesso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SituacaoProcesso` ;

CREATE TABLE IF NOT EXISTS `SituacaoProcesso` (
  `codSituacao` CHAR(2) NOT NULL,
  `descricaoSituacao` VARCHAR(35) NULL,
  PRIMARY KEY (`codSituacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SituacaoOrgao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SituacaoOrgao` ;

CREATE TABLE IF NOT EXISTS `SituacaoOrgao` (
  `codSituacao` BIGINT NOT NULL,
  `descSituacao` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`codSituacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Orgao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Orgao` ;

CREATE TABLE IF NOT EXISTS `Orgao` (
  `codOrgao` BIGINT NOT NULL,
  `codSiorg` VARCHAR(6) NULL,
  `codSituacao` BIGINT NOT NULL,
  `tipoIntegracao` VARCHAR(45) NULL,
  `dataIntegracao` DATE NULL,
  `dataUltimaAtualizacao` DATE NULL,
  `enviarSMS` CHAR(1) NULL,
  `nome` VARCHAR(100) NULL,
  `sigla` VARCHAR(15) NULL,
  `cargaInicial` CHAR(1) NULL,
  `principal` CHAR(1) NOT NULL,
  PRIMARY KEY (`codOrgao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SituacaoUP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SituacaoUP` ;

CREATE TABLE IF NOT EXISTS `SituacaoUP` (
  `codSituacao` BIGINT NOT NULL,
  `descSituacao` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`codSituacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UnidadeProtocolizadora`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UnidadeProtocolizadora` ;

CREATE TABLE IF NOT EXISTS `UnidadeProtocolizadora` (
  `codUP` BIGINT NOT NULL,
  `descricao` VARCHAR(150) NULL,
  `sigla` VARCHAR(10) NULL,
  `fax` VARCHAR(12) NULL,
  `telefone` VARCHAR(12) NULL,
  `telefone2` VARCHAR(12) NULL,
  `email` VARCHAR(100) NULL,
  `logradouro` VARCHAR(100) NULL,
  `complemento` VARCHAR(100) NULL,
  `numero` VARCHAR(15) NULL,
  `bairro` VARCHAR(45) NULL,
  `cidade` VARCHAR(40) NULL,
  `uf` CHAR(2) NULL,
  `cep` CHAR(8) NULL,
  `codSituacao` BIGINT NOT NULL,
  `codOrgao` BIGINT NULL,
  `codOrgaoSuperior` BIGINT NOT NULL,
  `codigoOficial` VARCHAR(6) NULL,
  PRIMARY KEY (`codUP`))
ENGINE = InnoDB;


-- Table `Documento`
-- -----------------------------------------------------
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Documento` ;

CREATE TABLE IF NOT EXISTS `Documento` (
  `codPD` BIGINT NOT NULL,
  `nup` VARCHAR(30) NULL,
  `indicadorDocumento` CHAR(1) NULL,
  `numeroOrigemProtocolo` VARCHAR(30) NULL,
  `orgaoOrigem` BIGINT NULL,
  `unidadeOrigem` BIGINT NULL,
  `especieTipoDocumental` VARCHAR(50) NULL,
  `assunto` TEXT NULL,
  `idDocumento` VARCHAR(50) NULL,
  `dataProducao` DATETIME NULL,
  `numeroVolumes` INT NULL,
  `numeroAnexos` INT NULL,
  `codSituacao` CHAR(2) NULL,
  `dataAlteracaoSituacao` DATETIME NULL,
  `dataUltimaAtualizacao` DATETIME NOT NULL,
  PRIMARY KEY (`codPD`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Consulta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Consulta` ;

CREATE TABLE IF NOT EXISTS `Consulta` (
  `codPD` BIGINT NOT NULL,
  `dataHora` DATETIME NOT NULL,
  PRIMARY KEY (`codPD`, `dataHora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Interessado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Interessado` ;

CREATE TABLE IF NOT EXISTS `Interessado` (
  `codPD` BIGINT NOT NULL,
  `nome` VARCHAR(150) NOT NULL,
  `cpf_cnpj` VARCHAR(14) NULL,
  PRIMARY KEY (`codPD`, `nome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LogXML`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LogXML` ;

CREATE TABLE IF NOT EXISTS `LogXML` (
  `codUpload` BIGINT NOT NULL,
  `codOrgao` BIGINT NULL,
  `dataHoraProcessado` DATETIME NULL,
  PRIMARY KEY (`codUpload`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoOperacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoOperacao` ;

CREATE TABLE IF NOT EXISTS `TipoOperacao` (
  `codTipoOperacao` CHAR(2) NOT NULL,
  `descricao` VARCHAR(150) NULL,
  PRIMARY KEY (`codTipoOperacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HistoricoDocumento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HistoricoDocumento` ;

CREATE TABLE IF NOT EXISTS `HistoricoDocumento` (
  `codHistorico` BIGINT NOT NULL,
  `codPD` BIGINT NULL,
  `dataHora` DATETIME NULL,
  `codOrgao` BIGINT NULL,
  `unidade` VARCHAR(150) NULL,
  `codOperacao` CHAR(2) NULL,
  `complementoOperacao` VARCHAR(500) NULL,
  PRIMARY KEY (`codHistorico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DocumentoVinculado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DocumentoVinculado` ;

CREATE TABLE IF NOT EXISTS `DocumentoVinculado` (
  `codHistorico` BIGINT NOT NULL,
  `NUP` VARCHAR(30) NULL,
  PRIMARY KEY (`codHistorico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UsuarioOrgao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UsuarioOrgao` ;

CREATE TABLE IF NOT EXISTS `UsuarioOrgao` (
  `codUsuarioOrgao` BIGINT NOT NULL,
  `codOrgao` BIGINT NOT NULL,
  `cpf` VARCHAR(11) NULL,
  `nome` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  `telefone` VARCHAR(12) NULL,
  `perfilUsuario` VARCHAR(50) NULL,
  `situacaoUsuario` VARCHAR(15) NULL,
  `codOrgaoAtuacao` BIGINT NOT NULL,
  PRIMARY KEY (`codUsuarioOrgao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SolicitacaoUP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SolicitacaoUP` ;

CREATE TABLE IF NOT EXISTS `SolicitacaoUP` (
  `codSolicitacaoUP` BIGINT NOT NULL,
  `codUP` BIGINT NULL,
  `operacao` VARCHAR(15) NULL,
  `data` DATETIME NULL,
  `situacao` CHAR(1) NULL,
  `motivoSolicitacao` VARCHAR(250) NULL,
  `justificativaIndeferimento` VARCHAR(250) NULL,
  `cpfGPIAnalisador` VARCHAR(11) NULL,
  `codGPOSolicitante` BIGINT NULL,
  PRIMARY KEY (`codSolicitacaoUP`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Usuario` ;

CREATE TABLE IF NOT EXISTS `Usuario` (
  `cpf` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(100) NULL,
  `celular` VARCHAR(12) NULL,
  `senha` VARCHAR(64) NULL,
  `confirmacaoCadastro` CHAR(1) NULL,
  `confirmacaoCel` CHAR(1) NULL,
  `codConfirmacaoCel` VARCHAR(5) NULL,
  `email` VARCHAR(100) NULL,
  `ultimoAcesso` DATETIME NULL,
  `confirmacaoEmail` CHAR(1) NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UsuarioAcompanhamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UsuarioAcompanhamento` ;

CREATE TABLE IF NOT EXISTS `UsuarioAcompanhamento` (
  `cpf` VARCHAR(11) NOT NULL,
  `codPD` BIGINT NOT NULL,
  `notificaSms` CHAR(1) NULL,
  `notificaEmail` CHAR(1) NULL,
  PRIMARY KEY (`cpf`, `codPD`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MensagemEnviada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MensagemEnviada` ;

CREATE TABLE IF NOT EXISTS `MensagemEnviada` (
  `codMensagem` BIGINT NOT NULL,
  `dataHora` DATETIME NULL,
  `tipoMensagem` CHAR(1) NULL,
  `codHistorico` BIGINT NULL,
  `cpf` VARCHAR(11) NULL,
  `situacao` CHAR(1) NULL,
  `codPD` BIGINT NULL,
  PRIMARY KEY (`codMensagem`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FaleConosco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FaleConosco` ;

CREATE TABLE IF NOT EXISTS `FaleConosco` (
  `codFaleConosco` BIGINT NOT NULL,
  `nome` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  `categoria` VARCHAR(15) NULL,
  `mensagem` TEXT NULL,
  `dataHoraRegistro` DATETIME NULL,
  `responsavelResposta` VARCHAR(45) NULL,
  `resposta` TEXT NULL,
  `dataHoraResposta` DATETIME NULL,
  `situacao` VARCHAR(15) NULL,
  PRIMARY KEY (`codFaleConosco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Auditoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Auditoria` ;

CREATE TABLE IF NOT EXISTS `Auditoria` (
  `codAuditoria` BIGINT NOT NULL,
  `operacao` VARCHAR(50) NULL,
  `dataHora` DATETIME NULL,
  `usuario` VARCHAR(30) NULL,
  `conteudoAtual` TEXT NULL,
  `tabela` VARCHAR(45) NULL,
  PRIMARY KEY (`codAuditoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SolicitacaoGPO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SolicitacaoGPO` ;

CREATE TABLE IF NOT EXISTS `SolicitacaoGPO` (
  `codSolicitacaoGPO` BIGINT NOT NULL,
  `codOrgao` BIGINT NULL,
  `cpf` VARCHAR(11) NULL,
  `nome` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  `telefone` VARCHAR(12) NULL,
  `dataDou` DATE NULL,
  `secaoDou` VARCHAR(5) NULL,
  `paginaDou` VARCHAR(5) NULL,
  `edicaoDou` VARCHAR(5) NULL,
  `portaria` VARCHAR(50) NULL,
  `situacaoSolicitacao` VARCHAR(15) NULL,
  `motivoReprovacao` VARCHAR(250) NULL,
  `cpfGPIAnalisador` VARCHAR(11) NULL,
  PRIMARY KEY (`codSolicitacaoGPO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FaixaOrgao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FaixaOrgao` ;

CREATE TABLE IF NOT EXISTS `FaixaOrgao` (
  `codFaixaOrgao` BIGINT NOT NULL,
  `codOrgao` BIGINT NULL,
  `inicioFaixa` INT NULL,
  `finalFaixa` INT NULL,
  PRIMARY KEY (`codFaixaOrgao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoErro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoErro` ;

CREATE TABLE IF NOT EXISTS `TipoErro` (
  `codTipoErro` CHAR(3) NOT NULL,
  `msgErro` VARCHAR(100) NULL,
  PRIMARY KEY (`codTipoErro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LogErroWS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LogErroWS` ;

CREATE TABLE IF NOT EXISTS `LogErroWS` (
  `codErroWS` BIGINT NOT NULL,
  `codOrgao` BIGINT NOT NULL,
  `nomeMetodo` VARCHAR(45) NULL,
  `dados` TEXT NULL,
  `dataErroWS` DATETIME NULL,
  `codTipoErro` CHAR(3) NOT NULL,
  `complementoErro` VARCHAR(200) NULL,
  PRIMARY KEY (`codErroWS`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LogExtrator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LogExtrator` ;

CREATE TABLE IF NOT EXISTS `LogExtrator` (
  `codLogExtrator` BIGINT NOT NULL,
  `codOrgao` BIGINT NOT NULL,
  `dataExtracao` DATETIME NULL,
  `numRegistros` INT NULL,
  `msgErro` VARCHAR(200) NULL,
  PRIMARY KEY (`codLogExtrator`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ErroXML`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ErroXML` ;

CREATE TABLE IF NOT EXISTS `ErroXML` (
  `codTipoErro` CHAR(3) NOT NULL,
  `codUpload` BIGINT NOT NULL,
  `complementoErro` VARCHAR(200) NULL,
  PRIMARY KEY (`codTipoErro`, `codUpload`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ErroExtrator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ErroExtrator` ;

CREATE TABLE IF NOT EXISTS `ErroExtrator` (
  `codLogExtrator` BIGINT NOT NULL,
  `codTipoErro` CHAR(3) NOT NULL,
  `complementoErro` VARCHAR(200) NULL,
  PRIMARY KEY (`codLogExtrator`, `codTipoErro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ConfiguracaoExtrator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ConfiguracaoExtrator` ;

CREATE TABLE IF NOT EXISTS `ConfiguracaoExtrator` (
  `codConfiguracaoExtrator` BIGINT NOT NULL,
  `url` VARCHAR(100) NULL,
  `porta` INT NULL,
  `usuario` VARCHAR(50) NULL,
  `senha` VARCHAR(50) NULL,
  `nome_banco` VARCHAR(50) NULL,
  `codOrgao` BIGINT NOT NULL,
  PRIMARY KEY (`codConfiguracaoExtrator`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pagina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pagina` ;

CREATE TABLE IF NOT EXISTS `Pagina` (
  `codPag` BIGINT NOT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `conteudo` TEXT NULL,
  PRIMARY KEY (`codPag`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UsuarioTempSenha`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UsuarioTempSenha` ;

CREATE TABLE IF NOT EXISTS `UsuarioTempSenha` (
  `cpf` VARCHAR(11) NOT NULL,
  `senhaTemp` VARCHAR(40) NOT NULL,
  `data` DATETIME NOT NULL,
  `tipo` CHAR(1) NOT NULL DEFAULT 'R',
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ConsultaSMS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ConsultaSMS` ;

CREATE TABLE IF NOT EXISTS `ConsultaSMS` (
  `codConsultaSMS` BIGINT NOT NULL,
  `celularRemetente` VARCHAR(12) NOT NULL,
  `nup` VARCHAR(30) NOT NULL,
  `situacao` CHAR(1) NOT NULL,
  `existeNUP` CHAR(1) NOT NULL,
  PRIMARY KEY (`codConsultaSMS`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `InconsistenciaUP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `InconsistenciaUP` ;

CREATE TABLE IF NOT EXISTS `InconsistenciaUP` (
  `codUP` INT NOT NULL,
  PRIMARY KEY (`codUP`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `SituacaoOrgao`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `SituacaoOrgao` (`codSituacao`, `descSituacao`) VALUES (1, 'sem gestor de protocolo');
INSERT INTO `SituacaoOrgao` (`codSituacao`, `descSituacao`) VALUES (2, 'não integrado');
INSERT INTO `SituacaoOrgao` (`codSituacao`, `descSituacao`) VALUES (3, 'integrado');
INSERT INTO `SituacaoOrgao` (`codSituacao`, `descSituacao`) VALUES (4, 'extinto');

COMMIT;


-- -----------------------------------------------------
-- Data for table `SituacaoUP`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `SituacaoUP` (`codSituacao`, `descSituacao`) VALUES (1, 'ativa');
INSERT INTO `SituacaoUP` (`codSituacao`, `descSituacao`) VALUES (2, 'desativada');
INSERT INTO `SituacaoUP` (`codSituacao`, `descSituacao`) VALUES (3, 'pendente');

COMMIT;

-- -----------------------------------------------------
-- Data for table `Documento`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `Documento` (`codPD`, `nup`, `indicadorDocumento`, `numeroOrigemProtocolo`, `orgaoOrigem`, `unidadeOrigem`, `especieTipoDocumental`, `assunto`, `dataUltimaAtualizacao`) VALUES (1, 'nup 1', '1', 'numeroOrigiemProtocolo1', 1, 1, 'especieTipoDocumental1', 'requisição de servidor', NOW());
INSERT INTO `Documento` (`codPD`, `nup`, `indicadorDocumento`, `numeroOrigemProtocolo`, `orgaoOrigem`, `unidadeOrigem`, `especieTipoDocumental`, `assunto`, `dataUltimaAtualizacao`) VALUES (2, 'nup 2', '1', 'numeroOrigiemProtocolo1', 2, 2, 'especieTipoDocumental2', 'PAD no servidor', NOW());
INSERT INTO `Documento` (`codPD`, `nup`, `indicadorDocumento`, `numeroOrigemProtocolo`, `orgaoOrigem`, `unidadeOrigem`, `especieTipoDocumental`, `assunto`, `dataUltimaAtualizacao`) VALUES (3, 'nup 3', '3', 'numeroOrigiemProtocolo1', 3, 3, 'especieTipoDocumental3', 'prestação de serviço', NOW());
COMMIT;

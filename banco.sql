-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.5.55-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para mvcteste
CREATE DATABASE IF NOT EXISTS `mvcteste` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mvcteste`;


-- Copiando estrutura para tabela mvcteste.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `situacao` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela mvcteste.categoria: ~1 rows (aproximadamente)
DELETE FROM `categoria`;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id`, `descricao`, `situacao`) VALUES
	(1, 'fruta', 'A'),
	(2, 'bicho', 'A');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;


-- Copiando estrutura para tabela mvcteste.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `idEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `situacao` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela mvcteste.empresa: ~4 rows (aproximadamente)
DELETE FROM `empresa`;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` (`idEmpresa`, `nome`, `situacao`) VALUES
	(2, 'Uespar', 'A'),
	(3, 'Empresa do Marlão', 'I'),
	(4, 'Empresa Teste', 'A'),
	(5, 'Faliu essa Aqui', 'A');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;


-- Copiando estrutura para tabela mvcteste.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `valor` double NOT NULL,
  `situacao` char(1) NOT NULL DEFAULT 'A',
  `idcategoria` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produto_categoria` (`idcategoria`),
  CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela mvcteste.produto: ~0 rows (aproximadamente)
DELETE FROM `produto`;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`id`, `nome`, `valor`, `situacao`, `idcategoria`) VALUES
	(1, 'teste', 1, 'A', 1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;


-- Copiando estrutura para tabela mvcteste.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `senha` varchar(32) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `thumbnail_path` varchar(100) DEFAULT NULL,
  `idempresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_emp_usu` (`idempresa`),
  CONSTRAINT `fk_emp_usu` FOREIGN KEY (`idempresa`) REFERENCES `empresa` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela mvcteste.usuario: ~0 rows (aproximadamente)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `nome`, `login`, `senha`, `status`, `thumbnail_path`, `idempresa`) VALUES
	(1, 'Joseph', 'admin', 'admin', 'A', './img/noimage.png', 5),
	(2, 'teste', 'teste', 'teste', 'A', './img/noimage.png', 4),
	(3, 'teste2', 'teste2', 'teste2', 'A', './img/noimage.png', 3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

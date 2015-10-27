-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 26-Out-2015 às 23:29
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `piv`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo_usuario`
--

CREATE TABLE IF NOT EXISTS `grupo_usuario` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` text,
  `site` varchar(255) DEFAULT NULL,
  `imagem` text,
  `endereco` text,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lista_amigos`
--

CREATE TABLE IF NOT EXISTS `lista_amigos` (
  `codUsuario` int(11) NOT NULL,
  `codAmigo` int(11) NOT NULL,
  PRIMARY KEY (`codUsuario`,`codAmigo`),
  KEY `codAmigo` (`codAmigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem`
--

CREATE TABLE IF NOT EXISTS `mensagem` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `mensagem` text,
  `dataEnvio` datetime DEFAULT NULL,
  `codTopico` int(11) DEFAULT NULL,
  `codUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codUsuario` (`codUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `nivel_usuario`
--

CREATE TABLE IF NOT EXISTS `nivel_usuario` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `nivel_usuario`
--

INSERT INTO `nivel_usuario` (`codigo`, `nome`) VALUES
(1, 'Administrador'),
(2, 'Moderador'),
(3, 'Comum'),
(4, 'Gerente'),
(5, 'Editor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `programacao`
--

CREATE TABLE IF NOT EXISTS `programacao` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` text,
  `dataEvento` date DEFAULT NULL,
  `horaInicio` datetime DEFAULT NULL,
  `horaFim` datetime DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `topico`
--

CREATE TABLE IF NOT EXISTS `topico` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `horaCriacao` date DEFAULT NULL,
  `popularidade` int(11) DEFAULT NULL,
  `codUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codUsuario` (`codUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `descricao` text,
  `dataCadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_grupo`
--

CREATE TABLE IF NOT EXISTS `usuario_grupo` (
  `codUsuario` int(11) NOT NULL,
  `codGrupo` int(11) NOT NULL,
  PRIMARY KEY (`codUsuario`,`codGrupo`),
  KEY `codGrupo` (`codGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `lista_amigos`
--
ALTER TABLE `lista_amigos`
  ADD CONSTRAINT `lista_amigos_ibfk_1` FOREIGN KEY (`codUsuario`) REFERENCES `usuario` (`codigo`),
  ADD CONSTRAINT `lista_amigos_ibfk_2` FOREIGN KEY (`codAmigo`) REFERENCES `usuario` (`codigo`);

--
-- Limitadores para a tabela `mensagem`
--
ALTER TABLE `mensagem`
  ADD CONSTRAINT `mensagem_ibfk_2` FOREIGN KEY (`codUsuario`) REFERENCES `usuario` (`codigo`),
  ADD CONSTRAINT `mensagem_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `topico` (`codigo`);

--
-- Limitadores para a tabela `topico`
--
ALTER TABLE `topico`
  ADD CONSTRAINT `topico_ibfk_1` FOREIGN KEY (`codUsuario`) REFERENCES `usuario` (`codigo`);

--
-- Limitadores para a tabela `usuario_grupo`
--
ALTER TABLE `usuario_grupo`
  ADD CONSTRAINT `usuario_grupo_ibfk_1` FOREIGN KEY (`codUsuario`) REFERENCES `usuario` (`codigo`),
  ADD CONSTRAINT `usuario_grupo_ibfk_2` FOREIGN KEY (`codGrupo`) REFERENCES `grupo_usuario` (`codigo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

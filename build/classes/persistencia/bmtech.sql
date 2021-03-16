-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 04-Mar-2021 às 13:45
-- Versão do servidor: 10.1.39-MariaDB
-- versão do PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bmtech`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso_restrito`
--

CREATE TABLE `acesso_restrito` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(40) COLLATE utf8_bin NOT NULL,
  `telefone` varchar(16) COLLATE utf8_bin NOT NULL,
  `login` varchar(15) COLLATE utf8_bin NOT NULL,
  `senha` varchar(8) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `codcliente` int(11) NOT NULL,
  `nome` varchar(30) COLLATE utf8_bin NOT NULL,
  `cpf` varchar(14) COLLATE utf8_bin NOT NULL,
  `dtnasc` date NOT NULL,
  `cep` varchar(9) COLLATE utf8_bin NOT NULL,
  `endereco` varchar(35) COLLATE utf8_bin NOT NULL,
  `numero` varchar(10) COLLATE utf8_bin NOT NULL,
  `complemento` varchar(15) COLLATE utf8_bin NOT NULL,
  `bairro` varchar(20) COLLATE utf8_bin NOT NULL,
  `cidade` varchar(20) COLLATE utf8_bin NOT NULL,
  `estado` varchar(15) COLLATE utf8_bin NOT NULL,
  `email` varchar(30) COLLATE utf8_bin NOT NULL,
  `senha` varchar(8) COLLATE utf8_bin NOT NULL,
  `imagem` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `codpedido` int(11) NOT NULL,
  `qtd` int(11) NOT NULL,
  `sub` double(10,2) NOT NULL,
  `total` double(10,2) NOT NULL,
  `datacompra` date NOT NULL,
  `codproduto` int(11) NOT NULL,
  `codcliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `codproduto` int(11) NOT NULL,
  `descricao` varchar(50) COLLATE utf8_bin NOT NULL,
  `categoria` varchar(25) COLLATE utf8_bin NOT NULL,
  `preco` double NOT NULL,
  `imagem` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`codproduto`, `descricao`, `categoria`, `preco`, `imagem`) VALUES
(1, 'Mouse Gamer', 'perifericos', 150, 'mousegamer.png'),
(2, 'Mouse BM', 'perifericos', 35, 'mousebm.png'),
(3, 'Teclado Gamer', 'perifericos', 200, 'tecladogamer.png'),
(4, 'Teclado BM', 'perifericos', 40, 'tecladobm.png'),
(5, 'Monitor BM 24', 'Monitores', 600, 'monitor24.png'),
(6, 'Monitor BM 21', 'Monitores', 400, 'monitor21.png'),
(7, 'MousePad BM', '20.0', 0, 'mousepad.png'),
(8, 'Cadeira Gamer x150', 'multiuso', 500, 'cadeira.png'),
(9, 'Processador Intel', 'Hardware', 700, 'processadorintel.png'),
(10, 'Processador AMD', 'Hardware', 700, 'processadoramd.png'),
(11, 'Placa de Video bm1100', 'Hardware', 950, 'placadevideo.png'),
(12, 'Memória RAM 4gb BM*', 'Hardware', 250, 'memoriaram.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acesso_restrito`
--
ALTER TABLE `acesso_restrito`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codcliente`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`codpedido`),
  ADD KEY `codcliente` (`codcliente`),
  ADD KEY `codproduto` (`codproduto`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codproduto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acesso_restrito`
--
ALTER TABLE `acesso_restrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codcliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `codpedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `codproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`codcliente`) REFERENCES `cliente` (`codcliente`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`codproduto`) REFERENCES `produto` (`codproduto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

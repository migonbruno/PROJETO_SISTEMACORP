-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 16-Mar-2021 às 14:43
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
  `id_cliente` int(6) NOT NULL,
  `cpf` bigint(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `data_nascimento` varchar(11) NOT NULL,
  `telefone` bigint(15) NOT NULL,
  `email` varchar(35) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `cartao_credito` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_endereco`
--

CREATE TABLE `cliente_endereco` (
  `id_end_cli` int(6) NOT NULL,
  `id_cliente` int(6) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` int(11) NOT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `cep` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE `compra` (
  `id_compra` int(6) NOT NULL,
  `id_cliente` int(6) NOT NULL,
  `data_compra` varchar(15) NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `id_pedido` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrega`
--

CREATE TABLE `entrega` (
  `id_entrega` int(6) NOT NULL,
  `data_entrega` varchar(15) NOT NULL,
  `id_pedido` int(6) NOT NULL,
  `id_funcionario` int(6) NOT NULL,
  `preco_entrega` float(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fale`
--

CREATE TABLE `fale` (
  `id_fale` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  `assunto` varchar(60) NOT NULL,
  `mensagem` varchar(400) NOT NULL,
  `promo` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fale`
--

INSERT INTO `fale` (`id_fale`, `nome`, `email`, `telefone`, `assunto`, `mensagem`, `promo`) VALUES
(1, 'AUHEUAHE', 'auehuahe', 'auehaueh', 'Sugestões', 'aeaeaeae', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id_funcionario` int(6) NOT NULL,
  `cpf` bigint(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `data_nascimento` varchar(11) NOT NULL,
  `telefone` bigint(15) NOT NULL,
  `email` varchar(35) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `carteira_trabalho` bigint(20) NOT NULL,
  `cargo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario_endereco`
--

CREATE TABLE `funcionario_endereco` (
  `id_end_func` int(6) NOT NULL,
  `id_funcionario` int(6) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` int(11) NOT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `cep` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(6) NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `id_produto` int(6) NOT NULL,
  `quantidade` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(30) COLLATE utf8_bin NOT NULL,
  `descricao` varchar(50) COLLATE utf8_bin NOT NULL,
  `categoria` varchar(25) COLLATE utf8_bin NOT NULL,
  `valor` double NOT NULL,
  `imagem` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome`, `descricao`, `categoria`, `valor`, `imagem`) VALUES
(3, 'Monitor para PC LED ', 'Monitor tela LED para joga em alta definição', 'monitores', 529.9, 'led.png'),
(4, 'Monitor Full HD 23.8', 'Monitor Full HD para aproveitar o melhor dos jogos', 'monitores', 759.9, '238.png'),
(5, 'Monitor Tela Curva A', 'Monitor de 4K e Tela curva', 'monitores', 2139.99, 'telacurva.png'),
(6, 'Monitor LG Ultrawide', 'Monitor com tela com a melhor definição ', 'monitores', 1379.9, 'ultrawide.png'),
(13, 'Mouse Gamer RGB', 'Mouse com led em RGB', 'periféricos', 51.9, 'mousegamer.png'),
(14, 'Teclado Gamer RGB', 'Teclado com LED RGB', 'periféricos', 58.6, 'tecladogamer.png'),
(15, 'Gabinete c3 Plus', 'Gabinete para seu hardware', 'multiuso', 159.9, 'gabinete.png'),
(16, 'Headset Logitech', 'Headset para jogar e conversar', 'periféricos', 399, 'headset.png'),
(17, 'Mouse Razer', 'Melhor da tecnologia razer', 'periféricos', 878.9, 'mouserazer.png'),
(25, 'Cadeira Gamer', 'Conforto enquanto joga', 'multiuso', 749.9, 'cadeiragamer.png'),
(26, 'Mesa p/ Desktop', 'Espaço para seu computador', 'multiuso', 244.9, 'mesapc.png'),
(27, 'Impressora HP Laserjet', 'Imprima também seus documentos', 'multiuso', 2649, 'impressora.png'),
(28, 'Mousepad LED', 'Para seu conforto enquanto se diverte', 'periféricos', 95.5, 'mousepad.png'),
(30, 'Placa Mãe Gigabyte', 'Melhor da tecnologia', 'hardware', 799.9, 'placamae.png'),
(31, 'Memória RAM Hyperx 4GB', 'Velocidade para seus jogos e programas', 'hardware', 195, 'memoriaram.png'),
(32, 'Processador AMD Ryzen 7', 'Além de tudo vem com placa gráfica integrada', 'hardware', 1999.9, 'processador.png'),
(33, 'SSD Kingston 128gb', 'Velocidade para iniciar seu PC', 'hardware', 179.99, 'ssd.png');

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
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `cliente_endereco`
--
ALTER TABLE `cliente_endereco`
  ADD PRIMARY KEY (`id_end_cli`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indexes for table `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indexes for table `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`id_entrega`),
  ADD KEY `id_funcionario` (`id_funcionario`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indexes for table `fale`
--
ALTER TABLE `fale`
  ADD PRIMARY KEY (`id_fale`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Indexes for table `funcionario_endereco`
--
ALTER TABLE `funcionario_endereco`
  ADD PRIMARY KEY (`id_end_func`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`);

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
  MODIFY `id_cliente` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cliente_endereco`
--
ALTER TABLE `cliente_endereco`
  MODIFY `id_end_cli` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fale`
--
ALTER TABLE `fale`
  MODIFY `id_fale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_funcionario` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `funcionario_endereco`
--
ALTER TABLE `funcionario_endereco`
  MODIFY `id_end_func` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cliente_endereco`
--
ALTER TABLE `cliente_endereco`
  ADD CONSTRAINT `cliente_endereco_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

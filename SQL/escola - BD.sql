-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19/01/2023 às 14:23
-- Versão do servidor: 10.4.8-MariaDB
-- Versão do PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `cod_aluno` int(11) NOT NULL,
  `cpf` char(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` char(14) NOT NULL,
  `data_nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `alunos`
--

INSERT INTO `alunos` (`cod_aluno`, `cpf`, `nome`, `email`, `telefone`, `data_nascimento`) VALUES
(1, '53513343051', 'Maria Eduarda', 'maria@gmail.com', '995001055', '2000-05-05'),
(2, '81706904045', 'João Pedro', 'joão@gmail.com', '995008060', '2000-02-25'),
(3, '34846708004', 'Sarah Menezes', 'sarah@gmail.com', '995009020', '2003-02-10'),
(4, '34846708004', 'Vitor Freitas', 'vitor@gmail.com', '992557052', '2002-10-15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `cod_cursos` int(10) UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `requisito` varchar(250) DEFAULT NULL,
  `carga_horaria` smallint(5) UNSIGNED DEFAULT NULL,
  `preco` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `cursos`
--

INSERT INTO `cursos` (`cod_cursos`, `nome`, `requisito`, `carga_horaria`, `preco`) VALUES
(1, 'JavaScript', '18 anos', 30, 99),
(2, 'Java', '18 anos', 30, 79),
(3, 'Python', '18 anos', 40, 200);

-- --------------------------------------------------------

--
-- Estrutura para tabela `matriculas`
--

CREATE TABLE `matriculas` (
  `cod_matricula` int(10) UNSIGNED NOT NULL,
  `cod_turma` int(10) UNSIGNED NOT NULL,
  `cod_aluno` int(11) NOT NULL,
  `data_matricula` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `matriculas`
--

INSERT INTO `matriculas` (`cod_matricula`, `cod_turma`, `cod_aluno`, `data_matricula`) VALUES
(10, 1, 1, '2022-03-02'),
(20, 2, 2, '2022-03-02'),
(30, 3, 3, '2022-03-02'),
(40, 4, 4, '2022-03-02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `professores`
--

CREATE TABLE `professores` (
  `cod_prof` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `valor_hora` int(10) UNSIGNED DEFAULT NULL,
  `certificados` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `professores`
--

INSERT INTO `professores` (`cod_prof`, `nome`, `email`, `valor_hora`, `certificados`) VALUES
(1, 'Daniel Gomes', 'danielprof@gmail.com', 60, 'Java Avançado'),
(2, 'Aline Rodrigues', 'alineprof@gmail.com', 50, 'Python Avançado'),
(3, 'Daniela', 'danielaprof@gmail.com', 60, 'JavaScript Avançado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `cod_turma` int(10) UNSIGNED NOT NULL,
  `cod_aluno` int(11) NOT NULL,
  `cod_prof` int(11) NOT NULL,
  `cod_cursos` int(10) UNSIGNED NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_final` date DEFAULT NULL,
  `carga_horaria` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `turmas`
--

INSERT INTO `turmas` (`cod_turma`, `cod_aluno`, `cod_prof`, `cod_cursos`, `data_inicio`, `data_final`, `carga_horaria`) VALUES
(1, 1, 1, 2, '2022-03-02', '2023-09-01', 30),
(2, 2, 1, 2, '2022-03-02', '2023-09-01', 30),
(3, 3, 3, 1, '2022-03-02', '2023-09-01', 30),
(4, 4, 2, 3, '2022-03-02', '2023-09-01', 30);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`cod_aluno`);

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`cod_cursos`);

--
-- Índices de tabela `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`cod_matricula`),
  ADD KEY `matriculas_FKaluno` (`cod_aluno`),
  ADD KEY `matriculas_FKturma` (`cod_turma`);

--
-- Índices de tabela `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`cod_prof`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`cod_turma`),
  ADD KEY `turmas_FKaluno` (`cod_aluno`),
  ADD KEY `turmas_FKprof` (`cod_prof`),
  ADD KEY `turmas_FKcursos` (`cod_cursos`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `cod_aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `cod_cursos` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `cod_matricula` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `professores`
--
ALTER TABLE `professores`
  MODIFY `cod_prof` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `cod_turma` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`cod_aluno`) REFERENCES `alunos` (`cod_aluno`),
  ADD CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`cod_turma`) REFERENCES `turmas` (`cod_turma`);

--
-- Restrições para tabelas `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`cod_aluno`) REFERENCES `alunos` (`cod_aluno`),
  ADD CONSTRAINT `turmas_ibfk_2` FOREIGN KEY (`cod_cursos`) REFERENCES `cursos` (`cod_cursos`),
  ADD CONSTRAINT `turmas_ibfk_3` FOREIGN KEY (`cod_prof`) REFERENCES `professores` (`cod_prof`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

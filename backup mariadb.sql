-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           8.0.29 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para chavaburg
CREATE DATABASE IF NOT EXISTS `chavaburg` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `chavaburg`;

-- Copiando estrutura para tabela chavaburg.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.auth_group: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.auth_group_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `chavaburg3`.`django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.auth_permission: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.auth_user: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(2, 'pbkdf2_sha256$260000$8VW0Ctzhqo3XwbnFG1vqxQ$olI39owJ0y15AGs6CK9j2FsGLX98R2RFJ25FKkH9m9Q=', '2021-10-27 15:23:42.646098', 1, 'chaves', '', '', '', 1, 1, '2021-05-27 14:35:46.031182');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.auth_user_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.auth_user_user_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.colaborador
CREATE TABLE IF NOT EXISTS `colaborador` (
  `login` varchar(12) NOT NULL,
  `senha` varchar(32) DEFAULT NULL,
  `pessoa` int DEFAULT NULL,
  `funcao` varchar(45) DEFAULT '000',
  `aniversario` date DEFAULT NULL,
  `setor` int DEFAULT '1',
  `sbase` float DEFAULT '4.99',
  `registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `passweb` varchar(17) DEFAULT NULL,
  `status` int DEFAULT '0',
  `terminal` varchar(45) DEFAULT NULL,
  `dias_escala` int DEFAULT '0',
  `horas_escala` float DEFAULT '0',
  PRIMARY KEY (`login`),
  KEY `pessoacolaborador_idx` (`pessoa`),
  CONSTRAINT `pessoacolaborador` FOREIGN KEY (`pessoa`) REFERENCES `pessoa` (`idpessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.colaborador: ~23 rows (aproximadamente)
/*!40000 ALTER TABLE `colaborador` DISABLE KEYS */;
INSERT INTO `colaborador` (`login`, `senha`, `pessoa`, `funcao`, `aniversario`, `setor`, `sbase`, `registro`, `passweb`, `status`, `terminal`, `dias_escala`, `horas_escala`) VALUES
	('alef', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '4', '2021-06-04', 1, 5.19, '2021-06-04 09:01:13', NULL, 1, NULL, 0, 0),
	('antonio', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '2', '2021-05-20', 1, 5.19, '2021-05-20 14:44:15', 'B818D09C68d17828', 1, NULL, 0, 112),
	('autoweb', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '4', '2021-07-13', 1, 5.19, '2021-07-13 15:11:52', NULL, 1, NULL, 0, 0),
	('bruno h', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '3', '2021-05-20', 1, 5.19, '2021-05-20 14:44:15', 'B818D09C68d17828', 1, NULL, 0, 121),
	('catia maria', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '2', '2021-05-20', 1, 5.19, '2021-05-20 14:44:15', 'B818D09C68d17828', 1, NULL, 0, 109),
	('chaves', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '29', '2021-05-20', 1, 9.49, '2021-05-20 14:44:15', 'C81BAB532Bd17828', 1, NULL, 0, 133),
	('daniel', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '4', '2021-06-04', 1, 5.19, '2021-06-04 09:01:13', 'B818D09C68d17828', 1, NULL, 0, 0),
	('felipe', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '4', '2021-06-04', 1, 5.19, '2021-06-04 09:01:13', 'C81BAB532Bd17828', 1, NULL, 0, 0),
	('fernando', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '4', '2021-06-04', 1, 5.19, '2021-06-04 09:01:13', NULL, 1, NULL, 0, 0),
	('gabriel', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '4', '2021-06-04', 1, 5.19, '2021-06-04 09:01:13', NULL, 1, NULL, 0, 0),
	('guilherme', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '4', '2021-06-04', 1, 5.19, '2021-06-04 09:01:13', NULL, 1, NULL, 0, 0),
	('jose augusto', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '2', '2021-05-20', 1, 5.19, '2021-05-20 14:44:15', 'B818D09C68d17828', 1, NULL, 0, 98),
	('laryssa', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '4', '2021-06-04', 1, 5.19, '2021-06-04 09:01:13', NULL, 1, NULL, 0, 0),
	('leonardo', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '3', '2021-05-20', 1, 5.19, '2021-05-20 14:44:15', 'B818D09C68d17828', 1, NULL, 0, 113),
	('marcos', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '4', '2021-06-04', 1, 5.19, '2021-06-04 09:01:13', NULL, 1, NULL, 0, 0),
	('matheus', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '4', '2021-06-04', 1, 5.19, '2021-06-04 09:01:13', NULL, 1, NULL, 0, 0),
	('paula olivia', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '2', '2021-05-20', 1, 5.19, '2021-05-20 14:44:15', 'B818D09C68d17828', 1, NULL, 0, 109),
	('thiago', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '4', '2021-06-04', 1, 5.19, '2021-06-04 09:01:13', NULL, 1, NULL, 0, 0),
	('valeria', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '2', '2021-05-20', 1, 5.19, '2021-05-20 14:44:15', 'B818D09C68d17828', 1, NULL, 0, 117),
	('vanderleia', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '4', '2021-06-04', 1, 5.19, '2021-06-04 09:01:13', NULL, 1, NULL, 0, 0),
	('victor', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '4', '2021-06-04', 1, 5.19, '2021-06-04 09:01:13', NULL, 1, NULL, 0, 0),
	('vinicius', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '4', '2021-06-04', 1, 5.19, '2021-06-04 09:01:13', NULL, 1, NULL, 0, 0),
	('webchava', 'C2BA1BC54B239208CB37B901C0D3B363', 1, '4', '2021-06-04', 1, 5.19, '2021-06-04 09:01:13', NULL, 1, NULL, 0, 0);
/*!40000 ALTER TABLE `colaborador` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.comanda
CREATE TABLE IF NOT EXISTS `comanda` (
  `idp` int NOT NULL AUTO_INCREMENT,
  `comanda` int DEFAULT NULL,
  `produto` int DEFAULT NULL,
  `qtd` int DEFAULT NULL,
  `vendedor` varchar(12) DEFAULT NULL,
  `status` int DEFAULT '0',
  `janela` int DEFAULT '0',
  `registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valorund` float DEFAULT '0',
  `observacao` text,
  PRIMARY KEY (`idp`),
  KEY `produto_idx` (`produto`),
  KEY `vendedor_idx` (`vendedor`),
  KEY `cmdPedido` (`comanda`),
  CONSTRAINT `cmdPedido` FOREIGN KEY (`comanda`) REFERENCES `pedido` (`idpedido`),
  CONSTRAINT `produto` FOREIGN KEY (`produto`) REFERENCES `produtos` (`idprodutos`),
  CONSTRAINT `vendedor` FOREIGN KEY (`vendedor`) REFERENCES `colaborador` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.comanda: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `comanda` DISABLE KEYS */;
INSERT INTO `comanda` (`idp`, `comanda`, `produto`, `qtd`, `vendedor`, `status`, `janela`, `registro`, `valorund`, `observacao`) VALUES
	(3, 2, 3, 1, 'chaves', 0, 0, '2022-09-06 19:27:46', 25.46, NULL),
	(4, 2, 203, 2, 'chaves', 0, 0, '2022-09-06 19:27:53', 25.46, NULL),
	(5, 2, 1010, 4, 'chaves', 0, 0, '2022-09-06 19:28:04', 5.1, NULL),
	(10, 3, 1, 2, 'chaves', 0, 0, '2022-09-09 18:14:05', 33.91, NULL),
	(15, 1, 1, 1, 'chaves', 0, 0, '2022-09-10 04:43:46', 37.5, NULL),
	(16, 1, 1012, 2, 'chaves', 0, 0, '2022-09-21 17:33:28', 6.46, NULL);
/*!40000 ALTER TABLE `comanda` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.cupons
CREATE TABLE IF NOT EXISTS `cupons` (
  `cupom` int NOT NULL,
  `validador` char(17) DEFAULT NULL,
  `nomepromo` varchar(42) DEFAULT 'Promo',
  `valor` float DEFAULT '-9.95',
  `disponibilidade` int DEFAULT '10',
  `registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `validade` date DEFAULT NULL,
  `prazo` int DEFAULT '90',
  `responsavel` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`cupom`),
  KEY `responsavel_colaborador_idx` (`responsavel`),
  CONSTRAINT `responsavel_colaborador` FOREIGN KEY (`responsavel`) REFERENCES `colaborador` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.cupons: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cupons` DISABLE KEYS */;
INSERT INTO `cupons` (`cupom`, `validador`, `nomepromo`, `valor`, `disponibilidade`, `registro`, `validade`, `prazo`, `responsavel`) VALUES
	(1, 'Ab54252F9D67e755', 'pizza dobro', -9.95, 10, '2021-10-29 14:30:02', '2021-10-29', 90, 'chaves'),
	(2, '7b5F2BE10767e755', 'esfirra dobro', -9.95, 10, '2021-10-29 14:31:03', '2021-10-29', 90, NULL),
	(3, NULL, 'hamburguer dobro', -9.95, 10, '2021-10-29 14:31:58', '2021-10-29', 90, NULL);
/*!40000 ALTER TABLE `cupons` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.cupon_relatorio
CREATE TABLE IF NOT EXISTS `cupon_relatorio` (
  `idcupon_relatorio` int NOT NULL AUTO_INCREMENT,
  `cupom` int DEFAULT NULL,
  `cliente` varchar(32) DEFAULT NULL,
  `colaborador` varchar(12) DEFAULT NULL,
  `pesquisa` int DEFAULT NULL,
  `validoate` date DEFAULT NULL,
  PRIMARY KEY (`idcupon_relatorio`),
  KEY `cupon_relatorio_idx` (`cupom`),
  KEY `cupon_cliente_idx` (`cliente`),
  KEY `cupon_colaborador_idx` (`colaborador`),
  KEY `cupon_pesquisa_idx` (`pesquisa`),
  CONSTRAINT `cupon_cliente` FOREIGN KEY (`cliente`) REFERENCES `usuario` (`usuario`),
  CONSTRAINT `cupon_colaborador` FOREIGN KEY (`colaborador`) REFERENCES `colaborador` (`login`),
  CONSTRAINT `cupon_pesquisa` FOREIGN KEY (`pesquisa`) REFERENCES `pesquisa` (`registro`),
  CONSTRAINT `cupon_relatorio` FOREIGN KEY (`cupom`) REFERENCES `cupons` (`cupom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.cupon_relatorio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cupon_relatorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupon_relatorio` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.django_admin_log: ~62 rows (aproximadamente)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2021-07-26 17:04:12.037697', '16', '16 1', 3, '', 9, 2),
	(2, '2021-07-26 17:04:12.039233', '15', '15 1', 3, '', 9, 2),
	(3, '2021-07-26 17:04:12.041762', '14', '14 2', 3, '', 9, 2),
	(4, '2021-07-26 17:04:12.043087', '13', '13 2', 3, '', 9, 2),
	(5, '2021-07-26 17:04:12.044192', '12', '12 1', 3, '', 9, 2),
	(6, '2021-07-26 17:04:12.045203', '11', '11 2', 3, '', 9, 2),
	(7, '2021-07-26 17:04:23.590151', '2', '2 teste', 3, '', 8, 2),
	(8, '2021-07-26 17:04:23.592119', '1', '1 chaves', 3, '', 8, 2),
	(9, '2021-08-30 13:12:01.601690', '8', 'hannibal ® (disponibilidade: 7)', 2, '[{"changed": {"fields": ["Valororiginal", "Bonus"]}}]', 10, 2),
	(10, '2021-08-30 13:17:50.344942', '1012', 'suco laranja (disponibilidade: 78)', 2, '[{"changed": {"fields": ["Valororiginal", "Disponibilidade", "Bonus", "Descr"]}}]', 10, 2),
	(11, '2021-08-30 13:20:10.359096', '1012', 'suco laranja (disponibilidade: 78)', 2, '[{"changed": {"fields": ["Federal", "Icms", "Descr"]}}]', 10, 2),
	(12, '2021-10-21 09:23:17.486835', '110', '110 11', 3, '', 9, 2),
	(13, '2021-10-21 09:23:17.488989', '109', '109 1', 3, '', 9, 2),
	(14, '2021-10-21 09:23:17.490342', '108', '108 5', 3, '', 9, 2),
	(15, '2021-10-21 09:23:17.491763', '107', '107 5', 3, '', 9, 2),
	(16, '2021-10-21 09:23:17.493236', '106', '106 10', 3, '', 9, 2),
	(17, '2021-10-21 09:23:17.494517', '105', '105 9', 3, '', 9, 2),
	(18, '2021-10-21 09:23:17.495887', '104', '104 9', 3, '', 9, 2),
	(19, '2021-10-21 09:23:17.497156', '103', '103 9', 3, '', 9, 2),
	(20, '2021-10-21 09:23:17.498168', '102', '102 9', 3, '', 9, 2),
	(21, '2021-10-21 09:23:24.788844', '11', '11 julieta', 3, '', 8, 2),
	(22, '2021-10-21 09:23:24.790701', '10', '10 manoela', 3, '', 8, 2),
	(23, '2021-10-21 09:23:24.791714', '9', '9 teste2', 3, '', 8, 2),
	(24, '2021-10-21 09:23:24.793785', '8', '8 julio', 3, '', 8, 2),
	(25, '2021-10-21 09:23:24.795207', '7', '7 julia', 3, '', 8, 2),
	(26, '2021-10-21 09:23:24.796877', '6', '6 juliete', 3, '', 8, 2),
	(27, '2021-10-21 09:23:24.798418', '5', '5 davidson', 3, '', 8, 2),
	(28, '2021-10-21 09:23:24.799657', '4', '4 davidson', 3, '', 8, 2),
	(29, '2021-10-21 09:23:24.800840', '3', '3 felipe', 3, '', 8, 2),
	(30, '2021-10-21 09:23:24.801717', '2', '2 teste', 3, '', 8, 2),
	(31, '2021-10-21 09:23:24.803726', '1', '1 chaves', 3, '', 8, 2),
	(32, '2021-10-21 09:23:56.882910', '11', '11 julieta', 2, '[{"changed": {"fields": ["Colaborador", "Status"]}}]', 8, 2),
	(33, '2021-10-21 09:24:34.324376', '11', '11 julieta', 2, '[{"changed": {"fields": ["Status"]}}]', 8, 2),
	(34, '2021-10-21 09:25:46.947186', '11', '11 julieta', 2, '[{"changed": {"fields": ["Status"]}}]', 8, 2),
	(35, '2021-10-27 15:23:56.651154', '157', '157 16', 3, '', 9, 2),
	(36, '2021-10-27 15:23:56.653170', '156', '156 16', 3, '', 9, 2),
	(37, '2021-10-27 15:23:56.654166', '155', '155 16', 3, '', 9, 2),
	(38, '2021-10-27 15:23:56.656167', '154', '154 16', 3, '', 9, 2),
	(39, '2021-10-27 15:23:56.657167', '153', '153 1', 3, '', 9, 2),
	(40, '2021-10-27 15:23:56.659166', '149', '149 1', 3, '', 9, 2),
	(41, '2021-10-27 15:23:56.660167', '141', '141 2', 3, '', 9, 2),
	(42, '2021-10-27 15:23:56.661166', '140', '140 2', 3, '', 9, 2),
	(43, '2021-10-27 15:23:56.665516', '138', '138 2', 3, '', 9, 2),
	(44, '2021-10-27 15:23:56.667370', '123', '123 15', 3, '', 9, 2),
	(45, '2021-10-27 15:23:56.668433', '122', '122 15', 3, '', 9, 2),
	(46, '2021-10-27 15:24:06.674205', '17', '17 chavalo', 3, '', 8, 2),
	(47, '2021-10-27 15:24:06.675960', '16', '16 chaves', 3, '', 8, 2),
	(48, '2021-10-27 15:24:06.677464', '15', '15 manoelo', 3, '', 8, 2),
	(49, '2021-10-27 15:24:06.679213', '14', '14 manoelo', 3, '', 8, 2),
	(50, '2021-10-27 15:24:06.680204', '13', '13 manoelo', 3, '', 8, 2),
	(51, '2021-10-27 15:24:06.681716', '12', '12 manoelo', 3, '', 8, 2),
	(52, '2021-10-27 15:24:06.683733', '11', '11 julieta', 3, '', 8, 2),
	(53, '2021-10-27 15:24:06.686687', '10', '10 manoela', 3, '', 8, 2),
	(54, '2021-10-27 15:24:06.687956', '9', '9 teste2', 3, '', 8, 2),
	(55, '2021-10-27 15:24:06.689182', '8', '8 julio', 3, '', 8, 2),
	(56, '2021-10-27 15:24:06.690194', '7', '7 julia', 3, '', 8, 2),
	(57, '2021-10-27 15:24:06.692150', '6', '6 juliete', 3, '', 8, 2),
	(58, '2021-10-27 15:24:06.693735', '5', '5 davidson', 3, '', 8, 2),
	(59, '2021-10-27 15:24:06.694976', '4', '4 davidson', 3, '', 8, 2),
	(60, '2021-10-27 15:24:06.695985', '3', '3 felipe', 3, '', 8, 2),
	(61, '2021-10-27 15:24:06.696985', '2', '2 teste', 3, '', 8, 2),
	(62, '2021-10-27 15:24:06.698986', '1', '1 chaves', 3, '', 8, 2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.django_content_type: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(9, 'navegador', 'comanda'),
	(8, 'navegador', 'pedido'),
	(10, 'navegador', 'produtos'),
	(7, 'navegador', 'usuario');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.django_migrations: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.django_session: ~160 rows (aproximadamente)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('0j8wjo6v4qi3azn7qmuofuxjd7svqw6z', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJ0ZXN0ZTIiLCJpZHBlZGlkbyI6OX0:1mcTJn:dl60WEhpo_Yw9wbTxqH4ZKEJPp7n8ZIU4rghFC7qmfA', '2021-11-01 11:08:47.019732'),
	('12coesdnfjbrph6sof8kkag4yd142p69', 'eyJwYWdpbmEiOiJwcmluY2lwYWwiLCJfc2Vzc2lvbl9leHBpcnkiOjB9:1oWiko:QtiRQId1HaCrFM7s02wTsbFbtrBXSv2yzPhIGfYcGNY', '2022-09-23 18:29:26.965228'),
	('186osfsbxn3okjc2cd1zdm105ahpjehw', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1mP38O:TYZjKctSH8q-M-jm6EsweSqHgSqewT42zIwWt7RQwwI', '2021-09-25 10:33:32.647020'),
	('1h4enq2fzr0lu3ke219vnholy4k5sgfg', 'eyJwYWdpbmEiOiJjYXJkYXBpbyIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mdcTz:zAdN208YUE4UzmtyRpK0FzYBBELFQVwf5uwlBrszFzc', '2021-11-04 15:08:03.220928'),
	('1ique3lrdeole8s1g5dgn8szixeedd10', '.eJwdyjEKgDAMBdC7ZO7g4tLLSGiifJQkNCCKeHeL6-M9FLzBmCo1t1W7WgNToSU1E26LXoF-U50KGdrOoQfExxc-Iek2MiRUfp3fD7gdHM8:1md3mp:mxER1XCbnAL_1OgTRLmgh44fxpfeetrHwS1vmzIHlGk', '2021-11-03 02:05:11.099917'),
	('1iuyxgxea0m0ppc9owb068wkdvwvhf6w', 'eyJwYWdpbmEiOiJwaXp6YXMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9:1ob33d:I5YbEc574QQTsTDyY2IApBuSLe-B4tRaE22SIg1bMjQ', '2022-10-05 16:58:45.608517'),
	('1l1auxgi2p4pq3xrgylsn3jqyh8xkxtu', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mciNj:YAFRmv7xtPqC9RlVQq5a2qnuYG1SIuxxVi6zM0UtRDI', '2021-11-02 03:13:51.921119'),
	('25kjuzve5p31l371jrofdgtq9v8mjrb4', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1mP3A3:vMeFuBE5yzy1YXVW7c2c-067sogBHeEL9te6NkUjYWs', '2021-09-25 10:35:15.987319'),
	('2duz4i4akhcte2jhh2eqbuyv02dobttp', '.eJxVjMsKwyAQAP_FcxHdal7H3vsNsq5LYls0aAItpf_eBHLJdWaYr5hxjAnFIAgD1qVkcRGucq0xJ8fvOZaPGNTGcF0mt1YuLoYtB3FiHunJaRfhgWnMknJaSvRyT-Rhq7znwK_b0Z4GE9Zp32Kvr9yaAMCsOo-2ZyJLVmvo0KimBVbXjq1G0jYQGQ4eFBiApg19I35_TPVFdw:1m844I:g5JzI6enbSHiX8RIxPeEYZYNoa-hYo8otWK8f_2jIH4', '2021-08-09 14:07:06.656237'),
	('2i50no6yedfal80upnwtc4xy4lyyt622', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJ0ZXN0ZSIsImlkcGVkaWRvIjoyfQ:1mfaYO:tHbOJ0KDmQIRvBU5twQYL6kEMWpwaD7x09U9dsx0epQ', '2021-11-10 01:28:44.683468'),
	('2z5joyagxm9x1vbwtu53i66qmefwnrm0', 'eyJwYWdpbmEiOiJob21lIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJuaWNrYXBlbGlkbyI6ImNoYXZlcyIsImlkcGVkaWRvIjoxfQ:1mP7vP:U-l3a2Mowa7XHrCZjy2WATCGqLsQ9ZoE3ThHPiUIZ7c', '2021-09-25 15:40:27.410841'),
	('312ezv5d4ue3dyhqchjnhiigjpt2gg1u', 'eyJwYWdpbmEiOiJob21lIn0:1m3Saj:Hemqzal1w2PJZOdZdUkWV-iP3OW9AyhdmKLKqKXYlMs', '2021-07-27 21:17:33.317670'),
	('32aspx7ambdbnb6lqxuhlgcto6umuuy7', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1mfPcI:CrZD2RJfY5BCYMg-etpRQU4koK3sPTJuDboPEXKecrg', '2021-11-09 13:48:02.081540'),
	('35m331ph3tbjynqqm72160vn300i96ne', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MH0:1mdzK7:XzQCis0zn8TcpVdJvAeXSiMj-zyUWEI-UbmF3JGiE08', '2021-11-05 15:31:23.668107'),
	('383logoat94q4ctzwyfuf03oxj3kij6o', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1md1Qh:Z3FvsL4wmCpZHp5HfKO8duWNQLsXqlnP_L_3M-b4M88', '2021-11-02 23:34:11.214763'),
	('39tvjxk6qe7unu0yvqcptyjj7k322gk7', 'eyJwYWdpbmEiOiJjYXJkYXBpbyIsIl9zZXNzaW9uX2V4cGlyeSI6MH0:1mcM7g:9bURXb5WFD8SCyyq-hw_84KTiZL1P7QQUWw0mpGdE0U', '2021-11-01 03:27:48.349198'),
	('39yv0uduekf3wsrl15zn1sir5ktj0jdx', 'eyJwYWdpbmEiOiImIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJnZXJlbnRlbG9nIjoiY2hhdmVzIn0:1oXQJ0:JH0G3DjVCct9Uco7nH9Re3Z_QEO7XimsksPGqkAXgXc', '2022-09-25 16:59:38.305053'),
	('3c43vhsqjzp3yn68u5xstewl1vscj7fm', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJ0ZXN0ZSIsImlkcGVkaWRvIjoyfQ:1meM1G:ze0P01C2yY-7mDMEIjtWKpH1ADqDrkcmYBkjM6iFVCQ', '2021-11-06 15:45:26.782866'),
	('3ffy5wjnxja5av429jcjnzxtgcjh1l1i', 'eyJwYWdpbmEiOiJta3RqaG9uIGpcdTAwZTNvIn0:1mf3mo:8LpGt-UiIi0QYab49Kk6uRe8pUqUO3SCOv_o-1myoBk', '2021-11-08 14:29:26.002111'),
	('3k99ic6qomoo0rijjgz4tukev4qz58mr', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1mdb6d:ooh1fvcjgPcNLoF4xw_MIOj0RqTYCDXpWIMQF03EQs4', '2021-11-04 13:39:51.337439'),
	('3miw24oqrdo9z4yzrtwrxuow83xo7emr', 'eyJwYWdpbmEiOiJob21lIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ:1mdDKR:6kW97IM1tZckNQJThgtq-TOBIqyef6y2zBMKuurJpic', '2021-11-03 12:16:31.223835'),
	('3s3i3zlb7o77cvfe8mfrpsoh4coxcoey', 'eyJwYWdpbmEiOiJwcmluY2lwYWwiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIm5pY2thcGVsaWRvIjoiY2hhdmVzIiwiaWRwZWRpZG8iOjM3fQ:1mfuwh:7WWoYsCqySOWGHQNEVIibrbiQDr9Up_hg-VW8HxhCmI', '2021-11-10 23:15:11.707083'),
	('3sy86mcbe44aiq46lfhbnqcos7xs2xx5', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXNkIiwiaWRwZWRpZG8iOjM2fQ:1mgA5Q:d74LKqSpwQGKJHKNmP9SBrkAjHGStvXzeCZULyWioeM', '2021-11-11 15:25:12.146969'),
	('43hl0d741kh06v6vpskjhokp5v94h607', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1ob25x:BIoVOXGaLyU0zKJCaHRaQcMN8TVPyZEolI9Vu_41M8I', '2022-10-05 15:57:05.026843'),
	('43jxc9xoq7zfx3p70z37jw1ftmxp3108', 'eyJwYWdpbmEiOiJob21lIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ:1mbRqw:9MUZrwIVW1sd-Ho8K0mgjL_lGL70FJdglva1JH6L8TA', '2021-10-29 15:22:46.358768'),
	('4ajy9tokytzf8tipavrnnqx6j3xjdaqb', 'eyJwYWdpbmEiOiJsb2dpbiJ9:1mcApL:6GlO-KNp0r6rigV2JDUR8D01p6BF5EhiHRjsckoyWq4', '2021-10-31 15:24:07.358736'),
	('4c49l2e7rpulprwabezhge00gawf20xm', '.eJxVj0tuwzAMRO-idWFItOVPlt33DAZNTmM2gWRYSdGi6N1rFdlk-2bmEfxxG58tsTs5yekdO5IYuxc3F5RiOc342mz_did_ML7f1vlesM-mx4LcE1tYLkg10A9O59wcxttuS1MrzSMtzVtWXF8f3SfBymWtWp5Ci6FTIsCPC8cJIlFiCDRy5_uB4NsRMbCEqCIddCFPHVE_6NQf0mRy4Q1X01w_W_kTpR4z3aD_sO1__wC5S1NH:1mfodD:60ED4jCyPanRupq2yHdPpMgaxeLND4a-R-vVYu3vNGQ', '2021-11-10 16:30:39.015363'),
	('4d27d8smudtuea2z823s52l8q4pco8zc', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1mfPs0:0GemFtPnr95bN3SkU6s-IIa_Z3RZzXsaudA85RP-L8I', '2021-11-09 14:04:16.614004'),
	('55q7k4azmeyf68t18nxihs2sg8yrywug', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MH0:1mgWMR:PWrXFh4boZFS53sZs818JfZCj2TU16mhA6IELdLYf20', '2021-11-12 15:12:15.620027'),
	('5aqnhtefgazmys678qz7blva0ep0t1ed', 'eyJwYWdpbmEiOiJjYXJkYXBpbyIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1m2sNt:0zy1Ez8NJrC8KQ_kT-4g2Bma4ZA6at8FVxr9re7BdwM', '2021-07-26 06:37:53.807990'),
	('5b1a3ekw7yh7qld5khe6geevmcb8t5ej', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1mes96:nOpgxiM5T7-lGhn9Iwr2MeIzYKsNMfZ0kVY2m4DR0EM', '2021-11-08 02:03:40.820018'),
	('63ga8ttpxkb0n51yjybf80em2lcdf8wq', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mcAxR:qa0aHgyNbajOVIPgRBeRbjF81Qnq2P8fOrrNzlVUZeQ', '2021-10-31 15:32:29.946967'),
	('69ve6o31hgw113kmxxl3q35vzbaou3ga', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mdyEK:yYzVBCW0U4gCcJHv_HfbrD9MbdWvEGACS95IwFDm-ZQ', '2021-11-05 14:21:20.370551'),
	('6fb58qr6qmii71s17pnzk1rtqa8h5sds', 'eyJwYWdpbmEiOiJjYWRhc3RybyJ9:1mflZi:E8h_KhKibYwS6PK7XUOPrlxSTJV2BgOFIhsyFZHLP4w', '2021-11-10 13:14:50.624264'),
	('6xftax0zd9wj6j0z04r8mseg3xgrg9ef', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1liEmC:1IY_wPBXbkK-UTxoPOmHYErxS23JI1J_A2janidEXTM', '2021-05-30 08:17:40.685111'),
	('6xvrh15ksxbfeewyvym8p8ec32k2c0ir', 'eyJwYWdpbmEiOiJob21lIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ:1mday6:HRtI6MZHn4gqt5kHYJq8O2hQjtUjBe5WpMO0flCfiOs', '2021-11-04 13:31:02.902144'),
	('7e8vrxghl4srwrqlmne9extblm69clqd', 'eyJwYWdpbmEiOiJjYXJkYXBpbyIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mdllG:znYj6TeXlLWD3QZa3KvQdyZCmzA1afYfQE8r29nxHPE', '2021-11-05 01:02:30.580513'),
	('7v9vmjfgk4jdaiar7rezi33z635m16ca', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1oXPrH:8Fk6tvBkR4eaz6Ihxxelp_rCFlv2nwyKIosYu58qKVA', '2022-09-25 16:30:59.702100'),
	('83yb5jw7mdukltdu5ouzhuirwcpgiig7', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1mdxve:W_Xu5XeaTPQh2Xde6aPclwdZAX0cH6vrCyl9NTGN1zw', '2021-11-05 14:02:02.348066'),
	('84ksscgzbqk1ui5oajy2d0fzx7d3qbtu', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MH0:1mdyo6:S0gxxg0NbkYd2ztQrLZ_hkncHmogqLzgNTU4uwYQs6c', '2021-11-05 14:58:18.630663'),
	('8czrjp30acz0zg2cii60mi9kgw3n1o06', 'eyJwYWdpbmEiOiJjYWRhc3RybyJ9:1mRGqj:5e9v0GNY6QPRzAbsO2yDizrokx-z4JwWNuKa1HVefJA', '2021-10-01 13:36:29.492926'),
	('8kfs4anzwlmwixvf31lt4c7i0zrveehz', 'eyJwYWdpbmEiOiJob21lIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ:1mbopR:nHDgW8ZbyNFlcHEdLow2GX0CmD7jMPwNvzKMCfpHDfE', '2021-10-30 15:54:45.977086'),
	('8re6nvzfx0hqt8akubimey04ammhmofj', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mfR1l:X-6aTQYe7SqTUIv5EcvkkfEEW8ESiHryrYPXvIlhDZg', '2021-11-09 15:18:25.480315'),
	('8ukcwl2xo7dh7om1zgfgzok5il7a5j8v', 'eyJwYWdpbmEiOiJob21lIn0:1mciOJ:1KJzILvaRdezUaM4Pei9tv6rzQwVhsRIJqe8_oSfovY', '2021-11-02 03:14:27.009814'),
	('9429w2q0xmjmuhewx2nbevs13e6as75o', 'eyJwYWdpbmEiOiJjYXJkYXBpbyIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mJxt7:Fl3wTwZRQgSqd_mpE_3EILq06FnyHJT80fsNlHSF1lg', '2021-09-11 09:56:45.903316'),
	('96v3pp7gfhl5i60dn7nwgct83dtsizng', 'eyJwYWdpbmEiOiJwcmluY2lwYWwiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIm5pY2thcGVsaWRvIjoiY2hhdmVzIiwiaWRwZWRpZG8iOjF9:1meibQ:-6dF3kvZyjXAerg4GlpHdBY6sZtgEOFW-bO9ZOIbwBM', '2021-11-07 15:52:16.094677'),
	('9ivrn0e13q13yn1x8uczdmq4prc087j7', 'eyJwYWdpbmEiOiJjYXJkYXBpbyIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mcBNv:QuXos_rTm3C1-tmbei6YjoZ0qRwIdvw_ueumpHQ4eYc', '2021-10-31 15:59:51.338082'),
	('9n1f2vsdo6d0klgvmfkfwk880o8eyhe4', 'eyJwYWdpbmEiOiJwaXp6YXMifQ:1mfn5k:axWIcgiMgcqq-H80OIegaoGpNFUuCUQsnHyBm0P2FNU', '2021-11-10 14:52:00.884087'),
	('9u45cnz323d9zx0vhhftga2i3s7adgst', 'eyJwYWdpbmEiOiJsb2dpbiJ9:1ob2U9:RKQADBsQWXqRQPiV_ilMc8F5-GRUjcIxrf5azXiGRTU', '2022-10-05 16:22:05.642163'),
	('a0hzr891kopq8bbc8zaxuka2lqq01d3i', 'eyJwYWdpbmEiOiJjYWRhc3RybyIsIl9zZXNzaW9uX2V4cGlyeSI6MH0:1mbotR:3gKspCW8E-OYZn0JEcS_yZiiChEfmA07HjLFAclRiWU', '2021-10-30 15:58:53.792390'),
	('aac4dxdecdcjbogsyu82hc61qpw2pdcx', 'eyJwYWdpbmEiOiJwcmluY2lwYWwiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIm5pY2thcGVsaWRvIjoiY2hhdmVzIiwiaWRwZWRpZG8iOjM3fQ:1mg6nZ:fqlvIsHxIX6IthMKAUNkcWw2t70HL1kY6xaqsrHAkPQ', '2021-11-11 11:54:33.331747'),
	('aiswg27v8yl1rph24ud8eh8lhtgvm1wv', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1merqD:FQMnM91SvRap3YhrcLj2YBsBMSRkBipai8O7s773V6E', '2021-11-08 01:44:09.214266'),
	('bp331kha1ityc9ona9wnm0ntdjxk08an', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mfRSs:zwDKj3Pg7hP2YAPpgGE3Nzb3wJmEkJBZSMSM4y7RowQ', '2021-11-09 15:46:26.089749'),
	('bwkp97wjscbp17s7a2njf6m3khfn7x0r', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1mgqP8:GlfATYM9mdfHg7Tqg8sD8kyevJ7qSlnAxHDV2ITHAQs', '2021-11-13 12:36:22.347267'),
	('c6s4njflp30e77jd2cjeitg8kin55ls9', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1mf1mx:-VyTXwh_Tsyt5rvnhcIb07I6a54j4FdAv8kJncQIsYk', '2021-11-08 12:21:27.140807'),
	('cbew8udcnt4veo0xqptwde9fv0z6istg', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1mehFj:gvzYx3kl457kZiBFEi3s_wWiT0DyxDbCO3OmWAYGcsA', '2021-11-07 14:25:47.884003'),
	('ck7ma7n12mb6fb3pkxlj2uqv101jtgkk', '.eJxVjMsOgyAQAP-Fc2NgBV_H3vsNZFk2Qh9gRJM2Tf-9mnjxOjOZr5hwjAnFIEJ-sbgIW7iUmJPl9xTnjxjkxnBdgl0Lzzb6LQVxYg7pwWkX_o5pzBXltMzRVXtSHbZUt-z5eT3a0yBgCfsWe1Vzqz0As-wcmp6JDBmloEMtmxZY1h0bhaSMJ9LsHUjQAE3r-0b8_vZcQ88:1mdYgI:B2kAk219R1cbLSMn2loSByMaNrdXfHlvoeRRynYuTjM', '2021-11-04 11:04:30.734788'),
	('cu8d8j09om2n0mnq5e06m8vwmw25emfk', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1oXZEx:6pybgmXVMdWer-VyqpfP11mJfmB2rzvTbHokMmn_p_M', '2022-09-26 02:32:03.095903'),
	('d8bkx7ss6uby7nf08v2gomsc9hq4k27u', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1meM46:DQ7hEKVYEdYZjPd3hal4cBcECUloh2ThOig3ulTlleA', '2021-11-06 15:48:22.842184'),
	('dihwznkwu9j38bhie4hcumji0pgxcsdg', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1mEbt9:05Q_hvYfTK7h9-FYyhLBTWZ_VECUOuPeX82Gwjdhd0s', '2021-08-27 15:26:39.595102'),
	('dn6aszcvbff3byjpvhhqrd7l7mvqa0t2', 'eyJwYWdpbmEiOiJob21lIn0:1mdWmJ:rVnRs4vOKM1PKNcqcfcJXigEecAtvtGEoDgxI3tCs6U', '2021-11-04 09:02:35.946510'),
	('e3glbn4g0p17mehd4vi2ey8ore8aclpk', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1md15a:qafFRK4y6bH-LCrWSww2OS7NmflRXShD7Xp-NszgIpk', '2021-11-02 23:12:22.098362'),
	('e5er1sey3k3e2miz40ik9td9fr7tvrsu', 'eyJwYWdpbmEiOiJsb2dpbiJ9:1mcAoo:Qi4FUbqIYB0icJLV9hqCrLsksT4LckP7PEKxTE8C8Ug', '2021-10-31 15:23:34.390971'),
	('eed2h65wr3x72f2i15frmsucuttxlq6j', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSJ9:1mdzI7:elT-yHP7iCXN1bTR-HDf5gXe_MGdxcTGzP7jKuG1bj0', '2021-11-05 15:29:19.304376'),
	('efvos4oux8mpldhoyc0ymhspjepl8lo0', 'eyJwYWdpbmEiOiJsb2dpbiJ9:1mcAqN:KAHrmBjsZRErTMdEB0PjzL_fo_VJtfghmsUhtMx0X1k', '2021-10-31 15:25:11.592446'),
	('etse42w6evtmjmrr55uw4d4ac6zz3tyf', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1m8Smw:K8uqxB9fKiMT7P0-QGFZj0LPr9n_VWQIlRhWQE9-oAU', '2021-08-10 16:30:50.292902'),
	('ewto8elibshr6ln199u84kqcixwfsa91', 'eyJwYWdpbmEiOiJta3RjYWxhYnJlc2EifQ:1mf43x:-yHFaUxmLk8bfSvrr1z3PszBhpf35i7Fcl1SaSdguLc', '2021-11-08 14:47:09.855563'),
	('ezlcuzebq2xx5dx01y94yuncl6elnh63', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSJ9:1mdzGE:2tt-fdsMiEtw2L2iV4R0vDJIZdi3rJ1xRt5WAQbqMcE', '2021-11-05 15:27:22.975623'),
	('ff7myv4s2xaj2zbr8re15h1wio4a2p0h', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1meM44:NO6TBrXacxDdL-oSgTkXgpRMatFbAbTdKZY2D3RcpcA', '2021-11-06 15:48:20.097339'),
	('fqxvt0b78obkjznrksj01nc62k8auems', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1mP2xR:Ni4EgY3n-TY9e1TI0K5177aHRCF2CWtU-zdo03UJQqA', '2021-09-25 10:22:13.679268'),
	('fv96rmorswp5csu7kngu2ids3glv79kn', 'eyJwYWdpbmEiOiJsb2dpbiJ9:1mcL2Z:jIQpEQfW-Wck9w-pxaRezzaKeifOUuN2pPiJ5Q7NK_Q', '2021-11-01 02:18:27.055332'),
	('fzw76qgvy62az28tmjijzusvo07uhzqp', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mOjCv:GLhUfRYiLSGiOh86nk2FNFSnYrwdyQxsDUhyM-XVIcs', '2021-09-24 13:16:53.472791'),
	('g8of4sv2551vgjbia5ekm7yuismlcban', 'eyJwYWdpbmEiOiJjYWRhc3RybyIsIl9zZXNzaW9uX2V4cGlyeSI6MH0:1lxwYZ:_lkKP7SCi5TlobMJoT0d6eRI2XnZt-Q22yWAEFvdRLo', '2021-07-12 16:04:31.832207'),
	('gjzqq11iyf3qjq6pzsvb1hpcvykn3qvq', 'eyJwYWdpbmEiOiJob21lIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJuaWNrYXBlbGlkbyI6InRlc3RlIiwiaWRwZWRpZG8iOjJ9:1mbQeg:wJAJ2vl0xw2DE24SVE0INxGRkwjVii5de5FzboB4oC4', '2021-10-29 14:06:02.491164'),
	('gsvhdxtkj8yvf01a52i2vp8qjvd6m58y', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJ0ZXN0ZSIsImlkcGVkaWRvIjoyfQ:1m3Mv7:I4Wmt3qGpTxD_Ifd5jayhKgpQvhE3jhoZEN3WnEyeqo', '2021-07-27 15:14:13.860926'),
	('gzgxjr1zx5z188s7jix7c5k8smr7mxkr', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1mdWfn:XSV9gqh8aUOZ4UmSSiMVd-DcL5hjP3G6_3CoOOGYbuA', '2021-11-04 08:55:51.384151'),
	('h49735lz85wwonq741tbyodmbqkt7b6n', '.eJxVzEsOwjAMBNC7eI2qxDT9sGTPGSrXtqgBJVEDCIS4Oy1iw3bmzbwg09EiwQ6YZqFsCTYwFC3FUhz0kW1-ws5tIBqfKevFJK14oruWhZpklW_mlx3drtNwKzoPJotC-MtG4rPGtZATxWOqOMXrbGO1kurXluqQRC_7n_07mKhM6y31fqttLYiqrhsp9MocOHiPHdWuaVHdttPgiX0Q5lplRIc1YtNK38D7Ay2oUXE:1mKjqH:UtEFN0JrUmQsqg2S_OFxotP4l15updRSOjeekqxqmd8', '2021-09-13 13:09:01.951961'),
	('h91u026s056mcrcmdgh4j0gri2d85nsj', 'eyJwYWdpbmEiOiJjYXJkYXBpbyIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1m1aRP:lQcm0f9pOtQyA0qkWijqCt-0J-yBJXI8JNn7_HQTPTQ', '2021-07-22 17:16:11.284185'),
	('hhcvet3p97byf1ibcb0snrhf55o64bno', 'eyJwYWdpbmEiOiJwcmluY2lwYWwiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIm5pY2thcGVsaWRvIjoiY2hhdmVzIiwiaWRwZWRpZG8iOjF9:1mf4w6:4kCB6U3KgryEVsFylqVh53gnLGaMbNC95fI45EYfMoM', '2021-11-08 15:43:06.661139'),
	('hjrwvepb0xpo3rzfd0jtdwz6x4kanrz0', 'eyJwYWdpbmEiOiJwcmluY2lwYWwiLCJfc2Vzc2lvbl9leHBpcnkiOjB9:1mhLPW:yxB4DNFmP5bFj7XDmcqJpldNkCto94wrV2QeVhgkGms', '2021-11-14 21:42:50.199646'),
	('hrq7lr1tv4fhp1buyww5v7gu0no91559', 'eyJwYWdpbmEiOiJwaXp6YXMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9:1oX1Ah:4LbGo2wvq3OJCoCiMg5vRBcIOfYWJZmkwk7og74LydQ', '2022-09-24 14:09:23.669974'),
	('it2uleptw54z3dkw2kxuzyhvcnfef2j6', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1meKFy:KA-Vuywy_DKrGv2X9jfYsC9G67QKORf6RcnZGF_rkF0', '2021-11-06 13:52:30.463933'),
	('j25dkj7mx8vytt9qkk3ugvxhziyn2x01', 'eyJwYWdpbmEiOiJjYWxhYnJlc2EiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIm5pY2thcGVsaWRvIjoiY2hhdmVzZCIsImlkcGVkaWRvIjozNn0:1mgUqm:zi31VGkdgsZE9YJuzrKvhsvUA2t4CmgP5XiwF6MU6Gk', '2021-11-12 13:35:28.320071'),
	('j3lnkykfa0folqxwk34x8x2d3ymczxq8', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1mdyXj:aJwkiBTyJqE4x4EVUUtxWVZnZrNmSTYhValmaA_CkA4', '2021-11-05 14:41:23.332857'),
	('j8wavkjvb2o6iglwg9yjwqts24107p20', 'eyJwYWdpbmEiOiJjYXJkYXBpbyIsIl9zZXNzaW9uX2V4cGlyeSI6MH0:1mdyCJ:fgwc5-Yc53VWFkBN9jN1efTYcLjjY8x9qfq85iv11Z8', '2021-11-05 14:19:15.085015'),
	('jft3x8xg1kt51cd16hmmibk6izzehlpn', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mOihY:rSJqa0aSdNPMaUI4F7uWWKP41tKpPXTP2e6HWBdQljs', '2021-09-24 12:44:28.169815'),
	('jgznrdhibw142s23cyg9pqgb2nuiymp0', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1meM2X:0IEcyZ9k-gtZa13MNCmumgnTmQ0lWx0-NFa5Zs0yCSA', '2021-11-06 15:46:45.549789'),
	('jkf8bo5tf2yhplapk2z9ccuxlle0q4p5', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1merqY:4cjdjKCM1_V_TgkfUrY9im_xlHwVJA0dLFV1E4Kv9u8', '2021-11-08 01:44:30.257952'),
	('jqnb38wl88ec2hrl9v8o0i7ggcxbu72f', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mfQXi:9FsLjT_Sls1mCh948ZAV17JiMMW-vjkzGdcT4wXTE98', '2021-11-09 14:47:22.129160'),
	('jqx0b0xam9h931bwoq3hf2qwlqkjx0fc', 'eyJwYWdpbmEiOiJjYXJkYXBpbyIsIl9zZXNzaW9uX2V4cGlyeSI6MH0:1mdmb3:felGq5-Loqq-1NvL34jGFwwt60YBde9vHMlmzmPCdZI', '2021-11-05 01:56:01.076673'),
	('jrzm97kvo6li9hohk5kafrowjfez325y', 'eyJwYWdpbmEiOiJwcmluY2lwYWwiLCJfc2Vzc2lvbl9leHBpcnkiOjB9:1mfieV:czGMO0tjJjliMDy11nA1KDzoT1kqtbFCfJaH8n240kU', '2021-11-10 10:07:35.725847'),
	('js2q44dp9ofp8sb31eu906fcu0amtz7g', 'eyJwYWdpbmEiOiJob21lIn0:1mdmN4:7AiYWvbSyBCpQ4xyzZekuSby6tDIYnv7RWA3FPdFtZc', '2021-11-05 01:41:34.747702'),
	('ju5mcyi4sihtl2rp9ya0a6zt8w4iyqah', 'eyJwYWdpbmEiOiJjYXJkYXBpbyIsIl9zZXNzaW9uX2V4cGlyeSI6MH0:1lxwM3:rXVPTTbO452ZBN65CssUS73v3ltrFOSwBWxL9_Wfe38', '2021-07-12 15:51:35.285254'),
	('jur17ymvyflcjb9emv4p8caeb6i0ggse', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1meuWL:GCCPgyz9lKtw99IMUkMQSs20u84BxzX_XXV7IUBhyd8', '2021-11-08 04:35:49.000208'),
	('jvreykjpt1zzz2zaqgajcx9qggbe58ia', 'eyJwYWdpbmEiOiJsb2dpbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0:1mbyUN:Ao8mtx5uaYyY2evTPkLrKH-feSm_M7zKk0GGua_1vOc', '2021-10-31 02:13:39.125187'),
	('khdyfac8lqp9hqivmd7dwozmzmnzlwuh', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1mdyR3:Z6BulYW8kHy48-BWvM17XQ6cfSZ4VZxWECQqCwPSmPI', '2021-11-05 14:34:29.914469'),
	('kj8lepuoyld9ua1s50waju1ig4hgfymq', '.eJxVjMsOgjAQAP-lZ0PalfLw6N1vIMvuxlawJRSMxvjvFsPF68xk3mrCqw-oTsrFu6iD6pKk5GPo5Dn5-aVOOjNcF9etSebOc05B_bEeaZCwCb5huMaCYlhm3xdbUuw2FZfIMp739m_gMLlti605Sl0ygIhuerStEFmyxkCDpa5qEH1sxBokY5moFO5BQwlQ1dxWeRo8DTjJ6DnmITl8SMrY8yT8Y-bzBV1ST9c:1mMvSj:IlnY7kPQtSs15hWrkD7CW2dNxTyvso-7CkIaXO9bCqY', '2021-09-19 13:57:45.022122'),
	('kpt7vv7ww4m7ubhjzgv0qckwlqzrcmqf', 'eyJwYWdpbmEiOiJwaXp6YXMifQ:1metzt:B3MhwP9ziDNBLnRha6nP1RunQ1ffBv4g605bk0z4AAk', '2021-11-08 04:02:17.574493'),
	('kxpedyts078mxm4elqs5saf79c24oxrz', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1mcjOF:sV21QImcyfIdWFDsLsNhUXXKXLr7p9LdiDS5UN4vAUo', '2021-11-02 04:18:27.285028'),
	('kyjgv27mddp8yskqkvtywhyeyjpnl8xs', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSJ9:1mdzHi:OqnQkfrqnVvellci59V4jy7QoG6V0a9jaRPZe-sAgI0', '2021-11-05 15:28:54.184316'),
	('l5xyw5ahxnifirctzzyhnkk24lwvzlld', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mfRPc:jXGV8PJOrLDV9Hj-DeMbrOHhbDqI3Ushycwdj_wXN9g', '2021-11-09 15:43:04.204582'),
	('lcda9a7v5hyzfs1i5nyit6otor56yfb7', 'eyJwYWdpbmEiOiJjYXJkYXBpbyIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mcMDI:HqLu5IVxhrve6WNQO8CA26mNylHYRs25fBr7mGt0cLk', '2021-11-01 03:33:36.846214'),
	('ld1fbnvhb8nno7ofycw687pfi7tbn0ju', 'eyJwYWdpbmEiOiJwcmluY2lwYWwiLCJfc2Vzc2lvbl9leHBpcnkiOjB9:1oWioW:ht9vFTXEi3qnuP0puG7fXC856y2HgvwCAa-7rin7oP0', '2022-09-23 18:33:16.422545'),
	('lieplbt77crjwkedz3f0l6ymyz3lz6c5', '.eJxVjcsOgjAQRf-la0PaseW1dO83kGFmQivYEopGY_x3wbhxe-7JuS814xAiqlb5dBV1UB3eVt_dsixd4A3DP-uRRon7wBeMQyooxXUJfbErxW_NxTmxTKef-xfwmP2excYcpbIMIKLrHl0jRI6cMVCj1WUFoo-1OINkHBNZ4R40WICy4qbco1lyDil28pjD8lStPqgYaMRZpsBpOyGPd8mbGngW_jLz_gDVmU_X:1mVjc8:pP_yYZmReI9p-ieMciW94yOrD0EUOWh4cmIcuGW_Ykg', '2021-10-13 21:07:52.863825'),
	('lmi41kg06egjpc4kr2ykioh5sofwt8m8', 'eyJwYWdpbmEiOiJob21lIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ:1mR5Ox:e1yabQPJ2BIfgPJNLNo0ongID-WWIqQc6dAP_sWpL6Q', '2021-10-01 01:23:03.754102'),
	('m5txj12va7flyv6c4ew2uhs9sdk6o5fo', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1meuem:y6fVfMIHdLRGNZ7U2WL7Pi4j1DiStQ2oe5mNEdDRKOU', '2021-11-08 04:44:32.549661'),
	('mm93dg5ito139md0ujwg87g7f4oflso3', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6Mzd9:1mg9z3:VFvVJyE-t1Iyo-Fz7XTbnUSiCA4r90Fl6Op01XRt8Zc', '2021-11-11 15:18:37.933754'),
	('muyyc2q8tcoflw1a32w8hdb86eknvw32', 'eyJwYWdpbmEiOiJmYXZpY29uLmljbyIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6Mzd9:1mfwt7:FVkLjRi4fHSDM-oPF4ffsXsvo49BGPGSCYGWLVnVxlw', '2021-11-11 01:19:37.399221'),
	('n6s43d2ugxr7e6yx3r226ll0wns2uffa', 'eyJwYWdpbmEiOiJjYWxhYnJlc2EifQ:1mgUxD:X817pPYKxPc4nBSIOOFmENEZ4iZ_9IfLolUNrssAsi4', '2021-11-12 13:42:07.464017'),
	('n7nnchsr4iwvbny7yhhqkbv0kjdowktp', 'eyJwYWdpbmEiOiJwcmluY2lwYWwiLCJfc2Vzc2lvbl9leHBpcnkiOjB9:1oXQE5:Ol4IsQeguhVq7deMA4wPR5BiniLmmzYWw1JiL3PH1hY', '2022-09-25 16:54:33.100176'),
	('n9ztrbydcqy16z5i963go4oe3ku0prvf', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1liEbm:3ruMrOatD6ykvz-bUK-ic49b_olg2fzgVduJn9VOFas', '2021-05-30 08:06:54.548975'),
	('o3ojii51nqv5l90d6xn8nq4ji22x4yit', 'eyJwYWdpbmEiOiJwaXp6YXMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9:1oWsnN:K7czDDLZsNrVddp6_pLysGJPkyeRuE0wvh2q7p3R_Nc', '2022-09-24 05:12:45.445487'),
	('o9sl0dvwlidhgtvemptrtis6p07t8xme', 'eyJwYWdpbmEiOiJob21lIn0:1mdWd8:etCUFTAMNsRdxxRdh0vZRcKrwwBXUjeFQtsDtc7blpc', '2021-11-04 08:53:06.175209'),
	('okr866vpyhqhdqbrsrefwf9re8m0mde1', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1mesZG:ztmWYeyeBQzkLhDvUUN6xCJwgJVGLwWKIRmD6jxULdc', '2021-11-08 02:30:42.082238'),
	('oub6sjb90d971uzspqy1daxfx8p89w5k', 'eyJwYWdpbmEiOiJwaXp6YXMiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIm5pY2thcGVsaWRvIjoiY2hhdmVzIiwiaWRwZWRpZG8iOjF9:1metUb:1f_5w8Fp39PCmVghY9A2qIp7kax04zhRaGg428DZibE', '2021-11-08 03:29:57.944697'),
	('owpz7blbro5cg64jbojmfp4i2v7cgmtz', 'eyJwYWdpbmEiOiJjYXJkYXBpbyIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mO9in:V3QFRrvHFcz3hSyFTgXGFg1epmFSXD3XMHSlCvyBcqI', '2021-09-22 23:23:25.600312'),
	('owvi5f0uhnm7p7tfexnf1ahrqe32imdn', 'eyJwYWdpbmEiOiJjYXJkYXBpbyIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mdmOK:AI6-jYgcPmlCifl5ILpktRSW7EsvTQBEaD97pk3XY9c', '2021-11-05 01:42:52.393521'),
	('oy09uwii06leazr46rba91qcw0wumfzr', 'eyJwYWdpbmEiOiJob21lIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ:1mdxSG:lLhwembTex7brWo4rLFFBWcVeVddMvVXQ30YhQbhI1o', '2021-11-05 13:31:40.389929'),
	('p1yjvcsrox5yrvbd532xa0mutuz1qsht', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1mf1wc:rr6zBBN4d25eQLvWS3PDOQkT-EYPTXzPJxzZtvy5qnQ', '2021-11-08 12:31:26.531733'),
	('p60rcm5z8t4q9015c7occuzo1lt2q1sd', 'eyJwYWdpbmEiOiJwcmluY2lwYWwiLCJfc2Vzc2lvbl9leHBpcnkiOjB9:1mfjVm:73fx3ny3PGn9hx-FsQu52VC-JalkhpKJFSs3pXKV6CI', '2021-11-10 11:02:38.419382'),
	('p6jyzso14jw0cem5rsjuyf1b5ditu2q0', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MH0:1mdzEk:KU0qpo4OsTpNqmDbKzrQEbsgFq2mXSHP7Ob_4I1bKxo', '2021-11-05 15:25:50.398573'),
	('q03dqe3oitopav7llokxej7j7qmqlx0e', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1lp89s:sqhSGnNXSs4OU3wapLFM77cOc197NpHfvfO-vX1aJbI', '2021-06-18 08:38:36.383153'),
	('q4gq72owps7l4ofddia5ve9r1fgjx5va', 'eyJwYWdpbmEiOiJwcmluY2lwYWwiLCJfc2Vzc2lvbl9leHBpcnkiOjB9:1mgrNL:n0pWmJmERO4lvU9MmwbYSQt5eOiXd8i1kVUyALL0JF8', '2021-11-13 13:38:35.699309'),
	('qabl5mxxut8db1mj4yl7x6d223ij4a87', 'eyJwYWdpbmEiOiJob21lIn0:1mdWaB:GUaZntkhiQ8tb4sv464iOs7VkJeVISZtOXasedRHIhA', '2021-11-04 08:50:03.380732'),
	('qjs135n1l18yeyat4m708f4zco0ozw5d', 'eyJwYWdpbmEiOiJjYXJkYXBpbyIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mciUD:52qB15q2ZWTXFLcpMXKcB3ZtiWFn4F3Bqt9BogUUCrU', '2021-11-02 03:20:33.779850'),
	('qn2vt9jh8672jomtwxw815jzgrb12n8j', 'eyJwYWdpbmEiOiJjYXJkYXBpbyIsIl9zZXNzaW9uX2V4cGlyeSI6MH0:1mcg4s:iMkW5VraDRmEjcYQa87wKM-LW7VAzM8HQfn0DzgMWr4', '2021-11-02 00:46:14.748861'),
	('qna6j1utrpo94p1tfao15p5nodwxoffe', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSJ9:1mdzH4:TC0NqUfWSBF8vGnRmOzbgOr697ZK5dKOCiR2Y-BkoC8', '2021-11-05 15:28:14.264533'),
	('qvhxzbbjtn0p7s90ioy3ltu4jpr9hxac', 'eyJwYWdpbmEiOiJsb2dpbiJ9:1ob2Dc:UOnAOJP_EjXDrrIFwGCmWrAPsaLM6ZND5ZW0IEnsq1k', '2022-10-05 16:05:00.360056'),
	('qzfsm08lrc9iqctwhjoc4zy61x6zwws4', 'eyJwYWdpbmEiOiJsb2dpbiJ9:1mc8r3:hgUZEcsw2e_CrxyANsBsx_l-GCrRF448OQ1QCz0JHP4', '2021-10-31 13:17:45.856512'),
	('qzrsg7mcisvvwknkm3cnwcr2i5klcmou', 'eyJwYWdpbmEiOiJta3RwYWxtaXRvIn0:1mf48Z:jfrtLp7sLAKU95eGPvfbDrt_Fe4AHQ4rbO2Ki9B3VYA', '2021-11-08 14:51:55.400552'),
	('r0paxfa5lh4wjh2i3u129uvjmpeafv7t', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6Mzd9:1mgqlP:a7iqMj70JU3Zqj29XS7uyCHBfotoEvIG9t3Dnh9-PYU', '2021-11-13 12:59:23.604064'),
	('revbz8v9ndygsfeeddqeo5pxp1sytcbc', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1mdb5J:asClQwFJUON4Zb2B44xN5KGk7NbCeuDzHTpvfjlzWtE', '2021-11-04 13:38:29.767704'),
	('rwkbpzsjibyqdasm3yh8ln1dri13n4ph', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1mP3De:5kKAxWwdiIK9K7qLBkZCf27S1PttsCAJxy2l-juInbE', '2021-09-25 10:38:58.171989'),
	('st8hl1vhc529cecwk0j9idv3x538trv7', 'eyJwYWdpbmEiOiJsb2dhciJ9:1mdyf3:RBS_bMQobzk905UY_p0OkUbZzCEqZNudM--qwYfUCBA', '2021-11-05 14:48:57.847074'),
	('t8bku2ey36t15xxhndixdy86vb4xigtq', 'eyJwYWdpbmEiOiJidXJndWVyIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ:1oX37S:1BiNIQT_O3w-DZhxjVEGAXoMl8S0vu_3M-kv3Te-1u4', '2022-09-24 16:14:10.225659'),
	('t99neix19o7069cv28bnk4h9m23eu49u', '.eJwdy0sKgDAMRdGtSMYOdNrNlNAEfVjS0IAo4t79TC_nXuS8wJgSFe7CjjZ4hxU4Vxoph0agWdbD0U9K00iGsrFrhbRvW3nXeCnEVf423w9WfR6V:1meXqt:2uKrikFsR3LmhC5djDFYpV2-Uqoh0PnHlSjsFISFVds', '2021-11-07 04:23:31.130775'),
	('twzkzo627whn69e15w9mi25uwyqpv6bh', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1mgrMg:78Jd6oGNJrGUXblukonsvOfnoYRVyQNtb-Yg3RE3Oqw', '2021-11-13 13:37:54.722072'),
	('tyo0ihh1w3l3pkhskc6qd41mkydhffex', 'eyJwYWdpbmEiOiJsb2dpbiJ9:1mcL0W:2wgBIKiLArd6U_9HcbKNRHIAfgSgOR8yA40VrkO6PVc', '2021-11-01 02:16:20.103070'),
	('ugmrac8s2yq4wg8plx5jyronskw588s9', 'eyJwYWdpbmEiOiJwcmluY2lwYWwiLCJuaWNrYXBlbGlkbyI6ImNoYXZlcyIsIl9zZXNzaW9uX2V4cGlyeSI6MCwiaWRwZWRpZG8iOjF9:1ob3Af:6IiIFYnTj4mwyeT1CdjvyLvUyT5xw-Iw9NKKMQARa2I', '2022-10-05 17:06:01.356090'),
	('ujk72gqaekc8rfqi796y60l439cbnq6q', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1meucD:RJ8NUuR6-GdEXVJ-cLXXW-2IdEmx3pfOgJ05CyvuSuk', '2021-11-08 04:41:53.705866'),
	('ukxjc2rox2ckdzcidrbgcysbr8mbcuzn', 'eyJwYWdpbmEiOiJta3RwcmluY2lwYWwifQ:1mf3Ex:AZx2kSYwGf2MRfGFJfXBLEcdsok4BwIfCE6TeE7tKxQ', '2021-11-08 13:54:27.706429'),
	('uxyubfw6xnjfkcvv9i149j36sl40yqip', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1mflo4:zWt-kJbPJMFAjVk6nTN5uV3g2JoTEUQWfrzP8TPi6CY', '2021-11-10 13:29:40.767842'),
	('v96pwdse67ti9rnr3fs1n01ebov2jef3', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJmZWxpcGUiLCJpZHBlZGlkbyI6M30:1mRHCs:OjNQ1Dcwz1SJsthoKwDP4j4ngfI36bMAwxkGXiW1548', '2021-10-01 13:59:22.616817'),
	('vhm0h0y8lopdaqxwljaeidy5uqhz1woa', 'eyJwYWdpbmEiOiJsb2dhciJ9:1libpn:O2MkA_uTyZppQItzDDZo9cEpMQkgGCfiY-WYyEzEBYI', '2021-05-31 08:54:55.308083'),
	('vjky51f45d8rt7i506c6wzon9w2m7v9t', 'eyJwYWdpbmEiOiJjYXJkYXBpbyIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mJN43:-T8uRfUDdG_PhGa9vMr-D7YnzgEB3HxUIH7uvfKU46g', '2021-09-09 18:37:35.332829'),
	('vlfjz28oxwutd6d7sda8hknr7jedyb81', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mdzZg:lu3hiLrLXYYrgA9WvDhsbKfvq5gDNl06KJtmtcnZxpA', '2021-11-05 15:47:28.379433'),
	('vnhq4rrwkx137xfxro6jqsdne4kij6z0', 'eyJwYWdpbmEiOiJsb2dpbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0:1mdywa:BSIWi9jgrsG9VHcMNwiIL7gGibC_qlV4j5-n1I7bteM', '2021-11-05 15:07:04.997795'),
	('vw1ro4obdu4wzyhasg32tnkkurnc8t1b', 'eyJwYWdpbmEiOiJsb2dpbiJ9:1ob2Gr:ljo07rToKUMqePbja5Pc6_ydZta5_s9uu2t83vQF37E', '2022-10-05 16:08:21.375313'),
	('w2l5d6gcxkuad7yi4m8ifr1bsrqg6ooa', '.eJxVjMsKwyAQAP_Fcwm60byOvfcbZF2XaFs0xAT6oP_eCr3kOjPMWyw4x4RiEpRfMQUUJ2Fx34LdC682-p-BI3NIN05V-CumOTeU07ZG19Sk-dvSXLLn-_nfHgYBS6hbHFXLvfYAzHJwaEYmMmSUggG17Hpg2Q5sFJIynkizdyBBA3S9H7s6LVxKzMnyY4nrU0zy8wVzSUUS:1lp9bt:mR9c4BvkZRk_cyQKQsngp5o07plaS0NuZ1iPMsozklg', '2021-06-18 10:11:37.788551'),
	('wv4j3czrmj41uuhqt3d18brljpzi1a6j', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1md33G:jvGiapUfOyQXAaUj9kHef91q-dwUaLaw1ORxej06MQ0', '2021-11-03 01:18:06.647748'),
	('wxrf4g0ea8x49qk4gk9ambeqn521krg3', '.eJxVzUsOwjAMBNC7eI2qxDT9sGTPGSrXNtSAkqopCIS4Oy1iw3bmefyCkU4WCXbAKR510shGsIEua86WYqeP0aYn7NwGovGFRr2apNUPdNe8UJNR5Zv55Y5u89Ddsk6dyaIQ_rKe-KJxLeRM8ZSK5es8WV-spPi1uTgk0ev-Z_8GBsrDOkut32pdCqKqa3oKrTIHDt5jQ6WralS3bTR4Yh-EuVTp0WGJWNXSVvD-AFywUqs:1mS3TL:CPxUYX_9PLUYcQvLn-Ghtxr37mRw49GJptNCvUCg-FA', '2021-10-03 17:31:35.453955'),
	('wy59w9wrcol2xg5ojrcqokyaov0om3lr', 'eyJwYWdpbmEiOiJjYWxhYnJlc2EiLCJfc2Vzc2lvbl9leHBpcnkiOjB9:1mfRcO:6RF0h2qNQrvkqc18ok1auBqVXgKesT61l4NYM70M9Jk', '2021-11-09 15:56:16.975194'),
	('x1a7yj629lp18qfkcgu1ndft3acks29w', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mdyDW:hMMo0-gK2P3i-Xux3tyPJfO_bxPCeamY_p7DpI8rjzI', '2021-11-05 14:20:30.178781'),
	('x4ataa0goia3420dvomnebx5glcal0qx', 'eyJwYWdpbmEiOiJob21lIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ:1mRHdB:hRMdcc5TjAeYdG5oV-Hnvj2wlrQplYrxvtSnwoTglGs', '2021-10-01 14:26:33.562806'),
	('xcfbc25pvn4m5w2flberuiumlzahgqqu', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1mP2xb:o3Vs1bPUlUF88C-U3vspNxhZgw_JJCDAbdpIFifFJjw', '2021-09-25 10:22:23.866148'),
	('xfwxji9609rwsbmxcbjzz072g3sfdwb1', 'eyJwYWdpbmEiOiJob21lIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ:1mdcUl:Yszqx1hEW6qea2o06xsTURPmae9Lid80TKcSILDG-7A', '2021-11-04 15:08:51.375902'),
	('xi1z7vtme34ugxwcabwozniy6syuavvv', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1mcjBk:MFzLKosrLxvVZuklxajLPqv1fbrQ2ub3w5qoK0vww6I', '2021-11-02 04:05:32.545663'),
	('xi7fevahk2bnuzf9qpn0uedozad4x6mu', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mcMFK:7wVK-R2qAsF8Y87Bt9LqKfzWSsexp4er97r5MsNjoNI', '2021-11-01 03:35:42.150678'),
	('xiddzgixl8qv3etj3ozvohl9pfw5raow', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mfR1q:nhPRZITCBeMpVZ5oEtAr4oJAjpAn9yLyCHQUxXQQzFI', '2021-11-09 15:18:30.065375'),
	('y0sapidz2h245jginx0qfielxtdqn5j4', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mfRD7:4OOCRkKvAtKL-LypyfmyeNwfrTvgKdgVxmKfTWbv0Xo', '2021-11-09 15:30:09.702529'),
	('ydfp44y0fvsgqw4g8am0jlc23wyv4xaf', 'eyJwYWdpbmEiOiJob21lIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJuaWNrYXBlbGlkbyI6ImNoYXZlcyIsImlkcGVkaWRvIjoxfQ:1mPq02:JCdaAk1FjDSv6YSDTLy4czCr1R8dLN68EtRBLnpIdXM', '2021-09-27 14:44:10.742725'),
	('ywhwzrnen9e82ukw15xj6dovbpepaoze', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1m3MrX:9TjTdyfg1KB2CHLD59BJqXwsZemdRRGFlngbyeR8SxA', '2021-07-27 15:10:31.286174'),
	('z0dm6y4de0lxcoypo41cmlltj555023m', 'eyJwYWdpbmEiOiJjb25mZXJlbmNpYSIsIl9zZXNzaW9uX2V4cGlyeSI6MCwibmlja2FwZWxpZG8iOiJjaGF2ZXMiLCJpZHBlZGlkbyI6MX0:1mdyHz:LTPRjp8UbMG-Fn8WamGK5HAr9ST3xlR2JsJdPCUGEUc', '2021-11-05 14:25:07.698493'),
	('z6tbz3zjga9llp2042fed6wettk2yrls', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1mfPiY:5QsTXjq4tnOFGkF1oaL2QacQtY-fjeIWlyX7HMCy6YU', '2021-11-09 13:54:30.450963'),
	('z74jbp10ntegtzkb2jtpblm4ck5oczko', 'eyJwYWdpbmEiOiJwcmluY2lwYWwifQ:1mfjXk:Tt_ppd9b6k4QeWgEA_cGWPYvUhTMBdgP4pMwz_vikIk', '2021-11-10 11:04:40.539676'),
	('z780ktk0uu8muipd05suontxv0uvngh9', 'eyJwYWdpbmEiOiJjYXJkYXBpbyJ9:1mP2vb:wNH0HSPdm5P3-b8xdU_gSj6yKL58SZCFV-Ow2JlESek', '2021-09-25 10:20:19.610012'),
	('zuqqm6mg5sbo6r8rl1nfqsyvvqgj9pcy', 'eyJwYWdpbmEiOiJsb2dpbiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0:1oX2eF:nqKGzfakgf6HzKGcc6st38UqkqsYQcaa3gO-mP04AoU', '2022-09-24 15:43:59.649845');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.ender
CREATE TABLE IF NOT EXISTS `ender` (
  `idender` int NOT NULL AUTO_INCREMENT,
  `rua` varchar(45) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `bairro` varchar(75) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  `extensao` varchar(95) DEFAULT NULL,
  `principal` int DEFAULT '0',
  `pessoa` int DEFAULT NULL,
  PRIMARY KEY (`idender`),
  KEY `pessoaEnder_idx` (`pessoa`),
  CONSTRAINT `pessoaEnder` FOREIGN KEY (`pessoa`) REFERENCES `pessoa` (`idpessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.ender: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ender` DISABLE KEYS */;
/*!40000 ALTER TABLE `ender` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.escala
CREATE TABLE IF NOT EXISTS `escala` (
  `data` date NOT NULL,
  `escalado` varchar(12) NOT NULL,
  `inicio` char(5) DEFAULT NULL,
  `fim` char(5) DEFAULT NULL,
  `fichapg` int DEFAULT NULL,
  PRIMARY KEY (`data`,`escalado`),
  KEY `fichapgSal_idx` (`fichapg`),
  KEY `EscaladoXPessoa` (`escalado`),
  CONSTRAINT `EscaladoXPessoa` FOREIGN KEY (`escalado`) REFERENCES `colaborador` (`login`),
  CONSTRAINT `fichapgSal` FOREIGN KEY (`fichapg`) REFERENCES `salariobase` (`idbase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.escala: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `escala` DISABLE KEYS */;
/*!40000 ALTER TABLE `escala` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.estoque
CREATE TABLE IF NOT EXISTS `estoque` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dataregistro` datetime DEFAULT CURRENT_TIMESTAMP,
  `lote` varchar(12) DEFAULT NULL,
  `responsavel` varchar(12) DEFAULT NULL,
  UNIQUE KEY `lote_UNIQUE` (`lote`),
  KEY `estoque_idx` (`id`),
  KEY `idloteEstoque_idx` (`lote`),
  KEY `fiscalestoque_idx` (`responsavel`),
  CONSTRAINT `estoque` FOREIGN KEY (`id`) REFERENCES `produtos` (`idprodutos`),
  CONSTRAINT `fiscalestoque` FOREIGN KEY (`responsavel`) REFERENCES `colaborador` (`login`),
  CONSTRAINT `idloteEstoque` FOREIGN KEY (`lote`) REFERENCES `loteamento` (`idlote`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.estoque: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.estoque_seco
CREATE TABLE IF NOT EXISTS `estoque_seco` (
  `lote` varchar(45) NOT NULL,
  `iten` varchar(45) DEFAULT NULL,
  `qtd` int DEFAULT NULL,
  `validade` datetime DEFAULT NULL,
  PRIMARY KEY (`lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.estoque_seco: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `estoque_seco` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque_seco` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.grupo
CREATE TABLE IF NOT EXISTS `grupo` (
  `id_grupo` int NOT NULL AUTO_INCREMENT,
  `nome_grupo` varchar(45) DEFAULT NULL,
  `descr` text,
  `alergia` varchar(100) DEFAULT NULL,
  `visivel` int DEFAULT '0',
  `link` varchar(45) DEFAULT '#',
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.grupo: ~29 rows (aproximadamente)
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` (`id_grupo`, `nome_grupo`, `descr`, `alergia`, `visivel`, `link`) VALUES
	(1, 'pizzas', 'Pizzas especiais, artesanais preparadas em chama aberta no forno a lenha.', 'pimenta', 1, 'pizzas'),
	(2, 'burguer', 'Hamburguers artesanais grelhados no fogo desde 2010.', NULL, 1, 'burguers'),
	(3, 'sobremesas', 'Suculentas sobremesas exclusivas.', NULL, 1, 'sobremesas'),
	(4, 'sanduiches', 'Sanduiches unicos e super recheados, confira e escolha o que se enquadra com sua fome!', NULL, 1, 'sanduiches'),
	(5, 'veggie', 'Ambiente para aqueles que seguem o caminho natural alimentício. Com opções Veganas e Vegetarianas.', NULL, 1, 'veggie'),
	(6, 'almoço', 'Escolha um prato especial, almoço bem servido e quentinho.', NULL, 1, 'almoço'),
	(7, 'aperitivos', 'Todos os nossos aperitivos são exclusivos e unicos, peça e saboreie-se com essas gostosuras.', NULL, 1, 'aperitivos'),
	(8, 'saladas', 'Saladas especiais, naturais e com proteinas', NULL, 1, 'saladas'),
	(9, 'sucos', 'Sucos naturais, produzido direto da fruta.', NULL, 1, 'sucos'),
	(10, 'bebidas', 'Outras bebidas, Refrigerantes, Drinks e Chá.', NULL, 1, 'bebidas'),
	(11, 'adega', 'Conheça nossa carta de vinho, peça seu vinho com uma massa exclusiva e ganhe desconto no prato.', NULL, 1, 'vinhos'),
	(12, 'estq seco', '...', NULL, 0, '#'),
	(13, 'estq geladeira', '...', NULL, 0, '#'),
	(14, 'estq freezer', '...', NULL, 0, '#'),
	(15, 'estq ambiente', '...', NULL, 0, '#'),
	(16, 'executivo', 'almoço executivo', NULL, 0, '#'),
	(17, '86', 'fora de linha', NULL, 0, '#'),
	(18, 'combos', 'Conheça nossas combinações exclusivas', NULL, 0, '#'),
	(19, 'açougue', 'Açougue', NULL, 0, '#'),
	(20, 'aves', 'Açougue', NULL, 0, '#'),
	(21, 'frios', 'Açougue', NULL, 0, '#'),
	(22, 'laticínios', 'Açougue', NULL, 0, '#'),
	(23, 'executivo', 'almoço executivo', NULL, 0, '#'),
	(24, 'higiene', 'Açougue', NULL, 0, '#'),
	(25, 'beleza', 'hidratante', NULL, 0, '#'),
	(26, 'limpeza', 'Açougue', NULL, 0, '#'),
	(27, 'hortifrúti', 'Açougue', NULL, 0, '#'),
	(28, 'mercearia', 'Açougue', NULL, 0, '#'),
	(29, 'padaria', 'Açougue', NULL, 0, '#'),
	(30, 'congelados', 'Açougue', NULL, 0, '#'),
	(31, 'enlatados', 'almoço executivo', NULL, 0, '#'),
	(32, 'cereais', NULL, NULL, 0, '#'),
	(33, 'peixes', 'almoço executivo', NULL, 0, '#');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.janela
CREATE TABLE IF NOT EXISTS `janela` (
  `registro` int NOT NULL AUTO_INCREMENT,
  `comanda` int DEFAULT NULL,
  `produto` int DEFAULT NULL,
  `descricao` text,
  PRIMARY KEY (`registro`),
  KEY `janela_comanda_idx` (`comanda`),
  CONSTRAINT `janela_comanda` FOREIGN KEY (`comanda`) REFERENCES `comanda` (`idp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.janela: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `janela` DISABLE KEYS */;
/*!40000 ALTER TABLE `janela` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.loteamento
CREATE TABLE IF NOT EXISTS `loteamento` (
  `idlote` varchar(12) NOT NULL,
  `produto` int DEFAULT NULL,
  `qtd` int DEFAULT NULL,
  `dtreg` datetime DEFAULT CURRENT_TIMESTAMP,
  `dtvalidcongelado` datetime DEFAULT NULL,
  `dtvaliddescongelando` datetime DEFAULT NULL,
  `temparmazem` float DEFAULT NULL,
  `temppreparo` float DEFAULT NULL,
  `responsavel` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`idlote`),
  KEY `produtoLoteamento_idx` (`produto`),
  KEY `fiscallote_idx` (`responsavel`),
  CONSTRAINT `fiscallote` FOREIGN KEY (`responsavel`) REFERENCES `colaborador` (`login`),
  CONSTRAINT `produtoLoteamento` FOREIGN KEY (`produto`) REFERENCES `produtos` (`idprodutos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.loteamento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `loteamento` DISABLE KEYS */;
INSERT INTO `loteamento` (`idlote`, `produto`, `qtd`, `dtreg`, `dtvalidcongelado`, `dtvaliddescongelando`, `temparmazem`, `temppreparo`, `responsavel`) VALUES
	('280820211229', 16, 10, '2021-08-28 12:29:29', '2021-08-28 12:29:31', '2021-08-28 12:29:33', 24, 14, 'chaves');
/*!40000 ALTER TABLE `loteamento` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.pagamentos
CREATE TABLE IF NOT EXISTS `pagamentos` (
  `primaria` int NOT NULL AUTO_INCREMENT,
  `pedido` int DEFAULT NULL,
  `valorpago` float DEFAULT NULL,
  `bandeira` varchar(16) DEFAULT NULL,
  `registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `valorareceber` float DEFAULT NULL,
  PRIMARY KEY (`primaria`),
  UNIQUE KEY `pedido_UNIQUE` (`pedido`,`primaria`),
  KEY `pedidopagamento_idx` (`pedido`),
  CONSTRAINT `pedidopagamento` FOREIGN KEY (`pedido`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.pagamentos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pagamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamentos` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `idpedido` int NOT NULL AUTO_INCREMENT,
  `cliente` varchar(32) DEFAULT NULL,
  `colaborador` varchar(12) DEFAULT NULL,
  `datahora` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` int DEFAULT '0',
  PRIMARY KEY (`idpedido`),
  KEY `cliente_idx` (`cliente`),
  KEY `colaborador_idx` (`colaborador`),
  CONSTRAINT `cliente` FOREIGN KEY (`cliente`) REFERENCES `usuario` (`usuario`),
  CONSTRAINT `colaborador` FOREIGN KEY (`colaborador`) REFERENCES `colaborador` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.pedido: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` (`idpedido`, `cliente`, `colaborador`, `datahora`, `status`) VALUES
	(1, 'chaves', NULL, NULL, 1),
	(2, 'Mario', NULL, NULL, 1),
	(3, 'antonela', NULL, NULL, 1),
	(4, 'luizinacio', NULL, NULL, 1);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.pesquisa
CREATE TABLE IF NOT EXISTS `pesquisa` (
  `registro` int NOT NULL DEFAULT '10000',
  `pedido` int DEFAULT NULL,
  `datahora` datetime DEFAULT CURRENT_TIMESTAMP,
  `produtos_nota` float DEFAULT NULL,
  `atendimento_nota` float DEFAULT NULL,
  `satisfacao_nota` float DEFAULT NULL,
  `entrega_nota` int DEFAULT NULL,
  `produto_obs` varchar(95) DEFAULT NULL,
  `atendimento_obs` varchar(255) DEFAULT NULL,
  `dous` varchar(255) DEFAULT NULL,
  `validador` varchar(17) DEFAULT NULL,
  PRIMARY KEY (`registro`),
  KEY `pedido_pesquisa_idx` (`pedido`),
  CONSTRAINT `pedido_pesquisa` FOREIGN KEY (`pedido`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.pesquisa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pesquisa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesquisa` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.pessoa
CREATE TABLE IF NOT EXISTS `pessoa` (
  `idpessoa` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(32) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `sobrenome` varchar(45) DEFAULT NULL,
  `email` varchar(115) DEFAULT NULL,
  `tel1` varchar(11) DEFAULT NULL,
  `tel2` varchar(11) DEFAULT NULL,
  `nascimento` datetime DEFAULT NULL,
  `dataregistro` datetime DEFAULT CURRENT_TIMESTAMP,
  `protocolo` int DEFAULT '0',
  PRIMARY KEY (`idpessoa`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  KEY `usuarioPessoa_idx` (`usuario`),
  CONSTRAINT `usuarioPessoa` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.pessoa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` (`idpessoa`, `usuario`, `nome`, `sobrenome`, `email`, `tel1`, `tel2`, `nascimento`, `dataregistro`, `protocolo`) VALUES
	(1, 'chaves', 'davidson george', 'silverio correa', 'daviiiwilliams@live.com', '21974092027', '21974092027', '1990-03-29 14:43:03', '2021-05-20 14:43:12', 0);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `idprodutos` int NOT NULL AUTO_INCREMENT,
  `nomeoriginal` varchar(20) DEFAULT NULL,
  `nomefantasia` varchar(32) DEFAULT NULL,
  `valororiginal` float DEFAULT '0',
  `tipo` int DEFAULT '0',
  `disponibilidade` int DEFAULT '1',
  `federal` float DEFAULT '0',
  `estadual` float DEFAULT '0',
  `icms` float DEFAULT '0',
  `confins` float DEFAULT '0',
  `bonus` float DEFAULT '0',
  `auxinvst` float DEFAULT '0',
  `reserva` float DEFAULT '0',
  `regional` float DEFAULT '0',
  `valorreal` float DEFAULT '0',
  `descr` text,
  `alergia` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '0',
  `ingredientes` text,
  PRIMARY KEY (`idprodutos`),
  UNIQUE KEY `nomeoriginal_UNIQUE` (`nomeoriginal`),
  UNIQUE KEY `nomefantasia_UNIQUE` (`nomefantasia`),
  KEY `pdt_grupo_idx` (`tipo`),
  CONSTRAINT `pdt_grupo` FOREIGN KEY (`tipo`) REFERENCES `grupo` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=1039 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.produtos: ~50 rows (aproximadamente)
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` (`idprodutos`, `nomeoriginal`, `nomefantasia`, `valororiginal`, `tipo`, `disponibilidade`, `federal`, `estadual`, `icms`, `confins`, `bonus`, `auxinvst`, `reserva`, `regional`, `valorreal`, `descr`, `alergia`, `status`, `ingredientes`) VALUES
	(1, 'pzacal', 'calabresa', 20.89, 1, 7, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Pizza Calabresa com Cebola, Queijo Mussarela, Oregano, Massa média padrão.  \r\n                    \r\n                    \r\n                    \r\n                    ', '86', 0, NULL),
	(2, 'pzachov', 'anchovas', 21.95, 1, 0, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Pizza Anchovas com Tomate, Manjericão, Queijo Mussarela, Oregano e temperos especiais, Massa média padrão. (ATENÇÃO: Este produto contem gluten e leite.)', '0', 0, NULL),
	(3, 'pzafrang', 'frango', 19.95, 1, 99, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Pizza Frango com Catupiry, Salsinha, Oregano e temperos especiais. (leite, gluten) happy hour\r\n                      \r\n                      \r\n                      ', '0\r\n                    \r\n                    \r\n                    ', 1, NULL),
	(4, 'pzaatum', 'atum', 21.95, 1, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Pizza Atum com Cebola, Queijo Mussarela, Oregano, Catupiry e temperos especiais, Massa média padrão.\r\n                      \r\n                      ', '0\r\n                    \r\n                    ', 1, NULL),
	(5, 'pzamusa', 'mussarela', 19.95, 1, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Pizza Mussarela com Tomate, Oregano e temperos especiais, Massa média padrão.\r\n                      \r\n                      \r\n                      \r\n                      \r\n                      \r\n                      \r\n                      \r\n                      \r\n                      \r\n                      \r\n                    \r\n                    ', '86', 0, NULL),
	(6, 'pzanpol', 'napolitano', 20.95, 1, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Pizza Napolitano, Tomate, Azeitona, Queijo Mussarela, Oregano e temperos especiais, Massa média padrão.\r\n                    \r\n                    ', '0', 0, NULL),
	(7, 'pzapmito', 'palmito', 20, 1, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Pizza Palmito com Tomate, Queijo Mussarela, Oregano e temperos especiais, Massa média padrão.', '0', 0, NULL),
	(8, 'pzappro', 'pepperoni', 19.95, 1, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Pizza Napolitano, Tomate, Azeitona, Queijo Mussarela, Oregano e temperos especiais, Massa média padrão.', '0', 0, NULL),
	(9, 'pzamarga', 'margarita', 19.95, 1, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Pizza Napolitano, Tomate, Azeitona, Queijo Mussarela, Oregano e temperos especiais, Massa média padrão.', '0', 0, NULL),
	(10, 'pzaportuga', 'portuguêsa', 21.15, 1, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Pizza Napolitano, Tomate, Azeitona, Queijo Mussarela, Oregano e temperos especiais, Massa média padrão.', '0', 0, NULL),
	(11, 'pzachampi', 'champignon', 19.35, 1, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Pizza Napolitano, Tomate, Azeitona, Queijo Mussarela, Oregano e temperos especiais, Massa média padrão.', '0', 0, NULL),
	(12, 'pzaveggie', 'veggie', 20.4, 1, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Pizza Napolitano, Tomate, Azeitona, Queijo Mussarela, Oregano e temperos especiais, Massa média padrão.', '0', 0, NULL),
	(16, 'dbbordo750', 'Dom Bosco Bordô', 29, 11, 98, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Hamburguer Artesanal LECTER®, Dupla Carne especial, Salada(alface, tomace, cebola, picles), Queijo Especial, Bacon e molho SSJ®', '0', 0, NULL),
	(17, 'dbtsuave750', 'Dom Bosco T Suave', 22, 11, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'sem descrição... ainda', '0', 0, NULL),
	(18, 'dbbsuave750', 'Dom Bosco B Suave', 23, 11, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'sem descrição... ainda', '0', 0, NULL),
	(19, 'dbtseco750', 'Dom Bosco T Seco', 22, 11, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'sem descrição... ainda', '0', 0, NULL),
	(20, 'dbbseco750', 'Dom Bosco B Seco', 23, 11, 98, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'sem descrição... ainda', '0', 0, NULL),
	(201, 'djayh', 'Djayh R. Rich', 19.95, 2, 99, 72, 0, 0, 0, 0, 0, 0, 0, 0, 'Hamburguer Artesanal HANNI®, Dupla Carne Especial 120G, Bacon, Picles, Queijo Especial, Pão Bri\'tix e Molho Balls®\r\n                    ', '0', 0, NULL),
	(202, 'dougb', 'Doug D. B.', 18.95, 2, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Hamburguer Artesanal LECTER®, Dupla Carne especial, Salada(alface, tomace, cebola, picles), Queijo Especial, Bacon e molho SSJ®\r\n                      ', '0\r\n                    ', 0, NULL),
	(203, 'blackthunder', 'black thunder', 19.95, 2, 98, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Hamburguer Artesanal LECTER®, Dupla Carne especial, Salada(alface, tomace, cebola, picles), Queijo Especial, Bacon e molho SSJ®', '0', 0, NULL),
	(204, 'famous', 'famous cdd', 17, 2, 0, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Hamburguer Artesanal LECTER®, Dupla Carne especial, Salada(alface, tomace, cebola, picles), Queijo Especial, Bacon e molho SSJ®', '0', 0, NULL),
	(205, 'jhon jao', 'jhon jão', 18.95, 2, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Hamburguer Artesanal LECTER®, Dupla Carne especial, Salada(alface, tomace, cebola, picles), Queijo Especial, Bacon e molho SSJ®', '0', 0, NULL),
	(1001, 'calft cx 5kg', 'calabresa fatiada', 2, 14, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'sem descrição... ainda', NULL, 2, NULL),
	(1002, 'frfat cx 5kg', 'frango 200g', 2, 14, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'sem descrição... ainda', NULL, 2, NULL),
	(1003, 'frdsf cx 5kg', 'frango desfiado', 2, 14, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'sem descrição... ainda', NULL, 2, NULL),
	(1004, 'hbund cx 5kg', 'hamburguer 200g', 2, 14, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'sem descrição... ainda', NULL, 2, NULL),
	(1005, 'django', 'django', 19.95, 2, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Hamburguer Artesanal LECTER®, Dupla Carne especial, Salada(alface, tomace, cebola, picles), Queijo Especial, Bacon e molho SSJ®\r\n                    ', '0', 1, NULL),
	(1007, 'julias', 'julias', 12, 4, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Hamburguer Artesanal LECTER®, Dupla Carne especial, Salada(alface, tomace, cebola, picles), Queijo Especial, Bacon e molho SSJ®\r\n                      ', '0\r\n                    ', 0, NULL),
	(1008, 'fine pickles', 'fine pickles', 10, 4, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Hamburguer Artesanal LECTER®, Dupla Carne especial, Salada(alface, tomace, cebola, picles), Queijo Especial, Bacon e molho SSJ®', '0', 0, NULL),
	(1009, 'cocalata', 'coca cola lata', 4, 10, 101, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'sem descrição... ainda', '0', 0, NULL),
	(1010, 'zerolata', 'coca zero lata', 4, 10, 96, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'sem descrição... ainda', '0', 0, NULL),
	(1011, 'coca2l', 'coca cola 2 litros', 7, 10, 98, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'sem descrição... ainda', '0', 0, NULL),
	(1012, 'slara', 'suco laranja', 3.6, 9, 98, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Suco natural da fruta laranja, espremida na hora. Servida em um copo com gelo. 410ml', '0', 0, NULL),
	(1013, 'saclara', 'suco acerola lara', 3.6, 9, 97, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Suco natural da fruta acerola, feito na hora. Servida em um copo com gelo. 410ml (este produto tem opção garrafa 1L pedindo duas unidades)', '0', 0, NULL),
	(1014, 'smora', 'suco morango', 3.6, 9, 2, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Suco natural da fruta acerola, feito na hora. Servida em um copo com gelo. 410ml\r\n                    \r\n                    \r\n                    ', '0', 2, NULL),
	(1015, 'sabacaxi', 'suco abacaxi', 3.6, 9, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Suco natural da fruta acerola, feito na hora. Servida em um copo com gelo. 410ml', '0', 0, NULL),
	(1016, 'smara', 'suco maracuja', 3.6, 9, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Suco natural da fruta acerola, feito na hora. Servida em um copo com gelo. 410ml', '0', 0, NULL),
	(1017, 'sgoiaba', 'suco goiaba', 3.6, 9, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Suco natural da fruta acerola, feito na hora. Servida em um copo com gelo. 410ml', '0', 0, NULL),
	(1018, 'sacai', 'suco açai', 3.6, 9, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Suco natural da fruta acerola, feito na hora. Servida em um copo com gelo. 410ml', '0', 0, NULL),
	(1019, 'saclora', 'suco acerola', 3.6, 9, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Suco natural da fruta acerola, feito na hora. Servida em um copo com gelo. 410ml (este produto tem opção garrafa 1L pedindo duas unidades)', '0', 0, NULL),
	(1025, 'marychanty', 'mary chanty', 19.95, 3, 97, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Sobremesa de bola de sorvete, caramelizada com nozes', '0', 0, NULL),
	(1026, 'jonanilha', 'jonanilha', 19.95, 3, 98, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Sobremesa de Brownei de chocolate, com bolo de cenoura, sorvete de baunilha, calda de chocolate', '0', 0, NULL),
	(1027, 'vig veggie', 'vig veggie', 19.95, 5, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'sem descrição... ainda', '0', 0, NULL),
	(1029, 'ramal', 'Ramal JP', 19.95, 16, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'sem descrição... ainda\r\n                      \r\n                      ', '0\r\n                    \r\n                    ', 0, NULL),
	(1031, 'chicken f', 'Chicken and Fritas', 19.95, 16, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'sem descrição... ainda', '0', 0, NULL),
	(1033, 'manocheddar', 'manocheddar', 19.95, 7, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'sem descrição... ainda', '0', 0, NULL),
	(1035, 'chickendjon', 'chickendjon', 19.95, 7, 100, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'sem descrição... ainda', '0', 0, NULL),
	(1036, 'titan', 'fabuloso titan', 19.95, 2, 0, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Hamburguer Artesanal LECTER®, Dupla Carne especial, Salada(alface, tomace, cebola, picles), Queijo Especial, Bacon e molho SSJ®', '0', 0, NULL),
	(1037, 'caesar ac', 'Salada Caesar', 12.95, 8, 100, 15, 9, 20, 7, 9, 4.5, 10, 15, 0, 'Salada com alfaces especiais, parmesão, crutons de alho, molho caesar', '0', 0, NULL),
	(1038, 'veron', 'veron especial', 16.95, 2, 0, 15, 9, 20, 7, 9, 4.5, 0, 15, 0, 'Hamburguer Artesanal LECTER®, Dupla Carne especial, Salada(alface, tomace, cebola, picles), Queijo Especial, Bacon e molho SSJ®', '0', 0, NULL);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.prod_detalhes
CREATE TABLE IF NOT EXISTS `prod_detalhes` (
  `produto` int NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `alergenicos` varchar(255) DEFAULT NULL,
  `calorias` float DEFAULT NULL,
  PRIMARY KEY (`produto`),
  CONSTRAINT `listaProdutosXDescri` FOREIGN KEY (`produto`) REFERENCES `produtos` (`idprodutos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.prod_detalhes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `prod_detalhes` DISABLE KEYS */;
/*!40000 ALTER TABLE `prod_detalhes` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.relatorio_e_s_p
CREATE TABLE IF NOT EXISTS `relatorio_e_s_p` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datahora` datetime DEFAULT CURRENT_TIMESTAMP,
  `cliente` varchar(32) DEFAULT NULL,
  `vendedor` varchar(12) DEFAULT NULL,
  `produto` int DEFAULT NULL,
  `comanda` int DEFAULT NULL,
  `pedido` int DEFAULT NULL,
  `disp_anterior` int DEFAULT NULL,
  `disp_atual` int DEFAULT NULL,
  `obs` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendedor_dstino_idx` (`vendedor`),
  CONSTRAINT `vendedor_dstino` FOREIGN KEY (`vendedor`) REFERENCES `colaborador` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.relatorio_e_s_p: ~125 rows (aproximadamente)
/*!40000 ALTER TABLE `relatorio_e_s_p` DISABLE KEYS */;
INSERT INTO `relatorio_e_s_p` (`id`, `datahora`, `cliente`, `vendedor`, `produto`, `comanda`, `pedido`, `disp_anterior`, `disp_atual`, `obs`) VALUES
	(2, '2021-10-28 15:11:12', 'chaves', 'chaves', 1, 37, 37, 5, 1, 'adicionado pelo cliente'),
	(3, '2021-10-28 15:13:37', 'chavesd', 'chaves', 1, 36, 36, 1, 0, 'adicionado pelo cliente'),
	(4, '2021-10-28 15:13:46', 'chavesd', 'chaves', 1, 36, 36, 1, 2, 'cancelado pelo cliente'),
	(5, '2021-10-28 15:14:49', 'chaves', 'chaves', 1, 37, 37, 5, 9, 'cancelado pelo cliente'),
	(6, '2021-10-28 15:15:02', 'chaves', 'chaves', 1, 37, 37, 5, 1, 'adicionado pelo cliente'),
	(7, '2021-10-28 15:15:53', 'chaves', 'chaves', 1, 37, 37, 5, 9, 'cancelado pelo cliente'),
	(8, '2021-10-28 15:16:41', 'chaves', 'chaves', 1, 37, 37, 5, 4, 'adicionado pelo cliente'),
	(9, '2021-10-28 15:16:48', 'chaves', 'chaves', 1, 37, 37, 5, 6, 'cancelado pelo cliente'),
	(10, '2021-10-28 15:17:16', 'chaves', 'chaves', 1, 37, 37, 5, 4, 'adicionado pelo cliente'),
	(11, '2021-10-28 15:17:21', 'chaves', 'chaves', 1, 37, 37, 5, 4, 'cancelado pelo cliente'),
	(12, '2021-10-28 15:17:43', 'chaves', 'chaves', 1, 37, 37, 5, 4, 'adicionado pelo cliente'),
	(13, '2021-10-28 15:17:57', 'chaves', 'chaves', 1, 37, 37, 5, 6, 'cancelado pelo cliente'),
	(14, '2021-10-28 15:18:33', 'chaves', 'chaves', 1, 37, 37, 5, 4, 'adicionado pelo cliente'),
	(15, '2021-10-28 15:18:37', 'chaves', 'chaves', 1, 37, 37, 4, 5, 'cancelado pelo cliente'),
	(16, '2021-10-28 15:19:19', 'chavesd', 'chaves', 1, 36, 36, 5, 0, 'adicionado pelo cliente'),
	(17, '2021-10-28 15:20:11', 'chavesd', 'chaves', 1, 36, 36, 0, 5, 'cancelado pelo cliente'),
	(18, '2021-10-28 15:20:31', 'chavesd', 'chaves', 1, 36, 36, 5, 2, 'adicionado pelo cliente'),
	(19, '2021-10-28 15:20:47', 'chavesd', 'chaves', 8, 36, 36, 117, 114, 'adicionado pelo cliente'),
	(20, '2021-10-28 15:21:40', 'chavesd', 'chaves', 1009, 36, 36, 3, 1, 'adicionado pelo cliente'),
	(21, '2021-10-29 13:30:01', 'chavesd', 'chaves', 1, 36, 36, 2, 1, 'adicionado pelo cliente'),
	(22, '2021-10-29 13:31:31', 'chavesd', 'chaves', 1, 36, 36, 1, 0, 'adicionado pelo cliente'),
	(23, '2021-10-29 13:31:44', 'chavesd', 'chaves', 1, 36, 36, 0, 3, 'cancelado pelo cliente'),
	(24, '2021-10-29 13:41:59', 'chaves', 'chaves', 1, 37, 37, 3, 0, 'adicionado pelo cliente'),
	(25, '2021-10-29 13:43:25', 'chaves', 'chaves', 2, 37, 37, 231, 229, 'adicionado pelo cliente'),
	(26, '2021-10-29 14:57:43', 'chaves', 'chaves', 8, 37, 37, 114, 103, 'adicionado pelo cliente'),
	(27, '2021-10-29 14:58:22', 'chaves', 'chaves', 10, 37, 37, 44, 25, 'adicionado pelo cliente'),
	(28, '2021-10-30 12:42:55', 'chaves', 'chaves', 5, 37, 37, 123, 122, 'adicionado pelo cliente'),
	(29, '2021-10-30 12:48:57', 'chaves', 'chaves', 1003, 37, 37, 3, 4, 'cancelado pelo cliente'),
	(30, '2022-05-04 02:42:59', 'chaves', 'chaves', 10, 37, 37, 25, 44, 'removido pelo cliente'),
	(31, '2022-05-04 02:43:01', 'chaves', 'chaves', 8, 37, 37, 103, 114, 'removido pelo cliente'),
	(32, '2022-05-04 08:30:01', 'chaves', 'chaves', 2, 39, 39, 229, 228, 'adicionado pelo cliente'),
	(33, '2022-05-04 08:30:06', 'chaves', 'chaves', 8, 39, 39, 114, 113, 'adicionado pelo cliente'),
	(34, '2022-05-04 09:20:28', 'chaves', 'chaves', 2, 40, 40, 228, 226, 'adicionado pelo cliente'),
	(35, '2022-05-04 09:20:36', 'chaves', 'chaves', 3, 40, 40, 115, 113, 'adicionado pelo cliente'),
	(36, '2022-05-04 09:51:04', 'chaves', 'chaves', 1013, 41, 41, 3, 1, 'adicionado pelo cliente'),
	(37, '2022-05-04 12:40:23', 'chaves', 'chaves', 5, 42, 42, 122, 120, 'adicionado pelo cliente'),
	(38, '2022-05-04 12:40:33', 'chaves', 'chaves', 3, 42, 42, 113, 111, 'adicionado pelo cliente'),
	(39, '2022-05-04 12:40:58', 'chaves', 'chaves', 1013, 42, 42, 1, 0, 'adicionado pelo cliente'),
	(40, '2022-05-04 12:41:13', 'chaves', 'chaves', 1016, 42, 42, 3, 1, 'adicionado pelo cliente'),
	(41, '2022-05-04 12:41:23', 'chaves', 'chaves', 1009, 42, 42, 1, 0, 'adicionado pelo cliente'),
	(42, '2022-05-04 12:41:42', 'chaves', 'chaves', 10, 42, 42, 44, 41, 'adicionado pelo cliente'),
	(43, '2022-05-04 15:57:43', 'chaves', 'chaves', 10, 42, 42, 41, 44, 'removido pelo cliente'),
	(44, '2022-05-04 15:57:44', 'chaves', 'chaves', 5, 42, 42, 120, 122, 'removido pelo cliente'),
	(45, '2022-05-04 15:57:45', 'chaves', 'chaves', 3, 42, 42, 111, 113, 'removido pelo cliente'),
	(46, '2022-05-04 15:57:46', 'chaves', 'chaves', 1013, 42, 42, 0, 1, 'removido pelo cliente'),
	(47, '2022-05-04 15:57:47', 'chaves', 'chaves', 1016, 42, 42, 1, 3, 'removido pelo cliente'),
	(48, '2022-05-04 15:57:48', 'chaves', 'chaves', 1009, 42, 42, 0, 1, 'removido pelo cliente'),
	(49, '2022-05-04 16:50:59', 'chaves', 'chaves', 1025, 43, 43, 23, 22, 'adicionado pelo cliente'),
	(50, '2022-05-04 16:51:05', 'chaves', 'chaves', 1025, 43, 43, 22, 23, 'removido pelo cliente'),
	(51, '2022-05-04 17:25:47', 'chaves', 'chaves', 1, 44, 44, 11, 10, 'adicionado pelo cliente'),
	(52, '2022-05-05 14:50:03', 'chaves', 'chaves', 1, 45, 45, 10, 9, 'adicionado pelo cliente'),
	(53, '2022-05-06 02:48:50', 'demitre', 'chaves', 1, 46, 46, 9, 8, 'adicionado pelo cliente'),
	(54, '2022-05-06 03:30:12', 'chaves', 'chaves', 1, 45, 45, 8, 9, 'removido pelo cliente'),
	(55, '2022-05-06 03:30:22', 'chaves', 'chaves', 1, 45, 45, 9, 7, 'adicionado pelo cliente'),
	(56, '2022-05-06 03:30:27', 'chaves', 'chaves', 8, 45, 45, 113, 111, 'adicionado pelo cliente'),
	(57, '2022-05-06 03:30:42', 'chaves', 'chaves', 1009, 45, 45, 1, 0, 'adicionado pelo cliente'),
	(58, '2022-05-06 03:31:06', 'chaves', 'chaves', 1013, 45, 45, 1, 0, 'adicionado pelo cliente'),
	(59, '2022-05-06 03:33:25', 'felipe', 'chaves', 1, 38, 38, 7, 6, 'adicionado pelo cliente'),
	(60, '2022-05-06 03:33:34', 'felipe', 'chaves', 8, 38, 38, 111, 108, 'adicionado pelo cliente'),
	(61, '2022-05-05 13:42:25', 'chaves', 'chaves', 1013, 45, 45, 100, 101, 'removido pelo cliente'),
	(62, '2022-05-05 13:53:30', 'chaves', 'chaves', 1, 45, 45, 100, 102, 'removido pelo cliente'),
	(63, '2022-05-05 13:54:06', 'chaves', 'chaves', 1009, 45, 45, 100, 101, 'removido pelo cliente'),
	(64, '2022-05-05 13:54:08', 'chaves', 'chaves', 8, 45, 45, 100, 102, 'removido pelo cliente'),
	(65, '2022-05-05 13:54:16', 'chaves', 'chaves', 1027, 45, 45, 100, 99, 'adicionado pelo cliente'),
	(66, '2022-05-05 14:00:09', 'chaves', 'chaves', 1, 45, 45, 102, 101, 'adicionado pelo cliente'),
	(67, '2022-05-05 14:06:41', 'chaves', 'chaves', 1027, 45, 45, 99, 100, 'removido pelo cliente'),
	(68, '2022-05-05 14:06:51', 'chaves', 'chaves', 1, 45, 45, 101, 100, 'adicionado pelo cliente'),
	(69, '2022-05-09 15:59:06', 'chaves', 'chaves', 1007, 47, 47, 100, 99, 'adicionado pelo cliente'),
	(70, '2022-05-09 15:59:14', 'chaves', 'chaves', 1007, 47, 47, 99, 100, 'removido pelo cliente'),
	(71, '2022-05-09 15:59:31', 'chaves', 'chaves', 1, 47, 47, 100, 99, 'adicionado pelo cliente'),
	(72, '2022-05-09 16:00:34', 'chaves', 'chaves', 1031, 47, 47, 100, 99, 'adicionado pelo cliente'),
	(73, '2022-05-09 16:04:43', 'chaves', 'chaves', 1, 47, 47, 99, 98, 'adicionado pelo cliente'),
	(74, '2022-05-09 16:04:52', 'chaves', 'chaves', 1008, 47, 47, 100, 99, 'adicionado pelo cliente'),
	(75, '2022-05-09 16:25:31', 'chaves', 'chaves', 1, 47, 47, 98, 87, 'adicionado pelo cliente'),
	(76, '2022-05-09 16:25:48', 'chaves', 'chaves', 1, 47, 47, 87, 88, 'removido pelo cliente'),
	(77, '2022-05-09 16:25:52', 'chaves', 'chaves', 1031, 47, 47, 99, 100, 'removido pelo cliente'),
	(78, '2022-05-09 16:25:53', 'chaves', 'chaves', 1, 47, 47, 88, 89, 'removido pelo cliente'),
	(79, '2022-05-09 16:25:56', 'chaves', 'chaves', 1008, 47, 47, 99, 100, 'removido pelo cliente'),
	(80, '2022-05-09 16:25:58', 'chaves', 'chaves', 1, 47, 47, 89, 100, 'removido pelo cliente'),
	(81, '2022-05-09 16:26:07', 'chaves', 'chaves', 1, 47, 47, 100, 0, 'adicionado pelo cliente'),
	(82, '2022-05-09 16:26:28', 'chaves', 'chaves', 1, 47, 47, 0, 100, 'removido pelo cliente'),
	(83, '2022-05-09 16:40:28', 'chaves', 'chaves', 2, 47, 47, 100, 0, 'adicionado pelo cliente'),
	(84, '2022-05-09 16:40:51', 'chaves', 'chaves', 2, 47, 47, 0, 100, 'removido pelo cliente'),
	(85, '2022-05-09 16:44:10', 'chaves', 'chaves', 1, 47, 47, 100, 99, 'adicionado pelo cliente'),
	(86, '2022-05-09 16:44:15', 'chaves', 'chaves', 1, 47, 47, 99, 98, 'adicionado pelo cliente'),
	(87, '2022-05-09 16:44:21', 'chaves', 'chaves', 1, 48, 48, 98, 97, 'adicionado pelo cliente'),
	(88, '2022-05-09 16:44:30', 'chaves', 'chaves', 1, 47, 47, 97, 95, 'adicionado pelo cliente'),
	(89, '2022-05-09 16:44:46', 'chaves', 'chaves', 1, 48, 48, 95, 94, 'adicionado pelo cliente'),
	(90, '2022-05-09 16:45:02', 'chaves', 'chaves', 1, 48, 48, 94, 93, 'adicionado pelo cliente'),
	(91, '2022-05-09 16:45:07', 'chaves', 'chaves', 1, 48, 48, 93, 92, 'adicionado pelo cliente'),
	(92, '2022-05-09 16:45:24', 'chaves', 'chaves', 1, 48, 48, 92, 93, 'removido pelo cliente'),
	(93, '2022-05-09 16:45:25', 'chaves', 'chaves', 1, 48, 48, 93, 94, 'removido pelo cliente'),
	(94, '2022-05-09 16:45:28', 'chaves', 'chaves', 1, 48, 48, 94, 95, 'removido pelo cliente'),
	(95, '2022-05-09 16:45:30', 'chaves', 'chaves', 1, 48, 48, 95, 96, 'removido pelo cliente'),
	(96, '2022-05-09 16:45:39', 'chaves', 'chaves', 1, 48, 48, 96, 95, 'adicionado pelo cliente'),
	(97, '2022-05-09 20:14:54', 'chaves', 'chaves', 1, 49, 49, 95, 94, 'adicionado pelo cliente'),
	(98, '2022-05-16 11:30:58', 'chaves', 'chaves', 1, 49, 49, 94, 95, 'removido pelo cliente'),
	(99, '2022-05-16 11:33:15', 'chaves', 'chaves', 1, 49, 49, 95, 94, 'adicionado pelo cliente'),
	(100, '2022-05-16 11:54:00', 'chaves', 'chaves', 1025, 49, 49, 100, 99, 'adicionado pelo cliente'),
	(101, '2022-05-16 14:02:49', 'chaves', 'chaves', 1, 50, 50, 94, 93, 'adicionado pelo cliente'),
	(102, '2022-05-16 15:04:26', 'chaves', 'chaves', 2, 50, 50, 100, 99, 'adicionado pelo cliente'),
	(103, '2022-05-16 15:04:30', 'chaves', 'chaves', 1027, 50, 50, 100, 99, 'adicionado pelo cliente'),
	(104, '2022-05-16 15:04:33', 'chaves', 'chaves', 1031, 50, 50, 100, 99, 'adicionado pelo cliente'),
	(105, '2022-05-16 15:04:37', 'chaves', 'chaves', 1009, 50, 50, 101, 100, 'adicionado pelo cliente'),
	(106, '2022-05-16 15:04:41', 'chaves', 'chaves', 17, 50, 50, 100, 98, 'adicionado pelo cliente'),
	(107, '2022-07-06 15:25:07', 'chaves', 'chaves', 1, 50, 50, 93, 94, 'removido pelo cliente'),
	(108, '2022-07-06 15:25:18', 'chaves', 'chaves', 2, 50, 50, 99, 100, 'removido pelo cliente'),
	(109, '2022-07-06 15:25:20', 'chaves', 'chaves', 1027, 50, 50, 99, 100, 'removido pelo cliente'),
	(110, '2022-07-06 15:25:22', 'chaves', 'chaves', 1031, 50, 50, 99, 100, 'removido pelo cliente'),
	(111, '2022-07-06 15:25:23', 'chaves', 'chaves', 1009, 50, 50, 100, 101, 'removido pelo cliente'),
	(112, '2022-07-06 15:25:26', 'chaves', 'chaves', 17, 50, 50, 98, 100, 'removido pelo cliente'),
	(113, '2022-07-06 15:25:40', 'chaves', 'chaves', 1, 50, 50, 94, 92, 'adicionado pelo cliente'),
	(114, '2022-08-25 13:10:44', 'chaves', 'chaves', 2, 51, 51, 1, 0, 'adicionado pelo cliente'),
	(115, '2022-08-25 13:15:27', 'chaves', 'chaves', 1, 51, 51, 8, 6, 'adicionado pelo cliente'),
	(116, '2022-08-25 13:17:36', 'chaves', 'chaves', 2, 51, 51, 1, 2, 'removido pelo cliente'),
	(117, '2022-08-25 13:17:39', 'chaves', 'chaves', 1, 51, 51, 6, 8, 'removido pelo cliente'),
	(118, '2022-08-25 13:17:54', 'chaves', 'chaves', 1, 51, 51, 8, 0, 'adicionado pelo cliente'),
	(119, '2022-08-25 13:18:29', 'chaves', 'chaves', 1, 51, 51, 0, 8, 'removido pelo cliente'),
	(120, '2022-08-25 21:20:08', 'chaves', 'chaves', 1, 51, 51, 8, 7, 'adicionado pelo cliente'),
	(121, '2022-08-25 21:20:14', 'chaves', 'chaves', 1, 51, 51, 7, 8, 'removido pelo cliente'),
	(122, '2022-08-27 21:26:04', 'chaves', 'chaves', 1011, 51, 51, 100, 98, 'adicionado pelo cliente'),
	(123, '2022-08-27 21:26:09', 'chaves', 'chaves', 8, 51, 51, 102, 101, 'adicionado pelo cliente'),
	(124, '2022-08-27 21:26:24', 'chaves', 'chaves', 1013, 51, 51, 101, 100, 'adicionado pelo cliente'),
	(125, '2022-08-25 15:38:45', 'chaves', 'chaves', 1, 51, 51, 8, 6, 'adicionado pelo cliente'),
	(126, '2022-08-25 15:39:11', 'chaves', 'chaves', 1, 53, 53, 6, 4, 'adicionado pelo cliente'),
	(127, '2022-08-25 15:39:23', 'chaves', 'chaves', 1, 53, 53, 4, 2, 'adicionado pelo cliente'),
	(128, '2022-08-25 15:39:46', 'chaves', 'chaves', 1, 53, 53, 2, 4, 'removido pelo cliente'),
	(129, '2022-08-25 15:39:46', 'chaves', 'chaves', 1, 53, 53, 4, 6, 'removido pelo cliente'),
	(130, '2022-08-25 15:40:05', 'chaves', 'chaves', 1, 53, 53, 2, 0, 'adicionado pelo cliente'),
	(131, '2022-08-25 15:40:10', 'chaves', 'chaves', 1, 53, 53, 0, 2, 'removido pelo cliente'),
	(132, '2022-08-27 14:06:34', 'chaves', 'chaves', 1, 54, 54, 2, 1, 'adicionado pelo cliente'),
	(133, '2022-08-27 14:06:36', 'chaves', 'chaves', 1, 54, 54, 2, 1, 'adicionado pelo cliente'),
	(134, '2022-08-27 14:06:41', 'chaves', 'chaves', 201, 54, 54, 101, 99, 'adicionado pelo cliente'),
	(135, '2022-08-27 14:06:52', 'chaves', 'chaves', 1011, 54, 54, 98, 96, 'adicionado pelo cliente'),
	(136, '2022-08-27 14:13:20', 'chaves', 'chaves', 1, 54, 54, 1, 2, 'removido pelo cliente'),
	(137, '2022-08-27 14:13:21', 'chaves', 'chaves', 1, 54, 54, 2, 3, 'removido pelo cliente'),
	(138, '2022-08-27 14:13:22', 'chaves', 'chaves', 201, 54, 54, 99, 101, 'removido pelo cliente'),
	(139, '2022-08-27 14:13:23', 'chaves', 'chaves', 1011, 54, 54, 96, 98, 'removido pelo cliente'),
	(140, '2022-08-27 14:17:22', 'chaves', 'chaves', 201, 54, 54, 101, 99, 'adicionado pelo cliente'),
	(141, '2022-08-27 14:17:31', 'chaves', 'chaves', 1009, 54, 54, 101, 99, 'adicionado pelo cliente'),
	(142, '2022-08-27 14:17:49', 'chaves', 'chaves', 1009, 54, 54, 99, 101, 'removido pelo cliente'),
	(143, '2022-08-27 14:17:51', 'chaves', 'chaves', 201, 54, 54, 99, 101, 'removido pelo cliente'),
	(144, '2022-09-06 07:16:50', 'davidson', 'chaves', 1025, 55, 55, 99, 97, 'adicionado pelo cliente'),
	(145, '2022-09-06 07:17:21', 'davidson', 'chaves', 201, 55, 55, 101, 99, 'adicionado pelo cliente'),
	(146, '2022-09-06 07:17:29', 'davidson', 'chaves', 2, 55, 55, 2, 0, 'adicionado pelo cliente'),
	(147, '2022-09-06 07:17:35', 'davidson', 'chaves', 16, 55, 55, 100, 98, 'adicionado pelo cliente'),
	(148, '2022-09-06 07:17:44', 'davidson', 'chaves', 20, 55, 55, 100, 98, 'adicionado pelo cliente'),
	(149, '2022-09-06 07:17:53', 'davidson', 'chaves', 1013, 55, 55, 100, 97, 'adicionado pelo cliente'),
	(150, '2022-09-06 07:17:57', 'davidson', 'chaves', 1, 55, 55, 3, 0, 'adicionado pelo cliente'),
	(151, '2022-09-06 07:18:03', 'davidson', 'chaves', 1026, 55, 55, 100, 98, 'adicionado pelo cliente'),
	(152, '2022-09-06 18:53:34', 'chaves', 'chaves', 3, 1, 1, 100, 98, 'adicionado pelo cliente'),
	(153, '2022-09-06 18:53:43', 'chaves', 'chaves', 1012, 1, 1, 100, 98, 'adicionado pelo cliente'),
	(154, '2022-09-06 19:27:46', 'Mario', 'chaves', 3, 2, 2, 98, 97, 'adicionado pelo cliente'),
	(155, '2022-09-06 19:27:53', 'Mario', 'chaves', 203, 2, 2, 100, 98, 'adicionado pelo cliente'),
	(156, '2022-09-06 19:28:04', 'Mario', 'chaves', 1010, 2, 2, 100, 96, 'adicionado pelo cliente'),
	(157, '2022-09-09 04:09:38', 'chaves', 'chaves', 1012, 1, 1, 98, 100, 'removido pelo cliente'),
	(158, '2022-09-09 04:09:41', 'chaves', 'chaves', 3, 1, 1, 97, 99, 'removido pelo cliente'),
	(159, '2022-09-09 04:09:57', 'chaves', 'chaves', 3, 1, 1, 99, 97, 'adicionado pelo cliente'),
	(160, '2022-09-09 14:56:43', 'chaves', 'chaves', 3, 1, 1, 97, 99, 'removido pelo cliente'),
	(161, '2022-09-09 16:02:55', 'chaves', 'chaves', 1, 1, 1, 10, 9, 'adicionado pelo cliente'),
	(162, '2022-09-09 16:21:06', 'chaves', 'chaves', 1, 1, 1, 9, 7, 'adicionado pelo cliente'),
	(163, '2022-09-09 17:34:19', 'chaves', 'chaves', 201, 1, 1, 99, 97, 'adicionado pelo cliente'),
	(164, '2022-09-09 17:53:43', 'chaves', 'chaves', 1, 1, 1, 7, 8, 'removido pelo cliente'),
	(165, '2022-09-09 17:53:46', 'chaves', 'chaves', 1, 1, 1, 8, 10, 'removido pelo cliente'),
	(166, '2022-09-09 18:14:05', 'antonela', 'chaves', 1, 3, 3, 10, 8, 'adicionado pelo cliente'),
	(167, '2022-09-09 18:30:50', 'chaves', 'chaves', 201, 1, 1, 97, 99, 'removido pelo cliente'),
	(168, '2022-09-09 18:30:56', 'chaves', 'chaves', 5, 1, 1, 100, 98, 'adicionado pelo cliente'),
	(169, '2022-09-09 18:31:20', 'chaves', 'chaves', 201, 1, 1, 99, 97, 'adicionado pelo cliente'),
	(170, '2022-09-09 18:31:25', 'chaves', 'chaves', 1, 1, 1, 8, 6, 'adicionado pelo cliente'),
	(171, '2022-09-09 18:32:34', 'chaves', 'chaves', 1, 1, 1, 6, 4, 'adicionado pelo cliente'),
	(172, '2022-09-10 04:43:24', 'chaves', 'chaves', 5, 1, 1, 98, 100, 'removido pelo cliente'),
	(173, '2022-09-10 04:43:25', 'chaves', 'chaves', 201, 1, 1, 97, 99, 'removido pelo cliente'),
	(174, '2022-09-10 04:43:36', 'chaves', 'chaves', 1, 1, 1, 4, 6, 'removido pelo cliente'),
	(175, '2022-09-10 04:43:37', 'chaves', 'chaves', 1, 1, 1, 6, 8, 'removido pelo cliente'),
	(176, '2022-09-10 04:43:46', 'chaves', 'chaves', 1, 1, 1, 8, 7, 'adicionado pelo cliente'),
	(177, '2022-09-21 17:33:28', 'chaves', 'chaves', 1012, 1, 1, 100, 98, 'adicionado pelo cliente');
/*!40000 ALTER TABLE `relatorio_e_s_p` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.salariobase
CREATE TABLE IF NOT EXISTS `salariobase` (
  `idbase` int NOT NULL,
  `sigla` varchar(8) DEFAULT NULL,
  `funcao` varchar(95) DEFAULT NULL,
  `valorhora` float DEFAULT NULL,
  `carteira` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idbase`),
  UNIQUE KEY `sigla_UNIQUE` (`sigla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.salariobase: ~20 rows (aproximadamente)
/*!40000 ALTER TABLE `salariobase` DISABLE KEYS */;
INSERT INTO `salariobase` (`idbase`, `sigla`, `funcao`, `valorhora`, `carteira`) VALUES
	(100, 'LIMPSAL', 'LIMPEZA DE SALÃO', 5.5, NULL),
	(101, 'ATTSAL', 'GARÇOM', 5.5, NULL),
	(102, 'MTSAL', 'MAITRE', 6, NULL),
	(103, 'LSAL', 'LIDER DE SALÃO', 7, NULL),
	(104, 'GSAL', 'GERENTE DE SALÃO', 8, NULL),
	(150, 'LIMPZIN', 'LIMPEZA DE COZINHA', 6, NULL),
	(151, 'AZIN', 'AUXILIAR COZINHA', 6.5, NULL),
	(152, 'CZIN', 'COZINHEIROS', 7.4, NULL),
	(153, 'LZIN', 'LIDER DE COZINHA', 7.8, NULL),
	(154, 'GZIN', 'GERENTE DE COZINHA', 8.5, NULL),
	(201, 'BARTTD', 'BARTENDER', 6.9, NULL),
	(202, 'GBAR', 'GERENTE DE BAR', 8, NULL),
	(301, 'AEST', 'AUXILIAR DE ESTOQUE', 6, NULL),
	(302, 'CEST', 'CONFERENTE ESTOQUE', 6.5, NULL),
	(303, 'LEST', 'LIDER DE ESTOQUE', 7, NULL),
	(501, 'ACX', 'CAIXA', 7.4, NULL),
	(502, 'GCX', 'GERENTE DE CAIXA', 8, NULL),
	(503, 'FCX', 'FISCAL FINANCEIRO', 9, NULL),
	(504, 'ADM', 'ADMINISTRADOR', 10, NULL),
	(701, 'AEXC', 'AGENTE EXECUTIVO', 11, NULL);
/*!40000 ALTER TABLE `salariobase` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.tema
CREATE TABLE IF NOT EXISTS `tema` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_empresa` varchar(45) DEFAULT NULL,
  `nome_fantasia` text,
  `cnpj` char(15) DEFAULT NULL,
  `inicio_registro` date DEFAULT NULL,
  `fim_registro` date DEFAULT NULL,
  `keycpf_responsavel` char(32) DEFAULT NULL,
  `maquinas` int DEFAULT '1',
  `chave_registro` varchar(128) DEFAULT NULL,
  `tema` int DEFAULT '0',
  `ender` varchar(255) DEFAULT 'rua eneias martins 142 b42 ap 444',
  `complemento` varchar(255) DEFAULT 'Madureira - Rio de janeiro - RJ',
  `complemento2` varchar(115) DEFAULT '-',
  `telefone1` varchar(15) DEFAULT '21983108439',
  `telefone2` varchar(15) DEFAULT '-',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.tema: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
INSERT INTO `tema` (`id`, `nome_empresa`, `nome_fantasia`, `cnpj`, `inicio_registro`, `fim_registro`, `keycpf_responsavel`, `maquinas`, `chave_registro`, `tema`, `ender`, `complemento`, `complemento2`, `telefone1`, `telefone2`) VALUES
	(1, 'lsn ricardo', 'Lan Show Net  Delivery', '012345678901234', '2022-09-09', '2023-09-09', '8686862255', 4, '44', 0, 'rua eneias martins 142 b42 ap 444', 'Madureira - Rio de janeiro - RJ', '-', '21983108439', '-');
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;

-- Copiando estrutura para tabela chavaburg.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario` varchar(32) NOT NULL,
  `senha` varchar(17) DEFAULT NULL,
  `dataregistro` datetime DEFAULT CURRENT_TIMESTAMP,
  `cpf` char(17) DEFAULT NULL,
  `status` int DEFAULT '0',
  `ultimo_login` datetime DEFAULT NULL,
  `ultimo_logoff` datetime DEFAULT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela chavaburg.usuario: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`usuario`, `senha`, `dataregistro`, `cpf`, `status`, `ultimo_login`, `ultimo_logoff`) VALUES
	('antonela', '7d7DE70202e70202', '2022-09-09 18:13:47', NULL, 0, '2022-09-11 16:02:21', '2022-09-11 16:04:34'),
	('chavalo', 'D97F4946E1ead31c', '2021-10-27 10:46:46', NULL, 0, NULL, NULL),
	('chaves', 'C81BAB532Bd17828', '2021-05-20 14:37:09', '1Q10I5A1ehB182101', 1, '2022-09-21 18:05:37', '2022-09-21 17:33:58'),
	('chavesd', 'Dd0F4946E1a0d1fc', '2021-10-27 15:29:26', NULL, 0, NULL, NULL),
	('davidson', 'Df3F4946E1da4ca2', '2021-10-21 10:04:15', NULL, 0, '2022-09-06 06:06:27', NULL),
	('demitre', 'De69357C0121c194', '2022-05-06 02:46:18', NULL, 0, '2022-05-06 03:32:35', '2022-05-06 03:32:47'),
	('fabio', 'D3aF4946E1b0170b', '2021-10-18 02:50:13', NULL, 0, NULL, NULL),
	('felipe', 'C07BAB532B4a88cc', '2021-09-17 13:58:58', NULL, 0, '2022-05-06 03:33:18', NULL),
	('julia', 'DecF4946E125bed8', '2021-10-18 10:55:49', NULL, 0, NULL, NULL),
	('julieta', 'Dd9F4946E13336d3', '2021-10-18 10:39:23', NULL, 0, NULL, NULL),
	('juliete', 'De0F4946E109ed16', '2021-10-18 10:54:40', NULL, 0, NULL, NULL),
	('julio', 'D2cF4946E1730480', '2021-10-18 10:57:45', NULL, 0, NULL, NULL),
	('luizinacio', '2d2D9F0E009f0e00', '2022-09-11 16:06:02', NULL, 0, NULL, '2022-09-11 16:06:52'),
	('manoela', 'D46F4946E19903cc', '2021-10-19 00:33:13', NULL, 0, NULL, NULL),
	('manoelo', 'D17F4946E118ca2e', '2021-10-21 09:30:51', NULL, 0, NULL, NULL),
	('Mario', 'B2d7725265f504b7', '2022-09-06 19:27:41', NULL, 0, NULL, NULL),
	('teste', 'C86BAB532Bd1dce7', '2021-07-13 15:03:00', '1Q10I5A1ehB182101', 0, NULL, NULL),
	('teste2', 'D83F4946E1556719', '2021-10-18 11:08:31', NULL, 0, NULL, NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

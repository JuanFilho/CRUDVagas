DROP DATABASE IF EXISTS crudvagas;
CREATE DATABASE crudvagas;
USE crudvagas;

DROP TABLE IF EXISTS empresas;
CREATE TABLE empresas 
(
    id_empresa					INT NOT NULL AUTO_INCREMENT,
	razao_social				VARCHAR(255) NOT NULL,
    nome_fantasia				VARCHAR(100) NOT NULL,
    cnpj						VARCHAR(50) NOT NULL,
    usuario_id					INT,
    PRIMARY KEY ( id_empresa ),
	UNIQUE ( razao_social, nome_fantasia, cnpj, usuario_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS candidatos;
CREATE TABLE candidatos
(
    id_candidato       			INT NOT NULL AUTO_INCREMENT,
    nome_candidato     			VARCHAR(50) NOT NULL,
    email_candidato       		VARCHAR(20) NOT NULL,
    usuario_id					INT,
    PRIMARY KEY ( id_candidato ),
    UNIQUE ( nome_candidato, email_candidato, usuario_id )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS vagas;
CREATE TABLE vagas
(
    id_vaga      				INT NOT NULL AUTO_INCREMENT,
    nome_vaga     				VARCHAR(50) NOT NULL,
    descricao_vaga       		VARCHAR(2000) NOT NULL,
    email_contato				VARCHAR(60) NOT NULL,
    telefone_contato			VARCHAR(20) NOT NULL,
    PRIMARY KEY ( id_vaga ),
    UNIQUE ( email_contato, telefone_contato )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios 
(
    id_usuario        		INT NOT NULL AUTO_INCREMENT,
    user_usuario      		VARCHAR(20) NOT NULL,
    password_usuario  		VARCHAR(255) NOT NULL,
    regra_usuario			VARCHAR(20) NOT NULL,
    ativo_usuario			BOOLEAN NULL DEFAULT 0,
    PRIMARY KEY ( id_usuario ),
    UNIQUE ( user_usuario )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


ALTER TABLE candidatos
    ADD CONSTRAINT candidatos_usuarios_fk FOREIGN KEY ( usuario_id )
        REFERENCES usuarios ( id_usuario );

ALTER TABLE empresas
    ADD CONSTRAINT empresas_usuarios_fk FOREIGN KEY ( usuario_id )
        REFERENCES usuarios ( id_usuario );
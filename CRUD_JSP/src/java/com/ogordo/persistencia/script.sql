CREATE DATABASE crud_jsp;

USE crud_jsp

CREATE TABLE tbl_cliente(
clie_cod_cliente INT NOT NULL AUTO_INCREMENT,
clie_nome VARCHAR(50),
clie_telefone VARCHAR(15),
clie_email VARCHAR(100),
clie_site VARCHAR(100),
PRIMARY KEY (clie_cod_cliente)
);

DESC tbl_cliente;
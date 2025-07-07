-- Esse script está destinado como resumo e aprendizagem de comandos SQL 
-- Assim se faz um comentário de uma linha

/* Assim se faz
um comentário 
de varias linhas 
*/
/* Dicas de SQL:
Não use  letras maiusculas e caracteres especiais ao dar nomes aos campos;
use caixa alta para declarações/definir os comandos SQL para melhor entendimento/leitura;
*/

-- CREATE DATABASE = criar tabela
CREATE TABLE estado( 
estado_id  INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 /* INT/INTEGER: Para numeros inteiros;
 AUTO_INCREMENT: Gera numeros automaticamente, só funciona com INT pois exige numeros inteiros;
 PK: Defini como chave primaria;
*/
descricao VARCHAR(40),
/* VARCHAR: Texto de tamanho definido pelo programador; melhor para telefones 
por adicionar hífens, parenteses e espaços */
UF CHAR(2) NOT NULL
/*  CHAR: Texto de tamanho definido pelo programador;
NOT NULL: Nao pode estar vazio 
*/
);

CREATE TABLE cidade(
cidade_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
descricao VARCHAR (100) NOT NULL,
estado_id INT NOT NULL,
FOREIGN KEY (estado_id) REFERENCES estado(id)
/* FOREIGN KEY = chave estrangeira;

Tradução da escrita FK:
ligação dessa tabela pela chave estrangeira "estado_id",
referente a tabela estado com o campo/coluna id;

*/
);

CREATE TABLE cliente(
cliente_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(40) NOT NULL,
data_nascimento DATE,
email VARCHAR(30) UNIQUE,
senha VARCHAR(200) NOT NULL,
telefone VARCHAR(12),
rua VARCHAR(100),
numero VARCHAR(100),
complemento VARCHAR(100),
bairro VARCHAR(100),
referencia VARCHAR(100),
cep VARCHAR(100),
cidade_id INT,
FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);	  

CREATE TABLE restaurante(
restaurante_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
razao_social VARCHAR(100),
nome_fantasia VARCHAR(100),
telefone VARCHAR(100) UNIQUE,
rua VARCHAR(100),
numero VARCHAR(100),
complemento VARCHAR(100),
bairro VARCHAR(100),
referencia VARCHAR(100),
cep VARCHAR(100),
cidade_id INT,
FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

CREATE TABLE Funcionario(
funcionario_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(100),
email VARCHAR(100),
senha VARCHAR(100) NOT NULL,
data_nascimento DATE,
data_admissao DATE,
telefone VARCHAR(12),
rua VARCHAR(100),
numero VARCHAR(100),
complemento VARCHAR(100),
bairro VARCHAR(100),
referencia VARCHAR(100),
cep VARCHAR(100),
Cidade_id INT,
FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

CREATE TABLE entregador(
entregador_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(100),
telefone VARCHAR(12),
cnh INT,
rua VARCHAR(100),
numero VARCHAR(100),
complemento VARCHAR(100),
bairro VARCHAR(100),
referencia VARCHAR(100),
cep VARCHAR(100),
Cidade_id INT,
FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

CREATE TABLE pedido (
pedido_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
data_pedido DATE,
 /* DATE: usado para escolher data
 Entenda a diferença:
 DATE ≠ DATA
 DATE = data(portugues)
 DATA = dados(portugues)
 */
 
 
total INT,
status_pedido VARCHAR(100),
cliente_id INT,
FOREIGN KEY (cliente_id) REFERENCES cliente(id),
restaurante_id INT,
FOREIGN KEY (restaurante_id) REFERENCES restaurante(id),
entregador_id INT,
FOREIGN KEY (entregador_id) REFERENCES entregador(id)
);

CREATE TABLE produto(
produto_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
valor INT NOT NULL,
estoque VARCHAR(100),
tipo VARCHAR(100)
);

CREATE TABLE pedido_produto(
pedido_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
FOREIGN KEY (pedido_id) REFERENCES pedido(id),
FOREIGN KEY (produto_id) REFERENCES produto(id)
);


-- espaco para inserir outros comandos para resumo
/*
Para inserir dados: INSERT INTO ... 
Ex.: INSERT INTO produto (id, descricao, preco) VALUE (1, 'smartphone xpto',1500.99)
Como saber se realmente inseriu? use SELECT
Ex.: SELECT * FROM produto (mostre me a tabela);
Como mostrar as tabelas?
SHOW TABLES
Para apagar a tabela/BD: DROP TABLE/DATABASE ...



CONSTRAINT = seria meio que uma restrição (revisa melhor)
*/



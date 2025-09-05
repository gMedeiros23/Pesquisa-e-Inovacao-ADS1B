-- GRUPO 4
-- Daner Gary Mamani Quispe - RA 01252047
-- Débora Marsal Mato Rodriguez - RA 01252000
-- Gabriel Medeiros Nascimento - RA 01252035
-- Lucas Ciriaco Borba - RA 01252132
-- Matheus Pereira dos Santos - RA 01252118

create DATABASE v3t;
use v3t;

 create table empresa(
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(60) NOT NULL,
    cnpj VARCHAR(14) UNIQUE, 
	rua VARCHAR(50),
    cidade VARCHAR(50),
    uf VARCHAR(2),
    cep VARCHAR(8),
    bairro VARCHAR(50),
    senhaEmpresa VARCHAR(30) NOT NULL,
    emailEmpresa VARCHAR(30) UNIQUE
    constraint chkemailEmpresa check (emailEmpresa like '%@%')
    );
    
create table monitoramento (
	idRegistro int primary key auto_increment,
	fonteProteina varchar(50),
	dtHora datetime DEFAULT CURRENT_TIMESTAMP , 
	Umidade decimal(3,1),
	Temperatura decimal (5,2),
	situação varchar (30),
	constraint chkSituacao check(estado in('Ideal', 'Não Ideal'))
    );

CREATE TABLE lote_producao(
    idLote INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE,
    descricao VARCHAR(100),
    dataInicio DATE,
    status_lote VARCHAR(20) CHECK 
    (status_lote IN ('em andamento','finalizado','cancelado'))
);

CREATE TABLE alertas(
	idAlertas INT PRIMARY KEY AUTO_INCREMENT,
	tempMax DECIMAL(5, 2) NOT NULL,
	tempMin DECIMAL(5, 2) NOT NULL,
	tempoAlerta DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE proteinas (
    id_proteina INT PRIMARY KEY AUTO_INCREMENT,
    nome_proteina VARCHAR(100) NOT NULL,
    temp_min_proteina DECIMAL(5,2),
    temp_max_proteina DECIMAL(5,2),
    umid_min_proteina DECIMAL(5,2),
    umid_max_proteina DECIMAL(5,2)
);
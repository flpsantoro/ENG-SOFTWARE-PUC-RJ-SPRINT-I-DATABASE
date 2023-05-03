CREATE DATABASE balanca;

-- public.tb_dados_cadastro definition

-- Drop table

-- DROP TABLE public.tb_dados_cadastro;

CREATE TABLE public.tb_dados_cadastro (
	id bigserial NOT NULL,
	altura int4 NOT NULL,
	email varchar(255) NULL,
	nascimento date NOT NULL,
	nome varchar(255) NOT NULL,
	sobrenome varchar(255) NULL,
	CONSTRAINT tb_dados_cadastro_pkey PRIMARY KEY (id)
);

-- public.tb_dados_medidos definition

-- Drop table

-- DROP TABLE public.tb_dados_medidos;

CREATE TABLE public.tb_dados_medidos (
	id bigserial NOT NULL,
	data_medicao timestamp NOT NULL,
	porcen_gordura numeric(19, 2) NULL,
	gordura_visceral int4 NULL,
	idade int4 NULL,
	idade_corporal int4 NULL,
	imc numeric(19, 2) NULL,
	metabolismo_basal int4 NULL,
	porcen_musculo numeric(19, 2) NULL,
	peso numeric(19, 2) NOT NULL,
	dados_cadastro_id int8 NULL,
	CONSTRAINT tb_dados_medidos_pkey PRIMARY KEY (id)
);


-- public.tb_dados_medidos foreign keys

ALTER TABLE public.tb_dados_medidos ADD CONSTRAINT fkftlm8ahd7e0f9udfkxwh2016d FOREIGN KEY (dados_cadastro_id) REFERENCES public.tb_dados_cadastro(id);
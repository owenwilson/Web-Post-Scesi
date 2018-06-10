CREATE SCHEMA horario;

CREATE TABLE usuario ( 
	id_usuario           serial  NOT NULL,
	fecha                date  NOT NULL,
	activo               bool  NOT NULL,
	CONSTRAINT pk_usuario PRIMARY KEY ( id_usuario )
 );


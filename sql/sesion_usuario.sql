CREATE SCHEMA sesion_tbd;

CREATE TABLE sesion_tbd.usuario ( 
	id_usuario           serial  NOT NULL,
	nombre_usuario       varchar(30)  NOT NULL,
	clave_usuario        varchar(45)  NOT NULL,
	apellido_usuario     varchar(45)  NOT NULL,
	ciudad               varchar(55)  NOT NULL,
	correo_usuario       varchar(85)  NOT NULL,
	CONSTRAINT pk_usuario PRIMARY KEY ( id_usuario )
 );

CREATE TABLE sesion_tbd.sesion ( 
	id_sesion            serial  NOT NULL,
	salida               date  NOT NULL,
	entrada              date  NOT NULL,
	pid                  integer  NOT NULL,
	t_usuario            serial  NOT NULL,
	CONSTRAINT pk_sesion PRIMARY KEY ( id_sesion ),
	CONSTRAINT fk_sesion_usuario FOREIGN KEY ( t_usuario ) REFERENCES sesion_tbd.usuario( id_usuario )    
 );

CREATE INDEX idx_sesion ON sesion_tbd.sesion ( t_usuario );


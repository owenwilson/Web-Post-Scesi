CREATE SCHEMA prueba;

CREATE TABLE rol ( 
	id_rol               serial  NOT NULL,
	rol                  varchar(20)  NOT NULL,
	CONSTRAINT pk_rol PRIMARY KEY ( id_rol )
 );

CREATE TABLE usuario ( 
	id_usuario           serial  NOT NULL,
	nombre               varchar(30)  NOT NULL,
	contrasena           varchar(30)  NOT NULL,
	CONSTRAINT pk_usuario PRIMARY KEY ( id_usuario )
 );

CREATE TABLE usuario_rol ( 
	id_usuario_rol       serial  NOT NULL,
	id_rol               serial  NOT NULL,
	CONSTRAINT pk_usuario_rol PRIMARY KEY ( id_usuario_rol )
 );

CREATE INDEX idx_usuario_rol ON usuario_rol ( id_rol );

ALTER TABLE usuario_rol ADD CONSTRAINT fk_usuario_rol_usuario FOREIGN KEY ( id_usuario_rol ) REFERENCES usuario( id_usuario ) ON DELETE CASCADE ON UPDATE CASCADE;

COMMENT ON CONSTRAINT fk_usuario_rol_usuario ON usuario_rol IS '';

ALTER TABLE usuario_rol ADD CONSTRAINT fk_usuario_rol_rol FOREIGN KEY ( id_rol ) REFERENCES rol( id_rol ) ON DELETE CASCADE ON UPDATE CASCADE;

COMMENT ON CONSTRAINT fk_usuario_rol_rol ON usuario_rol IS '';


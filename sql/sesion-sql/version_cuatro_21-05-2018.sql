CREATE SCHEMA sesion_tbd;

CREATE TABLE funcion ( 
	id_funcion           integer  NOT NULL,
	funcion              varchar(50)  NOT NULL,
	CONSTRAINT pk_funcion_0 PRIMARY KEY ( id_funcion )
 );

CREATE INDEX pk_funcion ON funcion ( id_funcion );

CREATE TABLE iu ( 
	id_iu                integer  NOT NULL,
	iu                   varchar(50)  NOT NULL,
	CONSTRAINT pk_iu_0 PRIMARY KEY ( id_iu )
 );

CREATE INDEX pk_iu ON iu ( id_iu );

CREATE TABLE rol ( 
	id_rol               integer  NOT NULL,
	rol                  varchar(50)  NOT NULL,
	CONSTRAINT pk_rol UNIQUE ( id_rol ) ,
	CONSTRAINT pk_rol_0 PRIMARY KEY ( id_rol )
 );

CREATE TABLE rol_funcion ( 
	tabla_rol            integer  NOT NULL,
	tabla_funcion        integer  NOT NULL,
	fecha_inicio         date  ,
	fecha_fin            date  
 );

CREATE INDEX idx_rol_funcion ON rol_funcion ( tabla_rol );

CREATE INDEX idx_rol_funcion_0 ON rol_funcion ( tabla_funcion );

CREATE TABLE sesion ( 
	id_sesion            serial  NOT NULL,
	usuario_sesion       serial  NOT NULL,
	salida               date  ,
	entrada              date  ,
	pid                  integer  NOT NULL,
	CONSTRAINT pk_sesion PRIMARY KEY ( id_sesion )
 );

CREATE INDEX idx_sesion ON sesion ( usuario_sesion );

CREATE TABLE usuario ( 
	id_usuario           serial  NOT NULL,
	nombre               varchar(30)  NOT NULL,
	apellido             varchar(30)  NOT NULL,
	ciudad               varchar(20)  NOT NULL,
	clave                varchar(45)  NOT NULL,
	correo               varchar(50)  NOT NULL,
	CONSTRAINT pk_usuario PRIMARY KEY ( id_usuario )
 );

CREATE TABLE usuario_bitacora ( 
	accion               varchar(20)  NOT NULL,
	fecha                timestamp  NOT NULL,
	id_usuario           integer  NOT NULL,
	nombre               varchar(30)  NOT NULL,
	apellido             varchar(30)  NOT NULL,
	ciudad               varchar(30)  NOT NULL,
	clave                varchar(30)  NOT NULL,
	correo               varchar  NOT NULL
 );

CREATE TABLE usuario_rol ( 
	tabla_usuario        integer  NOT NULL,
	tabla_rol            integer  NOT NULL,
	fecha_inicio         date  ,
	fecha_fin            date  ,
	activo               bool  NOT NULL
 );

CREATE INDEX idx_usuario_rol ON usuario_rol ( tabla_usuario );

CREATE INDEX idx_usuario_rol_0 ON usuario_rol ( tabla_rol );

CREATE TABLE funcion_iu ( 
	tabla_funcion        integer  NOT NULL,
	tabla_iu             integer  
 );

CREATE INDEX idx_funcion_iu ON funcion_iu ( tabla_funcion );

CREATE INDEX idx_funcion_iu_0 ON funcion_iu ( tabla_iu );

ALTER TABLE funcion_iu ADD CONSTRAINT fk_funcion_iu_funcion FOREIGN KEY ( tabla_funcion ) REFERENCES funcion( id_funcion ) ON DELETE CASCADE ON UPDATE CASCADE;

COMMENT ON CONSTRAINT fk_funcion_iu_funcion ON funcion_iu IS '';

ALTER TABLE funcion_iu ADD CONSTRAINT fk_funcion_iu_iu FOREIGN KEY ( tabla_iu ) REFERENCES iu( id_iu ) ON DELETE CASCADE ON UPDATE CASCADE;

COMMENT ON CONSTRAINT fk_funcion_iu_iu ON funcion_iu IS '';

ALTER TABLE rol_funcion ADD CONSTRAINT fk_rol_funcion_rol FOREIGN KEY ( tabla_rol ) REFERENCES rol( id_rol ) ON DELETE CASCADE ON UPDATE CASCADE;

COMMENT ON CONSTRAINT fk_rol_funcion_rol ON rol_funcion IS '';

ALTER TABLE rol_funcion ADD CONSTRAINT fk_rol_funcion_funcion FOREIGN KEY ( tabla_funcion ) REFERENCES funcion( id_funcion ) ON DELETE CASCADE ON UPDATE CASCADE;

COMMENT ON CONSTRAINT fk_rol_funcion_funcion ON rol_funcion IS '';

ALTER TABLE usuario_rol ADD CONSTRAINT fk_usuario_rol_usuario FOREIGN KEY ( tabla_usuario ) REFERENCES usuario( id_usuario ) ON DELETE CASCADE ON UPDATE CASCADE;

COMMENT ON CONSTRAINT fk_usuario_rol_usuario ON usuario_rol IS '';

ALTER TABLE usuario_rol ADD CONSTRAINT fk_usuario_rol_rol FOREIGN KEY ( tabla_rol ) REFERENCES rol( id_rol ) ON DELETE CASCADE ON UPDATE CASCADE;

COMMENT ON CONSTRAINT fk_usuario_rol_rol ON usuario_rol IS '';


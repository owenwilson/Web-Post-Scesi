CREATE SCHEMA sesion_tbd;

CREATE TABLE funcion ( 
	id_funcion           integer  ,
	funcion              varchar(50)  NOT NULL
 );

CREATE TABLE funcion_iu ( 
	tabla_funcion        integer  NOT NULL,
	tabla_iu             integer  
 );

CREATE TABLE iu ( 
	id_iu                integer  NOT NULL,
	iu                   varchar(50)  NOT NULL
 );

CREATE TABLE rol ( 
	id_rol               integer  ,
	rol                  varchar(50)  NOT NULL
 );

CREATE TABLE rol_funcion ( 
	tabla_rol            integer  NOT NULL,
	tabla_funcion        integer  NOT NULL,
	fecha_inicio         date  ,
	fecha_fin            date  
 );

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


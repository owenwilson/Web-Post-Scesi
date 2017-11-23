



CREATE TABLE usuario (
    id_usuario serial,
    login varchar(30) NOT NULL,
    password varchar(30) NOT NULL,
    tipo_usuario varchar(30) NOT NULL,
    CONSTRAINT pk_usuario_iduser PRIMARY KEY (id_usuario)
);

CREATE TABLE sesion(
    id_sesion serial,
    activo boolean,
    usuario_id_usuario integer NOT NULL,
    CONSTRAINT pk_sesion_idsesion PRIMARY KEY (id_sesion),
    CONSTRAINT fk_sesion_usuario FOREIGN KEY (usuario_id_usuario)
    REFERENCES usuario(id_usuario)
);

CREATE TABLE rol(
    id_rol serial,
    descripcion text NOT NULL,
    CONSTRAINT pk_rol_id_rol PRIMARY KEY (id_rol)
);

CREATE TABLE usuario_rol(
    fecha_inicio date,
    fecha_fin date,
    activo boolean,
    sesion_id_sesion integer NOT NULL,
    rol_id_rol integer NOT NULL,
    CONSTRAINT fk_usuario_rol_sesion FOREIGN KEY (sesion_id_sesion)
    REFERENCES sesion(id_sesion),
    CONSTRAINT fk_rol_id_rol FOREIGN KEY (rol_id_rol)
    REFERENCES rol(id_rol)
);

CREATE TABLE funcion(
    id_funcion serial,
    CONSTRAINT pk_funcion_id_funcion PRIMARY KEY (id_funcion)
);

CREATE TABLE rol_funcion(
    rol_id_rol integer NOT NULL,
    funcion_id_funcion integer NOT NULL,
    CONSTRAINT fk_rol_funcion_rol FOREIGN KEY (rol_id_rol)
    REFERENCES rol(id_rol),
    CONSTRAINT fk_rol_funcion_funcion FOREIGN KEY (funcion_id_funcion)
    REFERENCES funcion(id_funcion)
);

CREATE TABLE ui(
    id_ui serial,
    descripcion text NOT NULL,
    CONSTRAINT pk_ui_id_ui PRIMARY KEY (id_ui)
);

CREATE TABLE funcion_ui(
    actvo boolean,
    ui_id_ui integer NOT NULL,
    funcion_id_funcion integer NOT NULL,
    CONSTRAINT fk_funcion_ui_ui FOREIGN KEY (ui_id_ui)
    REFERENCES ui(id_ui),
    CONSTRAINT fk_funcion_ui_funcion FOREIGN KEY (funcion_id_funcion)
    REFERENCES funcion(id_funcion)
);

CREATE TABLE bitacora_usuario
(
   id serial,
   accion varchar(20),
   fecha timestamp,
   fields json
);

CREATE TABLE logs
(
    id_logs serial,
    log_error_session varchar(20),
    log_error_conxion varchar(20),
    CONSTRAINT pk_logs_idlogs PRIMARY KEY (id_logs)
);

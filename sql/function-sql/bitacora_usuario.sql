CREATE OR REPLACE FUNCTION bitacoraUsuario()
RETURNS TRIGGER AS
$body$
DECLARE BEGIN
IF TG_OP = 'INSERT' THEN
INSERT INTO usuario_bitacora (accion,fecha,id_usuario,nombre,apellido,ciudad,clave,correo) VALUES ('INSERTAR',now(),NEW.id_usuario,NEW.nombre,NEW.apellido,NEW.ciudad,NEW.clave,NEW.correo);
RETURN NEW;
ELSIF TG_PO = 'DELETE' THEN
INSERT INTO usuario_bitacora (accion,fecha,id_usuario,nombre,apellido,ciudad,clave,correo) VALUES ('ELIMINADO',now(),OLD.id_usuario,OLD.nombre,OLD.apellido,OLD.ciudad,OLD.clave,OLD.correo);
RETURN NULL;
ELSIF TG_OP = 'UPDATE' THEN
INSERT INTO usuario_bitacora (accion,fecha,id_usuario,nombre,apellido,ciudad,clave,correo) VALUES ('ANTES DE ACTUALIZAR',now(),OLD.id_usuario,OLD.nombre,OLD.apellido,OLD.ciudad,OLD.clave,OLD.correo);
INSERT INTO usuario_bitacora (accion,fecha,id_usuario,nombre,apellido,ciudad,clave,correo) VALUES ('DESPUES DE ACTUALIZAR',now(),NEW.id_usuario,NEW.nombre,NEW.apellido,NEW.ciudad,NEW.clave,NEW.correo);
RETURN NEW;
END IF;
END;
$body$
LANGUAGE plpgsql;

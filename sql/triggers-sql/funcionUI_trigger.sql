CREATE OR REPLACE FUNCTION inserta_funcion_rol()
RETURNS TRIGGER AS $insertar$
DECLARE BEGIN
INSERT INTO usuario_rol VALUES (NEW.id_usuario);
RETURN NULL;
END;
$insertar$ LANGUAGE plpgsql;

CREATE TRIGGER insertar_funcion AFTER INSERT
ON usuario_rol FOR EACH ROW
EXECUTE PROCEDURE inserta_funcion_rol();

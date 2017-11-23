CREATE OR REPLACE FUNCTION bitacora_usuario()
RETURNS TRIGGER
AS
$BODY$
BEGIN
   IF TG_OP = 'INSERT' THEN
        INSERT INTO bitacora_usuario(accion,fecha,fields)
        VALUES(TG_OP, NOW(), row_to_json(NEW));
        RETURN NEW;
   ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO bitacora_usuario(accion,fecha,fields)
        VALUES(TG_OP, NOW(), row_to_json(OLD));
        RETURN NULL;
   ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO bitacora_usuario(accion,fecha,fields)
        VALUES('BEFORE UPDATE', NOW(), row_to_json(OLD));
        RETURN NEW;
        INSERT INTO bitacora_usuario(accion,fecha,fields)
        VALUES('AFTER UPDATE', NOW(), row_to_json(NEW));
        RETURN NEW;
   END IF;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER bitacora_usuario
AFTER INSERT OR UPDATE OR DELETE
ON usuario
FOR EACH ROW
EXECUTE PROCEDURE bitacora_usuario();

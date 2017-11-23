




CREATE TABLE verdad_falso(
		p boolean,
		q boolean,
		r boolean,
		s boolean,
		t boolean,
		u boolean,
		v boolean,
		w boolean
		);

INSERT INTO verdad_falso(p,q,r,s,t,u,v,w) VALUES ('true','false','1','0','y','n');
INSERT INTO verdad_falso(p,q,r,s,t,u,v,w) VALUES ('false','true','0','1','n','y');
INSERT INTO verdad_falso(p,q,r,s,t,u,v,w) VALUES ('false',NULL,'0',NULL,'no',NULL,'n',NULL);
INSERT INTO verdad_falso(p,q,r,s,t,u,v,w) VALUES (NULL,'true',NULL,'1',NULL,'yes',NULL,'y');

INSERT INTO OBJECT_TYPE (NAME, RESERVABLE) VALUES ('ellipse', 0);
delete from object_type where name='ellipse';
INSERT INTO MAP_OBJECT (OBJECT_TYPE_ID, NAME, GPS_DATA) VALUES ( (SELECT id  FROM OBJECT_TYPE WHERE name='ellipse'), 'ellipse',
SDO_GEOMETRY(2003 , 8307, NULL, mdsys.SDO_ELEM_INFO_ARRAY(1, 1003, 4),mdsys.SDO_ORDINATE_ARRAY(16,42, 16,40, 17,41)));

delete from map_object where name='ellipse';

INSERT INTO MAP_OBJECT (OBJECT_TYPE_ID, NAME, GPS_DATA) VALUES ( (SELECT id  FROM OBJECT_TYPE WHERE name='ellipse'), 'ellipse',
SDO_UTIL.ELLIPSE_POLYGON(16.413822,49.399021,7000,7000,90,4));

select * from map_object where name='ellipse';

select * from map_object where object_type_id=1 or object_type_id = 2 or name = 'ellipse';
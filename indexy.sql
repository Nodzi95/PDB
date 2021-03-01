select * from map_object;
--select * from user_sdo_geom_metadata;



delete from user_sdo_geom_metadata where table_name='MAP_OBJECT' and column_name ='GPS_DATA';

insert into user_sdo_geom_metadata(table_name, column_name, diminfo, srid)
values ('MAP_OBJECT', 'GPS_DATA',
sdo_dim_array(sdo_dim_element('LONG', -180.0, 180.0, 0.5),
sdo_dim_element('LAT', -90.0,90.0,0.5)), 8307);

drop index map_object_sidx;
create index map_object_sidx on map_object(gps_data) indextype is mdsys.spatial_index;
COMMIT;

select /*+ LEADING(m1) USE_NL(m1 m2) INDEX(m2 POND_INDEX)*/
m2.name, m2.gps_data gps2, m1.gps_data gps1, sdo_geom.sdo_distance(m1.gps_data, m2.gps_data, 1) distance
from map_object m1, map_object m2 
where m1.id = 8396 and m2.object_type_id = (select id from object_type where name = 'fuel')  order by distance;
--where MDSYS.SDO_NN(m.gps2, m.gps1, 'SDO_NUM_RES=3000, unit=metre', 2) = 'TRUE';


--select m2.name from map_object m2 where m2.object_type_id <> 2  and
--SDO_NN((select gps_data from map_object where id=148), m2.gps_data, 'SDO_NUM_RES=5', 1) = 'TRUE';

SELECT /*+ LEADING(m1) USE_NL(m1 m2) INDEX(m2 POND_INDEX)*/
    m2.name, SDO_NN_DISTANCE(2) DIS 
    FROM MAP_OBJECT m2, MAP_OBJECT m1 
    WHERE m1.id = 204 AND MDSYS.SDO_NN(m2.gps_data, m1.gps_data, 'sdo_num_res=10 unit=metre',2) = 'TRUE' 
    ORDER BY DIS;
--pocet rezervací ve sledovaném období
--validtime period[2018-12-04 - 2019-01-01] select count(*) from reservation
select count(*) from reservation where (date_from >= to_date('2018-12-4','yyyy-mm-dd') and date_to <= to_date('2019-01-01','yyyy-mm-dd')) or ((date_from <= to_date('2018-12-4','yyyy-mm-dd') and date_to >= to_date('2018-12-4','yyyy-mm-dd')) or (date_to >= to_date('2019-01-01','yyyy-mm-dd') and date_from <= to_date('2019-01-01','yyyy-mm-dd')));

--kolik každý uživatel má zaplatit ve sledovanem obdobi
--validtime period[2018-12-04 - 2019-01-01] select sum(r.price), u.e_mail from reservation r right join users u on r.userid = u.id group by e_mail
select sum(r.price), u.e_mail from reservation r right join users u on r.userid = u.id where((date_from >= to_date('2018-12-4','yyyy-mm-dd') and date_to <= to_date('2019-01-01','yyyy-mm-dd')) or ((date_from <= to_date('2018-12-4','yyyy-mm-dd') and date_to >= to_date('2018-12-4','yyyy-mm-dd')) or (date_to >= to_date('2019-01-01','yyyy-mm-dd') and date_from <= to_date('2019-01-01','yyyy-mm-dd')))) group by e_mail;

select * from map_object where object_type_id = 101;
delete from map_object where object_type_id = 101;
select * from reservation order by id;


--DATE_FROM

--DATE_TO

--period od(date) do(date)

--TEMP DELETE

-- if (od(date) >= DATE_FROM && od(date) >= DATE_TO) || (do(date) <= DATE_FROM && do(date) <= DATE_TO) then return

-- if od(date) <= DATE_FROM && do(date) >= DATE_TO then DELETE celej zaznam

-- if od(date) >= DATE_FROM && od(date) <= DATE_TO && do(date) >= DATE_TO then UPDATE DATE_TO = od(date)

-- if do(date) >= DATE_FROM && do(date) <= DATE_TO && od(date) <= DATE_FROM then UPDATE DATE_FROM = do(date)

-- if DATE_FROM < od(date) && DATE_TO > do(date) then (INSERT NEW DATE_FROM = do(date) DATE_TO = DATE_TO) + (UPDATE DATE_TO = od(date))

--TEMP UPDATE

-- if (od(date) >= DATE_FROM && od(date) >= DATE_TO) || (do(date) <= DATE_FROM && do(date) <= DATE_TO) then return

-- else if od(date) <= DATE_FROM && do(date) >= DATE_TO then UPDATE celej zaznam

-- else if od(date) >= DATE_FROM && od(date) <= DATE_TO && do(date) >= DATE_TO then (INSERT NEW DATE_FROM = od(date) DATE_TO = DATE_TO) + (UPDATE DATE_TO = od(date))

-- else if do(date) >= DATE_FROM && do(date) <= DATE_TO && od(date) <= DATE_FROM then (INSERT NEW DATE_FROM = DATE_FROM DATE_TO = do(date)) + (UPDATE DATE_FROM = do(date))

-- else if DATE_FROM < od(date) && DATE_TO > do(date) then (INSERT NEW DATE_FROM = do(date) DATE_TO = DATE_TO) + (UPDATE DATE_TO = od(date))

--temp join

--pokud maji datumy nìjaký prùnik nad stejným objektem, tak se spojí(rozšíøí)
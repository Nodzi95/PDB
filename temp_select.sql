--pocet rezervací ve sledovaném období
--validtime period[2018-12-04 - 2019-01-01] select count(*) from reservation
select count(*) from reservation where (date_from >= to_date('2018-12-4','yyyy-mm-dd') and date_to <= to_date('2019-01-01','yyyy-mm-dd')) or ((date_from <= to_date('2018-12-4','yyyy-mm-dd') and date_to >= to_date('2018-12-4','yyyy-mm-dd')) or (date_to >= to_date('2019-01-01','yyyy-mm-dd') and date_from <= to_date('2019-01-01','yyyy-mm-dd')));

--kolik kadı uivatel má zaplatit ve sledovanem obdobi
--validtime period[2018-12-04 - 2019-01-01] select sum(r.price), u.e_mail from reservation r right join users u on r.userid = u.id group by e_mail
select sum(r.price), u.e_mail from reservation r right join users u on r.userid = u.id where((date_from >= to_date('2018-12-4','yyyy-mm-dd') and date_to <= to_date('2019-01-01','yyyy-mm-dd')) or ((date_from <= to_date('2018-12-4','yyyy-mm-dd') and date_to >= to_date('2018-12-4','yyyy-mm-dd')) or (date_to >= to_date('2019-01-01','yyyy-mm-dd') and date_from <= to_date('2019-01-01','yyyy-mm-dd')))) group by e_mail;


SELECT r.ID from rent_object r join reservation res on res.objectid = r.ID where res.date_from <= ? and res.date_to >= ? or res.date_from <= ? and res.date_to >= ? or res.date_from <= ? and res.date_to >= ?
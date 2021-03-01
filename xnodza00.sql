select * from reservation;
select id, feedback, rating, date_from, date_to from reservation where (userid =1 and objectID=61)
and ((date_from = to_date('2018-12-30','yyyy-mm-dd')) or (date_to = to_date('2018-12-24','yyyy-mm-dd')));
delete from reservation where id <> 182;
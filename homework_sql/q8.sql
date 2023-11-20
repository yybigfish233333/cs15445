with rose_title_id as(
select title_id as title_id 
from crew
inner join people on crew.person_id = people.person_id
where people.name like 'Rose%'
and crew.category = 'actress'
)
select distinct(people.name) as director_name 
from rose_title_id 
inner join crew on crew.title_id = rose_title_id.title_id
inner join people on people.person_id = crew.person_id
where crew.category = 'director'
order by director_name;

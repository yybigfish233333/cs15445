with batactor as(
select distinct(crew.person_id) as unique_id , people.name as unique_name
from crew 
inner join people on crew.person_id=people.person_id
where crew.characters like '%"Batman"%'
and crew.category = "actor"
)
select batactor.unique_name,round(avg(ratings.rating),2) as average 
from batactor
inner join crew on batactor.unique_id = crew.person_id
inner join ratings on ratings.title_id = crew.title_id
group by batactor.unique_id
order by average desc
limit 10;

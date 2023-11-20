select count(distinct(people.person_id))
from people
      inner join crew on people.person_id = crew.person_id
where crew.category in ('actor','actress')
and people.born in (
select premiered from titles where primary_title = 'The Prestige'
);

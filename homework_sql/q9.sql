with longest_person as(
select category,name,died,primary_title,runtime_minutes,
dense_rank() over (
partition by crew.category
order by people.died,people.name
) as rank_num,
dense_rank() over (
partition by crew.category,crew.person_id
order by runtime_minutes desc,
titles.title_id
) as rank_num_runtime
from crew
inner join people on people.person_id = crew.person_id
inner join titles on titles.title_id = crew.title_id
where people.died not null and runtime_minutes not null
),
top_titles as(
select category,name,died,primary_title,runtime_minutes,rank_num
from longest_person
where rank_num<=5 and rank_num_runtime =1
)
select * from top_titles
order by category,rank_num;

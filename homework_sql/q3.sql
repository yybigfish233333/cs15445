select primary_title,
case 
when ended is null then 2023 - premiered
else ended - premiered
end as running
from titles
where premiered is not null
and type = 'tvSeries'
order by running desc,
primary_title
limit 20;

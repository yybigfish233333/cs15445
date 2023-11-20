select titles.type,round(avg(ratings.rating),2) as average,min(ratings.rating),max(ratings.rating)
from titles 
inner join akas on titles.title_id = akas.title_id
inner join ratings on titles.title_id = ratings.title_id
where akas.types in ('imdbDisplay','original')
and akas.language = 'de'
group by titles.type
order by average;

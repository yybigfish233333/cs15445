SELECT decade || 's' ,
       director_count
FROM (
        SELECT FLOOR(people.born / 10) * 10 AS decade,
               COUNT(DISTINCT people.person_id) AS director_count
        FROM people
             INNER JOIN crew ON crew.person_id = people.person_id
        WHERE crew.category = 'director'
              AND people.born >= 1900
        GROUP BY decade
    )
ORDER BY decade;

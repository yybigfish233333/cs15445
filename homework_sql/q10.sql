WITH leo_character AS (
  SELECT DISTINCT crew.characters AS leo_character_name
  FROM crew
    INNER JOIN people ON people.person_id = crew.person_id
  WHERE people.name = 'Leonardo DiCaprio' AND people.born = 1974
)
SELECT REPLACE(GROUP_CONCAT(leo_character_name, ', ') , '"', '') AS result
FROM (
  SELECT REPLACE(REPLACE(leo_character_name, '[', ''), ']', '') AS leo_character_name
  FROM leo_character
  WHERE leo_character_name NOT LIKE '%Self%'
  ORDER BY leo_character_name
);

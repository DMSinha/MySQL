SELECT
	movies.movie_id, title, budget, revenue, currency, unit
From movies 
JOIN financials 
ON movies.movie_id = financials.movie_id;

#Inner Join
SELECT
	m.movie_id, title, budget, revenue, currency, unit
From movies m
JOIN financials f
ON m.movie_id = f.movie_id;

#Left Join
SELECT
	m.movie_id, title, budget, revenue, currency, unit
From movies m
LEFT JOIN financials f
ON m.movie_id = f.movie_id;

#Right Join
SELECT
	m.movie_id, title, budget, revenue, currency, unit
From movies m
RIGHT JOIN financials f
ON m.movie_id = f.movie_id;

#Full Join
#Left Join
SELECT
	m.movie_id, title, budget, revenue, currency, unit
From movies m
LEFT JOIN financials f
ON m.movie_id = f.movie_id

UNION

#Right Join
SELECT
	m.movie_id, title, budget, revenue, currency, unit
From movies m
RIGHT JOIN financials f
ON m.movie_id = f.movie_id;

#Using Clause
#Right Join
SELECT
	m.movie_id, title, budget, revenue, currency, unit
From movies m
RIGHT JOIN financials f
USING (movie_id);

#### Assignments ###
Select * from movies; 

select * from languages;

Select m.title, name
from movies m
Left Join languages l
using (language_id);

# Show all Telugu movie names (assuming you don't know the language
#id for Telugu)
Select m.title, name
from movies m
Left Join languages l
on name="Telugu";

# Show the language and number of movies released in that language
Select l.name, count(m.language_id) as Count
From languages l
LEFT JOIN movies m
on l.language_id=m.language_id
group by l.name;






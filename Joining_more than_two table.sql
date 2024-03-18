select 
	m.title, a.name
FROM movies m
JOIN movie_actor ma ON m.movie_id= ma.movie_id
JOIN actors a ON a.actor_id= ma.actor_id;

#grouping actors
select 
	m.title, group_concat(a.name)
FROM movies m
JOIN movie_actor ma ON m.movie_id= ma.movie_id
JOIN actors a ON a.actor_id= ma.actor_id
group by m.movie_id;

#grouping actors
select 
	m.title, group_concat(a.name SEPARATOR "|")
FROM movies m
JOIN movie_actor ma ON m.movie_id= ma.movie_id
JOIN actors a ON a.actor_id= ma.actor_id
group by m.movie_id;

#grouping actor & movies
select 
	a.name, group_concat(m.title SEPARATOR "|")
FROM actors a
JOIN movie_actor ma ON ma.actor_id= a.actor_id
JOIN movies m ON m.movie_id= ma.movie_id
group by a.actor_id;

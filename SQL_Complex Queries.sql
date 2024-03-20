#Movie with Highest Rating
select * from movies
order by imdb_rating DESC LIMIT 1 OFFSET 0;

Select max(imdb_rating) from movies; 

#Sub Query Form
Select * from movies
where imdb_rating=(Select max(imdb_rating) from movies);

#Sub Query Form: When we want to get both min & max of rating
Select * from movies 
where imdb_rating in 
	((Select min(imdb_rating) from movies),
		(Select max(imdb_rating) from movies));

#Sub Query
Select * from (select name, year(curdate())-birth_year as age from actors)
as actors_age 
where age>70 and age<85;

#Select actors who acted in any of those movies(101,110,121)
select * from actors where actor_id in 
(Select actor_id from movie_actor where movie_id in (101,110,121));

#Other way of doing same is using join for multiple tables

#Other way to write same query is using ANY 
 select * from actors where actor_id = ANY
(Select actor_id from movie_actor where movie_id in (101,110,121));

#Select all movies whose rating is greater than any of the marvel movies rating
select * from movies where imdb_rating > ANY 
(Select imdb_rating from movies where studio="Marvel Studios") ;

#Select all movies whose rating is greater than any of the marvel movies
select * from movies where imdb_rating > ANY 
(Select min(imdb_rating) from movies where studio="Marvel Studios") ;

#Select all movies whose rating is greater than *all* of the marvel movies rating
select * from movies where imdb_rating > ALL
(select imdb_rating from movies where studio="Marvel studios") ;

#Select all movies whose rating is greater than *all* of the marvel movies rating
select * from movies where imdb_rating > 
(select max(imdb_rating) from movies where studio="Marvel studios") ;

#Select the actor id, actor name, & total number of movies they acted in
select actor_id, count(*) as Count FROM movie_actor 
group by actor_id; 

Select a.actor_id, a.name, count(*) as movie_count 
from movie_actor ma
JOIN actors a
on a.actor_id=ma.actor_id
group by actor_id
order by movie_count desc;

#Using Corelated Query
Select 
	actor_id,
    name,
    (select count(*) from movie_actor
    where actor_id=actors.actor_id) as movies_count
from actors
ORDER BY movies_count DESC;    
 
 #select 
 explain analyze
 select title, release_year from movies
 where release_year=(select min(release_year) from movies) 
 or release_year=(select max(release_year) from movies);
 
 #All movies whose rating is above average rating
 select title,imdb_rating from movies where
 imdb_rating> (Select avg(imdb_rating) as avg from movies);
 
 #Get all actors age whose age is between 70 and 85
 with actors_age as (
		select 
			name as actor_name,
            year(curdate())- birth_year as age
            from actors
)
select actor_name,age
from actors_age
where age>70 and age<85;

#Movies that produced 500% profit or more & their rating was less than avg rating for all movies
select X.movie_id, X.pct_profit,
Y.title, Y.imdb_rating 
from 
(select *,((revenue-budget)*100/budget) as pct_profit
from financials
) X
JOIN
(select * from movies where imdb_rating <(select avg(imdb_rating) from movies)) Y
on x.movie_id= y.movie_id
where pct_profit >= 500;

#WITH CTE
with
	x as (select *,((revenue-budget)*100/budget) as pct_profit
	from financials),
    y as (select * from movies where imdb_rating <(select avg(imdb_rating) from movies))
select X.movie_id, X.pct_profit,
Y.title, Y.imdb_rating 
from 
X JOIN Y
on x.movie_id= y.movie_id
where pct_profit >= 500;

#Benefits
#Simple Queries: Query Readbility
#Same resultset can be reference multiple times:QUery Reusability
#Visibility for creating Data Views

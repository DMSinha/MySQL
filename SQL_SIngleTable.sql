SELECT * FROM movies WHERE studio=""; 
Select title, release_year,studio from movies WHERE studio LIKE "%Marvel%";
Select title, release_year,studio from movies;
Select title from movies where title like "%Avengers%";
Select release_year from movies where title="The Godfather";
Select distinct studio from movies where industry="Bollywood"; 
Select * from movies WHERE imdb_rating>=6 AND imdb_rating<=8;
Select * from movies WHERE imdb_rating BETWEEN 6 AND 8;
Select * 
From movies
WHERE release_year IN (2022,2019,2018);
SELECT * FROM MOVIES WHERE imdb_rating is NULL;
SELECT * FROM MOVIES WHERE imdb_rating is NOT NULL;
SELECT * FROM MOVIES WHERE industry="BOLLYWOOD" order by imdb_rating DESC;
SELECT * FROM MOVIES WHERE industry="BOLLYWOOD" order by imdb_rating DESC LIMIT 5;
SELECT * FROM MOVIES WHERE industry="BOLLYWOOD" order by imdb_rating DESC LIMIT 5 OFFSET 1;
/*************** Assignments*****************************/
SELECT * FROM MOVIES order by release_year DESC;
SELECT * FROM MOVIES where release_year="2022";
SELECT * FROM MOVIES where release_year>"2020";
SELECT * FROM MOVIES where release_year>"2020" AND imdb_rating>8;
SELECT * FROM MOVIES where studio in ("Marvel Studios","Hombale Films");
SELECT * FROM MOVIES Where title like "%Thor%" order by release_year asc;
SELECT * FROM MOVIES where studio != "Marvel Studios";
/********************SUMMARY ANALYTICS*****************/
SELECT COUNT(*) FROM MOVIES where industry="bollywood";
SELECT MAX(imdb_rating) FROM MOVIES where industry="bollywood";
SELECT MIN(imdb_rating) FROM movies where industry="bollywood";
SELECT AVG(imdb_rating) FROM movies where studio="Marvel Studios";
SELECT ROUND(AVG(imdb_rating),2) FROM movies where studio="Marvel Studios";
SELECT ROUND(AVG(imdb_rating),2) as avg_rating FROM movies where studio="Marvel Studios";
SELECT MIN(imdb_rating) as Min_Rating, MAX(imdb_rating) as Max_Rating, ROUND(AVG(imdb_rating),2) as avg_rating
From movies Where studio = "Marvel Studios";

SELECT industry, COUNT(*) as COUNT, avg(imdb_rating) as Average FROM movies 
GROUP BY industry
ORDER BY COUNT DESC; 

/****************** Assignment**********************/
Select count(*) as Count from movies where release_year between 2015 and 2022;
Select min(release_year) as Min_Release_Year, max(release_year) as Max_Release_Year from movies;
Select release_year, count(*) as Count from movies group by release_year order by release_year DESC;  

#HAVING CLAUSE
#print all the year where more than 2 movies were release
Select release_year,Count(*) as Count from movies group by release_year HAVING count>2;

Select YEAR(curdate());
Select *,YEAR(curdate())-birth_year as Age FROM actors;

Select *, (revenue-budget) as profit FROM financials order by profit DESC;

Select *,
IF(currency='USD', revenue*77, revenue)
as revenue_inr
FROM financials;  

select distinct unit from financials;

Select *, 
	CASE 
		WHEN currency = "thousands" THEN revenue/1000
        WHEN currency = "billions" THEN revenue*1000
        else Revenue
	END as revnue_min
FROM financials;

#Profit % for all movies
Select *, ((revenue-budget)*100/budget) as profit_Percent FROM financials order by profit_Percent DESC;

  select 
        *, 
    (revenue-budget) as profit, 
    (revenue-budget)*100/budget as profit_pct 
   from financials
        
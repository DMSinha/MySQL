SELECT * FROM superstore_db.items;

select * from superstore_db.items
WHERE properties->"$.gluten_free"=0
;

select * from superstore_db.items
WHERE properties->"$.color"="blue"
;

select * from superstore_db.items
WHERE JSON_EXTRACT(properties,"$.color")="blue" actorslanguages
SELECT * FROM food_db.items
CROSS JOIN
food_db.variants;

SELECT *,concat(name,"-",variant_name) as full_name,
(price+variant_price) as full_price
FROM food_db.items
CROSS JOIN
food_db.variants;


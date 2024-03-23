SELECT 
	m.date , m.product_code, 
    p.product, p.variant,
    m.sold_quantity, m.customer_code,
    g.gross_price,
    ROUND(g.gross_price * m.sold_quantity,2) as gross_price_total
FROM gdb0041.fact_sales_monthly m
JOIN dim_product p
ON m.product_code = p.product_code
JOIN fact_gross_price g
ON g.product_code = m.product_code 
and g.fiscal_year = get_fiscal_year(m.date)
where customer_code="90002002"
and get_fiscal_year(date)=2021
and get_fiscal_quarter(date)= "Q4"
order by date asc ;


select 
	get_fiscal_year(s.date) as FISCAL_YEAR, 
    SUM(g.gross_price * s.sold_quantity) as gross_price_total
FROM fact_sales_monthly s
JOIN fact_gross_price g
ON 
	g.product_code = s.product_code and
    g.fiscal_year = get_fiscal_year(s.date)
WHERE customer_code="90002002"
-- and get_fiscal_year(date)=2021
GROUP BY get_fiscal_year(s.date)
order by date asc;




select 
	s.date as FISCAL_YEAR, 
    SUM(g.gross_price * s.sold_quantity) as gross_price_total
FROM fact_sales_monthly s
JOIN fact_gross_price g
ON 
	g.product_code = s.product_code and
    g.fiscal_year = get_fiscal_year(s.date)
WHERE customer_code="90002002"
-- and get_fiscal_year(date)=2021
GROUP BY FISCAL_YEAR
order by date asc;






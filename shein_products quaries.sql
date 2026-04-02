describe shein_products;

alter table shein_products
modify final_price decimal(10,2),
modify initial_price decimal(10,2),
modify rating float;

select count(*)
from shein_products
where brand is null;

select product_id, count(*)
from shein_products
group by product_id
having count(*) > 1;


select *from shein_products limit 10;

-- 1.Total number of products
select count(*) as total_products
from shein_products;

-- 2.Average final price of products
select avg(final_price) as avg_final_price
from shein_products;

-- 3.Maximum and minimum product price
select max(final_price) as max_price,
min(final_price) as min_price
from shein_products;

-- 4.Total number of products in stock
select count(*) as instock_products
from shein_products
where in_stock = 'Yes';

-- 5.Count of products by brand
select brand, count(*) as total_products
from shein_products
group by brand
order by total_products desc;

-- 6.Top 10 most reviewd products
select product_name, reviews_count
from shein_products
order by reviews_count desc
limit 10;

-- 7.Average rating of products
select avg(rating) as avg_rating
from shein_products;

-- 8.Products with highest rating
select product_name, rating
from shein_products
order by rating desc
limit 10;

-- 9.Total products by category
select category, count(*) as total
from shein_products
group by category
order by total desc;

-- 10.Average price by category
select category, avg(final_price) as avg_price
from shein_products
group by category;

-- 11.Products with discount (initial> final)
select product_name, initial_price, final_price
from shein_products
where initial_price > final_price;

-- 12.Discount percentage
select product_name,
((initial_price - final_price)/initial_price)*100 as discount_percentage
from shein_products;

-- 13.Top 10 highest discounted products
select product_name,
((initial_price - final_price)/initial_price)*100 as discount
from shein_products
order by discount desc
limit 10;

-- 14.Products by country
select country_code, count(*) as total
from shein_products
group by country_code;

-- 15.Products with no reviews
select product_name
from shein_products
where top_reviews = 0;

-- 16.Total number of unique brands
select count(distinct brand) as unique_brands
from shein_products;

-- 17.Average reviews per products
select avg(top_reviews) as avg_reviews
from shein_products;

-- 18.Most popular category (by reviews)
select category, sum(top_reviews) as total_reviews
from shein_products
group by category
order by total_reviews desc;

-- 19.Products with high rating and high rewiews
select product_name, rating, top_reviews
from shein_products
where rating >= 4 and top_reviews > 100;

-- 20.Average rating by btand
select brand, avg(rating) as avg_rating
from shein_products
group by brand
order by avg_rating desc;

-- 21.Products with multiple images
select product_name, image_count
from shein_products
where image_count > 3;

-- 22.Total products per root category
select root_category, count(*) as total
from shein_products
group by root_category;

-- 23.Products available in specific size
select product_name
from shein_products
where all_available_sizes like '%M%';

-- 24.Count of products per color
select color, count(*) as total
from shein_products
group by color;

-- 25.Products with missing brand
select product_name
from shein_products
where brand is null or brand = '';

-- 26.Average price by brand
select brand, avg(final_price) as avg_price
from shein_products
group by brand;

-- 27.Products with more than 5 images
select product_name
from shein_products
where image_count > 5;

-- 28.Top 5 expensive products
select product_name, final_price
from shein_products
order by final_price desc
limit 5;

-- 29.Cheapest products
select product_name, final_price
from shein_products
order by final_price asc
limit 5;

-- 30.Products with offers available
select product_name, offers
from shein_products
where offers is not null and offers != '';



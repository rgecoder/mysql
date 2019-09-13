-- 1. all countries speak Slovene
SELECT countries.name, languages.language, languages.percentage
FROM countries
JOIN languages ON countries.id = languages.country_id
WHERE languages.language = 'Slovene'
ORDER BY languages.percentage DESC;

-- 2. total number of cities in each country, num cities DESC
SELECT countries.name AS country, COUNT(cities.id) AS number_cities
FROM countries
JOIN cities ON countries.code = cities.country_code
GROUP BY countries.id
ORDER BY COUNT(cities.id) desc;

-- 3. all cities in mexico with population > 500,000, population in DESC
SELECT cities.name, cities.population
FROM cities
JOIN countries ON countries.code = cities.country_code
WHERE countries.name = 'Mexico' AND cities.population > 500000
ORDER BY cities.population DESC;

-- 4. all language in each country with % > 89%, arrange by pertance in DESC
SELECT countries.name, languages.language, languages.percentage
FROM countries
JOIN languages ON countries.code = languages.country_code
WHERE languages.percentage > 89
ORDER BY languages.percentage DESC;

-- 5. all countries with surface area below 501 and population greater than 100000
SELECT countries.name, countries.surface_area, countries.population
FROM countries
WHERE countries.surface_area <501 AND countries.population>100000;

-- 6. all consitutional monarchy countries with a capital greater than 200, life expectancy >75 
SELECT name, government_form, life_expectancy
FROM countries
WHERE government_form = 'Constitutional Monarchy' AND capital > 200 AND life_expectancy>75;

-- 7. all cities of Argentina inside the Buenos Aires district w/ population > 500000
SELECT countries.name, cities.name AS city_name, cities.district, cities.population
FROM countries
JOIN cities ON countries.code = cities.country_code
WHERE countries.name = 'Argentina' AND cities.district = 'Buenos Aires' AND cities.population >500000;

-- 8. sum number of countries in each region, arrange num countries in DESC
SELECT region, COUNT(id) AS number_countries
FROM countries
GROUP BY region
ORDER BY COUNT(id) DESC;

































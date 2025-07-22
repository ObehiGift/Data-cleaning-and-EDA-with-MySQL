use scheme;
select * 
FROM `title.episode`;

use scheme;

select *
from `nashville housing data for data cleaning`;

load data infile 'downloads/corona_data.csv'
into table `title.episode`
fields terminated by ','
ignore 1 rows;

select @@secure_file_priv;

use scheme;

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\corona_data.csv'
into table corona
fields terminated by ','
ignore 1 rows;

describe corona;

drop database scheme;

create database Corona;

CREATE TABLE corona_data
(province VARCHAR(100),
country_region VARCHAR (100),
latitude FLOAT,
longitude FLOAT,
`date` DATE,
deaths INT,
recovered INT);

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\corona_data.csv'
into table corona_data
fields terminated by ','
ignore 1 rows;

DROP TABLE corona_data;

CREATE TABLE corona_data
(province VARCHAR(100),
country_region VARCHAR (100),
latitude FLOAT,
longitude FLOAT,
`date` DATE,
confirmed INT,
deaths INT,
recovered INT);

SELECT *
FROM corona_data;

CREATE TABLE corona_data2
LIKE corona_data;

INSERT INTO corona_data2
SELECT *
FROM corona_data;

SELECT DISTINCT province
FROM corona_data2;

SELECT *
FROM corona_data2
WHERE confirmed IS NULL;
-- No null value in any column

SELECT *, ROW_NUMBER() OVER() AS `row`
FROM corona_data2
ORDER BY `row` DESC;

SELECT DISTINCT province
FROM corona_data2
WHERE confirmed != 0;

SELECT *
FROM corona_data2
ORDER BY confirmed;

SELECT MIN(`date`) AS start_date, MAX(`date`) AS end_date
FROM corona_data2;

SELECT MONTH(`date`) AS `month`, AVG(confirmed) AS `Average confirmed monthly`
FROM corona_data2
GROUP BY `month`;

SELECT MONTH(`date`) AS `month`, AVG(deaths) AS `Average death monthly`
FROM corona_data2
GROUP BY `month`;

SELECT MONTH(`date`) AS `month`, AVG(recovered) AS `Average recovered monthly`
FROM corona_data2
GROUP BY `month`;


SELECT YEAR(`date`) AS `year`, 
MIN(confirmed) AS `minimum confirmed`,
MIN(deaths) AS `minimum deaths`,
MIN(recovered) AS `minimum recovered`
FROM corona_data2
GROUP BY `year`
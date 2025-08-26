
-- a) Use this database and find out the underlying schemas, tables and views to get an overview of its logical structure

SHOW DATABASES;

USE GOOGLE_KEYWORDS_SEARCH_DATASET__DISCOVER_ALL_SEARCHES_ON_GOOGLE;

ShOW SCHEMAS;

USE SCHEMA DATAFEEDS;

SHOW VIEWS IN DATABASE GOOGLE_KEYWORDS_SEARCH_DATASET__DISCOVER_ALL_SEARCHES_ON_GOOGLE;

SHOW TABLES;

-- b) Find out the columns and its data types in the table "GOOGLE_KEYWORDS"
SELECT * FROM GOOGLE_KEYWORDS LIMIT 10;

-- SNOWSQL using whole word not abbreviations. DESC; -> DESCRIBE TABLE or DATABASE or DATA WAREHOUS.
DESCRIBE TABLE GOOGLE_KEYWORDS;

-- c) Some exploration data analysies (EDA) of dataset GOOGLE_KEYWORDS

-- Find out number of rows in the dataset
SELECT count(*) AS number_of_row FROM GOOGLE_KEYWORDS;


-- d) When is the first search and when is the last search in the dataset.
DESC TABLE GOOGLE_KEYWORDS;

SELECT * FROM GOOGLE_KEYWORDS LIMIT 10;

SELECT MAX(date) AS latest_search, MIN(date) AS first_search FROM GOOGLE_KEYWORDS;

SELECT * FROM GOOGLE_KEYWORDS ASC LIMIT 10;

-- Which are the 10 moste popular keywords?

SELECT keyword, calibrated_clicks FROM GOOGLE_KEYWORDS ORDER BY calibrated_clicks DESC LIMIT 10; 

-- How many unique keywords are there?

SELECT COUNT(DISTINCT(keyword)) AS unique_keywords FROM GOOGLE_KEYWORDS;

-- check what type of platforms are used and how many users per platform
SELECT * FROM GOOGLE_KEYWORDS LIMIT 10;

SELECT platform, count(calibrated_users) AS amount_user FROM GOOGLE_KEYWORDS GROUP BY platform ORDER BY  amount_user DESC LIMIT 10;


SELECT 
    clean_landingpage, SUM(calibrated_users) AS number_user_per_page 
FROM 
    GOOGLE_KEYWORDS 
GROUP BY 
    clean_landingpage 
    order by 
        number_user_per_page 
        DESC 
        LIMIT 10;

-- Find the 20 most popular keywords and the number of searches of that keyword?.
SELECT 
    country, * EXCLUDE(country) 
FROM GOOGLE_KEYWORDS 
WHERE 
    country = 752 
    ORDER BY 
        calibrated_clicks 
    DESC 
    LIMIT 20;

-- List the top 10 number countries and the number of searches for spotify.
SELECT
    country,
    site,
    SUM(calibrated_clicks) AS number_search
FROM 
    GOOGLE_KEYWORDS
WHERE site = 'spotify.com'
GROUP BY 
    country, site
ORDER BY number_search
DESC
LIMIT 10;

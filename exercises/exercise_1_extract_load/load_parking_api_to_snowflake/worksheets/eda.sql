
USE ROLE extract_api_dlt;

USE DATABASE stockholm_parking;

USE SCHEMA stockholm_parking.staging;

-- shall give error, becouse the role don not have privilege to use select.
SELECT * FROM stockholm_parking.staging;
--Calculates how many acquisitions occurred each year to identify trends over time--
SELECT EXTRACT(YEAR FROM acquisition_date) AS acquisition_year,
       COUNT(*) AS total_acquisitions
FROM acquisitions
GROUP BY acquisition_year
ORDER BY acquisition_year;

--Query identifies the companies that have made the most acquisitions--
SELECT acquirer_name,
       COUNT(*) AS num_acquisitions
FROM acquisitions
GROUP BY acquirer_name
ORDER BY num_acquisitions DESC
LIMIT 5;

--Query calculates the average and median acquisition value to understand the typical acquisition size--

SELECT AVG(acquisition_value) AS avg_value,
       PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY acquisition_value) AS median_value
FROM acquisitions;

--Query identifies the most common industries targeted for acquisitions--

SELECT target_industry,
       COUNT(*) AS industry_acquisitions
FROM acquisitions
GROUP BY target_industry
ORDER BY industry_acquisitions DESC;

--Query helps identify outliers by comparing acquisition values to the average--

SELECT acquirer_name,
       acquisition_value
FROM acquisitions
WHERE acquisition_value > (SELECT AVG(acquisition_value) * 2 FROM acquisitions)
ORDER BY acquisition_value DESC;

--Query analyzes acquisitions by region or country to see where most deals are happening--
SELECT target_country,
       COUNT(*) AS num_acquisitions
FROM acquisitions
GROUP BY target_country
ORDER BY num_acquisitions DESC;

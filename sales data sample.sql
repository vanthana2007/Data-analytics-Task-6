use onlinesales;
show tables;
select * from sales_data_sample limit 10;
SELECT ORDERDATE
FROM sales_data_sample
WHERE STR_TO_DATE(ORDERDATE, '%d.%m.%Y %H.%i') IS NULL;
SELECT ORDERDATE 
FROM sales_data_sample 
LIMIT 10;
SELECT 
  EXTRACT(MONTH FROM 
    CASE 
      WHEN ORDERDATE LIKE '%/%' 
        THEN STR_TO_DATE(ORDERDATE, '%m/%d/%Y')
      WHEN ORDERDATE LIKE '%-%' 
        THEN STR_TO_DATE(ORDERDATE, '%m-%d-%Y')
    END
  ) AS month
FROM sales_data_sample;
SELECT 
  DATE_FORMAT(
    CASE 
      WHEN ORDERDATE LIKE '%/%' 
        THEN STR_TO_DATE(ORDERDATE, '%m/%d/%Y')
      WHEN ORDERDATE LIKE '%_%' 
        THEN STR_TO_DATE(ORDERDATE, '%m_%d_%Y')
    END,
    '%m-%Y'
  ) AS month_year
FROM sales_data_sample;
SELECT 
  DATE_FORMAT(
    CASE 
      WHEN ORDERDATE LIKE '%/%' 
        THEN STR_TO_DATE(ORDERDATE, '%m/%d/%Y')
      WHEN ORDERDATE LIKE '%-%' 
        THEN STR_TO_DATE(ORDERDATE, '%d-%m-%Y')
    END,
    '%m-%Y'
  ) AS month_year,
  SUM(amount) AS total_revenue
FROM sales_data_sample
GROUP BY month_year
ORDER BY month_year;
ALTER TABLE sales_data_sample 
CHANGE `ï»¿ORDERNUMBER` ORDERNUMBER VARCHAR(50);
SELECT 
    EXTRACT(MONTH FROM 
        CASE 
            WHEN ORDERDATE LIKE '%/%' 
                THEN STR_TO_DATE(ORDERDATE, '%m/%d/%Y')
            WHEN ORDERDATE LIKE '%-%' 
                THEN STR_TO_DATE(ORDERDATE, '%d-%m-%Y')
        END
    ) AS month,
    COUNT(DISTINCT ORDERNUMBER) AS order_volume
FROM sales_data_sample
GROUP BY month
ORDER BY month;
SELECT EXTRACT(YEAR FROM CASE WHEN ORDERDATE LIKE '%/%' THEN STR_TO_DATE(ORDERDATE, '%m/%d/%Y')
	WHEN ORDERDATE LIKE '%-%' THEN STR_TO_DATE(ORDERDATE, '%d-%m-%Y')END
    ) AS year,
    EXTRACT(MONTH FROM CASE WHEN ORDERDATE LIKE '%/%' THEN STR_TO_DATE(ORDERDATE, '%m/%d/%Y')
    
	WHEN ORDERDATE LIKE '%-%' THEN STR_TO_DATE(ORDERDATE, '%d-%m-%Y')END
    ) AS month, SUM(AMOUNT) AS total_revenue, COUNT(DISTINCT ORDERDATE) AS order_volume
FROM sales_data_sample GROUP BY year, month
ORDER BY year, month;
SELECT EXTRACT(MONTH FROM CASE WHEN ORDERDATE LIKE '%/%' THEN STR_TO_DATE(ORDERDATE, '%m/%d/%Y')
WHEN ORDERDATE LIKE '%-%' THEN STR_TO_DATE(ORDERDATE, '%d-%m-%Y')
END) AS month,
SUM(AMOUNT) AS revenue
FROM sales_data_sample
GROUP BY month
ORDER BY revenue DESC;
SELECT EXTRACT(MONTH FROM CASE WHEN ORDERDATE LIKE '%/%' THEN STR_TO_DATE(ORDERDATE, '%m/%d/%Y')
WHEN ORDERDATE LIKE '%-%' THEN STR_TO_DATE(ORDERDATE, '%d-%m-%Y') END) AS month,
SUM(AMOUNT) AS revenue FROM sales_data_sample
WHERE CASE WHEN ORDERDATE LIKE '%/%' THEN STR_TO_DATE(ORDERDATE, '%m/%d/%Y')
WHEN ORDERDATE LIKE '%-%' THEN STR_TO_DATE(ORDERDATE, '%d-%m-%Y')
END BETWEEN '2003-01-05' AND '2003-03-07'GROUP BY month ORDER BY revenue DESC;
SELECT EXTRACT(MONTH FROM CASE WHEN ORDERDATE LIKE '%/%' THEN STR_TO_DATE(ORDERDATE, '%m/%d/%Y')
WHEN ORDERDATE LIKE '%-%' THEN STR_TO_DATE(ORDERDATE, '%d-%m-%Y')
END) AS month, SUM(amount) AS revenue
FROM sales_data_sample
GROUP BY month
ORDER BY revenue DESC
LIMIT 3;
SELECT EXTRACT(MONTH FROM CASE WHEN ORDERDATE LIKE '%/%' THEN STR_TO_DATE(ORDERDATE, '%m/%d/%Y')
WHEN ORDERDATE LIKE '%-%' THEN STR_TO_DATE(ORDERDATE, '%d-%m-%Y')
END) AS month, SUM(COALESCE(AMOUNT, 0)) AS revenue FROM sales_data_sample
GROUP BY month ORDER BY month;





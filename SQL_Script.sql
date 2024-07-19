-- Q1. Write a code to check NULL values
SELECT * FROM corona
where Province is null
or country is null
or latitude is null
or longitude is null
or date is null
or confirmed is null
or deaths is null
or recovered is null;


-- Q2. If NULL values are present, update them with zeros for all columns. 
-- A2. No Null values are present, Hence there is no requirment for zero updation.


-- Q3. check total number of rows
select count(*) as Total_row_count from corona;

-- Q4. Check what is start_date and end_date
select MIN(Date) as Start_Date,
	   MAX(Date) as End_date
from corona;

-- Q5. Number of month present in dataset
SELECT COUNT(DISTINCT DATE_FORMAT(date, '%y-%m')) AS Number_of_Months_present
FROM corona;

-- Q6. Find monthly average for confirmed, deaths, recovered
SELECT DATE_FORMAT(date, '%b-%y') as Month_Year, 
	AVG(confirmed) as Average_of_confirmed, 
	AVG(deaths) as Average_of_Deaths, 
    AVG(Recovered) as Average_of_Recovered 
    from corona
group by DATE_FORMAT(date, '%b-%y');

-- Q7. Find most frequent value for confirmed, deaths, recovered each month 
SELECT DATE_FORMAT(date, '%b-%y') as Month_Year, 
		max(Confirmed) as frequency_of_confirmed, 
        max(Deaths) as frequency_of_deaths, 
        max(recovered) as frequency_of_recovered
from corona
group by DATE_FORMAT(date, '%b-%y');

-- Q8. Find minimum values for confirmed, deaths, recovered per year
SELECT year(date)as Year, min(Confirmed) as minimum_confirmed, min(Deaths) as minimum_death, min(recovered) as minimum_recovered
from corona
group by year(date);

-- Q9. Find maximum values of confirmed, deaths, recovered per year
SELECT year(date)as Year, max(Confirmed) as maximum_confirmed, max(Deaths) as maximum_death, max(recovered) as maximum_recovered
from corona
group by year(date);

-- Q10. The total number of case of confirmed, deaths, recovered each month
SELECT DATE_FORMAT(date, '%b-%y') as Month_Year, sum(Confirmed) as Total_Confirmed, sum(Deaths) as Total_Death, sum(recovered) as Total_Recovered
from corona
group by DATE_FORMAT(date, '%b-%y');

-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
		sum(Confirmed) as total_confirmed_cases, 
        Avg(Confirmed) as average_of_confirmed_cases, 
        variance(Confirmed) as variance_of_confirmed_cases,
        stddev(Confirmed) as Standard_deviation_of_confirmed_cases
from corona;

-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT DATE_FORMAT(date, '%b-%y') as Month_Year, 
		sum(deaths) as total_death_cases, 
        Avg(deaths) as average_of_death_cases, 
        variance(deaths) as variance_of_death_cases,
        stddev(deaths) as Standard_deviation_of_death_cases
from corona
group by DATE_FORMAT(date, '%b-%y');

-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
		sum(recovered) as total_recovered_cases, 
        Avg(recovered) as average_of_recovered_cases, 
        variance(recovered) as variance_of_recovered_cases,
        stddev(recovered) as Standard_deviation_of_recovered_cases
from corona;

-- Q14. Find Country having highest number of the Confirmed case
select country, sum(Confirmed) as confirmed_cases from corona
group by country
order by  confirmed_cases desc
limit 1;

-- Q15. Find Country having lowest number of the death case
select country, sum(deaths) as death_cases from corona
group by country
order by  Death_cases 
limit 1;

-- Q16. Find top 5 countries having highest recovered case
select country, sum(Recovered) as recovered_cases from corona
group by country
order by  recovered_cases desc
limit 5;














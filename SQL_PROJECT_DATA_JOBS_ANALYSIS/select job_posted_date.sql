select * FROM job_postings_fact
limit 5;

select job_posted_date
from job_postings_fact
limit 10;
select '2023-07-28':: date,
'123':: int,
'True':: boolean,
'3.14':: real;

select 
job_title_short as title,
job_location as location,
job_posted_date at time zone 'UTC' at time zone 'IST' as date,
extract(month from job_posted_date) as month,
extract(year from job_posted_date) as year
from job_postings_fact 
limit 5;

select count(job_id) as total_jobs,
extract (month from job_posted_date) as month
from job_postings_fact
where job_title_short = 'Data Analyst'
group by month
ORDER BY 
total_jobs DESC;


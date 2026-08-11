-- Cases practice queries
create table january_jobs as
   select * from job_postings_fact
   where extract(month from job_posted_date) = 1;

select * from january_jobs limit 4

   -- February
create table february_jobs as 
select * from job_postings_fact
where extract(month from job_posted_date)= 2;

-- March
CREATE TABLE march_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

select job_title_short,
job_location 
from job_postings_fact;

-- Case sttaement 
select 
count(job_id) as total_number_jobs,
case 
when job_location = 'Anywhere' then 'Remote'
when job_location = 'New York, NY' then 'NYC'
ELSE 'Onsite'
end as location_category
from job_postings_fact
where job_title_short = 'Data Analyst'
GROUP BY location_category;


select
 count(job_id) as number_of_jobs,
 case
   when job_location = 'Anywhere' then 'Remote'
   when job_location = 'New York, NY' then 'NYC'
   else 'Onsite'
   end as location_category
from job_postings_fact
where job_title_short = 'Data Analyst'
group by location_category;

   -- Label new column as folows:
   - anywhere jobs as  'remote'
    - jobs in 'New York' as 'NYC'
    - otherwise onsite
    */



SELECT
 job_title_short,
 company_id,
 job_location
 from 
 january_jobs

union ALL

 SELECT
 job_title_short,
 company_id,
 job_location
 from
  february_jobs

union ALL

 SELECT
 job_title_short,
 company_id,
 job_location
 from 
 march_jobs


-- Question 1. Get the he corresponding skill and skill type for each job postings in q1
-- Include those without any skills 
-- Look at the skills and the type of skills for each job in the first quarter that has a salary> 70000



select 
jp.job_id,
jp.job_title_short,
s.skill_id,
s.skills as skill_name,
s.type as skill_type
from job_postings_fact as jp
left JOIN skills_job_dim sj on sj.job_id= jp.job_id
LEFT JOIN skills_dim s on s.skill_id = sj.skill_id
where EXTRACT(month from job_posted_date)=1
 and 
salary_year_avg > 70000

union all

select
jp.job_id as job_count,
jp.job_title_short,
s.skill_id,
s.skills as skill_name,
s.type as skill_type
from job_postings_fact as jp
left JOIN skills_job_dim sj on sj.job_id= jp.job_id
left JOIN skills_dim s on s.skill_id = sj.skill_id
where EXTRACT(month from job_posted_date)= 2
 and 
salary_year_avg > 70000

union all

select distinct
jp.job_id,
jp.job_title_short,
s.skill_id,
s.skills as skill_name,
s.type as skill_type
from job_postings_fact as jp
left JOIN skills_job_dim sj on sj.job_id= jp.job_id
left JOIN skills_dim s on s.skill_id = sj.skill_id
where EXTRACT(month from job_posted_date)= 3
 and 
salary_year_avg > 70000
order by job_id, skill_id



-- Find job postings fromm the first quarter that hhave a salary greater than 70k

select job_title_short,
job_location,
job_posted_date:: date,
job_via
from(
select *
from january_jobs
union all
select *
from february_jobs
union all
select *  
from march_jobs
) 
where salary_year_avg> 70000
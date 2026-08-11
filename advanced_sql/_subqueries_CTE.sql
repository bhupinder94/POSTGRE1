with january_jobs as(-- CTE starts here
SELECT *
from job_postings_fact
where extract(month from job_posted_date) = 1) -- CTE ends here
select *
from january_jobs;

select * from company_dim
limit 1;

-- THIS IS THE SUBQUERY

select company_id, name as company_name 
from company_dim
where company_id in(
 select company_id
from 
 job_postings_fact
where
job_no_degree_mention = true
);

-- NOW LET'S DO THE SAME THING USING A CTE

with no_degree_companies as(
select cd.company_id,cd.name as company_name, jpf.job_no_degree_mention
from company_dim cd
left join job_postings_fact jpf on cd.company_id = jpf.company_id
where jpf.job_no_degree_mention = true
)
select * from no_degree_companies

select * from job_postings_fact
LIMIT 1

/*
Find the companies that have most job openings.
- Get the total number of job postings per company id(job_postings_fact).
- Return the total number of jobs with the company name (company_dim).
*/
with company_job_count as
(
select company_id, count(*) as total_openings
from job_postings_fact jp
group by company_id
)
select cj.company_id, c.name as company_name, cj.total_openings
from company_job_count cj
left join company_dim c on cj.company_id = c.company_id
order by cj.total_openings desc

/*
Find the count of number of remote job postings per skill
display the top skills by their demands in remote jobs
- includee skill id, name and the count of postings requering the skill
*/

with remote_job_count as(
    select skill_id, count(*) as total_remote_jobs, job_work_from_home
    from skills_job_dim sjd
    inner join job_postings_fact jpf on sjd.job_id = jpf.job_id
    where jpf.job_work_from_home = True and jpf.job_title_short = 'Data Analyst'
    group by skill_id,job_work_from_home
)
 select s.skill_id, rjc.total_remote_jobs, s.skills as skill_name, rjc.job_work_from_home
 from remote_job_count rjc
 inner join skills_dim s on rjc.skill_id = s.skill_id
 order by rjc.total_remote_jobs desc





























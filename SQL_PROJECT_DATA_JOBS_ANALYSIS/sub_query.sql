select *
from(select * from job_postings_fact
where extract(month from job_posted_date)= 1
)as january_jobs;
-- Subquery ends here

-- subquery - query within another query
-- it is used several places in main query
-- such as the select, from, where or having clauses
-- it is executed first, and the result are passed to the outer query
-- it is used when  you want to perform a calculation before the main query can complete it's 
-- calculation.
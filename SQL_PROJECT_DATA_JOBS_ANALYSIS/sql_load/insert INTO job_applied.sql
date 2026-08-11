insert INTO job_applied
(job_id ,
    appllication_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status )
    VALUES
(1, DATE '2026-07-01', TRUE,  'resume_google.pdf',    TRUE,  'cover_letter_google.pdf','applied'),
(2, DATE '2026-07-02', FALSE, 'resume_default.pdf',   FALSE, NULL,'saved'),
(3, DATE '2026-07-03', TRUE,  'resume_amazon.pdf',    TRUE,  'cover_letter_amazon.pdf','interview'),
(4, DATE '2026-07-04', TRUE,  'resume_microsoft.pdf', FALSE, NULL,'rejected'),
(5, DATE '2026-07-05', FALSE, 'resume_default.pdf',   TRUE,  'cover_letter_infosys.pdf','applied');
select * from job_applied;

truncate table job_applied;


select job_id,count(*)
from job_applied
group by job_id
having count(*)>1;


alter TABLE job_applied
ADD CONTACT VARCHAR(50);


UPDATE job_applied
SET CONTACT = 'John Doe'
WHERE job_id = 1;       

UPDATE job_applied              
SET CONTACT = 'Jane Smith'
WHERE job_id = 2;   

UPDATE job_applied
SET CONTACT = 'Alice Johnson'
WHERE job_id = 3;

UPDATE job_applied
SET CONTACT = 'Bob Brown'
WHERE job_id = 4;   

UPDATE job_applied
SET CONTACT = 'Charlie Davis'
WHERE job_id = 5;      
 
SELECT * FROM job_applied;

ALTER TABLE job_applied
RENAME COLUMN CONTACT TO CONTACT_PERSON;
SELECT * FROM job_applied;

ALTER TABLE job_applied
ALTER COLUMN contact_person  TYPE TEXT;

alter table job_applied
drop column contact_person;

DROP TABLE job_applied;




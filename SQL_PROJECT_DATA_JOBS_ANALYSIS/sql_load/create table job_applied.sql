create table job_applied(
    job_id int ,
    appllication_sent_date date,
    custom_resume boolean,
    resume_file_name varchar(250),
    cover_letter_sent boolean,
    cover_letter_file_name varchar(250),
    status varchar(50)
);

SELECT * FROM job_applied;
drop table if EXISTS job_applied;
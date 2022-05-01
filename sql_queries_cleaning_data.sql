/* this query used for cleaning the dataset
	and add it in the View table to use this View in exploring and analyzing data */

use jobms;

create or replace view job_view as(
SELECT distinct 
	`Job Title` as job_title,
    Company,
    trim(case when Area=' -' then 'Not Specified' else Area end) as Area ,
    case when `Employer Email`='[]' then null else `Employer Email` end as employer_email,
    `Employer Contact Number` as employer_contact_number,
    Salary,
    #`Lower Salary Range`,
    #`Upper Salary Range`,
    case when `Job Highlights`='[]' then 'Not Specified' else `Job Highlights` end as job_highlights,
    `Job Description` as job_description,
    `Career Level` as career_level,
	case when Qualification='(N/A)' or Qualification=': ' then 'Not Specified' else Qualification end as Qualification,
	case when `Years of Experience`= -1 then 1 else `Years of Experience` end as years_of_experience,
    `Job Type` as job_type,
    `Company Website` as company_website,
    `Job Link` as job_link,
    `Job Functions` as job_functions,
    Industry,
    `Search Term` as search_term,
    `Date Posted` as date_posted,
    `Date Scraped` as date_scraped,
    #`Data Source`,
    jobtick_avgsalary,
    jobtick_SQL,
    jobtick_Excel,
    jobtick_dashboard,
    jobtick_Python,
    jobtick_engineerjobs,
    jobtick_analystjobs,
    jobtick_scientistjobs
FROM jobms.consolidated_search_ds
);
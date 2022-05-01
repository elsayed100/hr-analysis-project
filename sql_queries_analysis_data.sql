/* this file contains queries to explore and analyze HR dataset 
through asking and answering questions from the dataset */

# What are total number of jobs available?
select count(job_title) total_job_avilable
from job_view;

# What are total number of companies providing jobs?
select count(distinct Company) no_of_companies
from job_view;

# What are total jobs for various domains?
select count(distinct Industry) total_job_domain
from job_view;

# What are total number of jobs types available?
select count(distinct job_type) total_job_type_avilable
from job_view;


# What are various career level and it’s distribution across various jobs?
select career_level, count(*) no_of_jobs
from job_view
group by 1
order by 2 desc;

# What are distribution of jobs across various analytics fields?
select search_term, count(*) no_of_jobs
from job_view
group by 1
order by 2 desc;

#Which company is providing highest number of jobs?
select Company,count(job_title) as total_jobs_in_company
from job_view
group by 1
order by 2 desc
limit 1;

#Which domain has the highest number of jobs?
select Industry,count(job_title) as total_jobs_in_domain
from job_view
group by 1
order by 2 desc
limit 1;

#What are minimum required qualification for job roles?
select Qualification,count(job_title) as no_jobs_in_qualification
from job_view
group by 1
order by 2 desc;

# What are various job types for different job titles?
select job_type, count(job_title) as no_of_jobs
from job_view
group by 1
order by 2 desc;

# Which are TOP 5 companies with highest jobs?
select Company, count(job_title) as no_of_jobs_in_company
from job_view
group by 1
order by 2 desc
limit 5;

# Whic Company has the highest number of jobs for each Carerr Level  
with t1 as(
	select Company, career_level,count(job_title) as no_of_jobs
	from job_view
	group by 1,2),
    t2 as (
    select career_level,max(t1.no_of_jobs) max_no_of_jobs
	from t1
    group by 1
    )
    select t1.Company, t1.career_level,t1.no_of_jobs
    from t1 
    join t2
	on t1.career_level=t2.career_level and t1.no_of_jobs=t2.max_no_of_jobs
    order by 3;

# Whic Industry has the highest number of jobs for each Carerr Level  
with t1 as(
	select Industry, career_level,count(*) as no_of_jobs
	from job_view
	group by 1,2),
    t2 as (
    select career_level,max(t1.no_of_jobs) max_no_of_jobs
	from t1
    group by 1
    )
    select t1.Industry, t1.career_level,t1.no_of_jobs
    from t1 
    join t2
	on t1.career_level=t2.career_level and t1.no_of_jobs=t2.max_no_of_jobs
    order by 3;

# Whic Company has the highest number of jobs for each Search Term  
with t1 as(
	select Company, search_term, count(job_title) as no_of_jobs
	from job_view
	group by 1,2),
    t2 as (
    select search_term,max(t1.no_of_jobs) max_no_of_jobs
	from t1
    group by 1
    )
    select t1.Company, t1.search_term, t1.no_of_jobs
    from t1 
    join t2
	on t1.search_term=t2.search_term and t1.no_of_jobs=t2.max_no_of_jobs
    order by 3;

# Whic Industry has the highest number of jobs for each Search Term  
with t1 as(
	select Industry, search_term, count(*) as no_of_jobs
	from job_view
    where Industry != 'Not Specified'
	group by 1,2),
    t2 as (
    select search_term,max(t1.no_of_jobs) max_no_of_jobs
	from t1
    group by 1
    )
    select t1.Industry, t1.search_term, t1.no_of_jobs
    from t1 
    join t2
	on t1.search_term=t2.search_term and t1.no_of_jobs=t2.max_no_of_jobs
    order by 3;

# what is the total number of jobs for each serach term grouped by career level?  
select search_term, career_level, count(job_title) as no_of_jobs
from job_view
group by 1,2
order by 2,3 desc;
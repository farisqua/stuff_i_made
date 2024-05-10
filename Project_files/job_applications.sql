-- Table to store my job applications
CREATE TABLE job_data.job_applications (
    job_key SERIAL 	 PRIMARY KEY,
    rejected_flag 	 BOOLEAN,
    applied_company  VARCHAR(255),
    applied_position VARCHAR(255),
    application_date DATE,
    application_link TEXT
);
-- Jobs to apply to
CREATE TABLE job_data.jobs_to_apply (
    job_key SERIAL 	  PRIMARY KEY,
    applied_flag 	 	  BOOLEAN,
    company  				  VARCHAR(255),
    job_position 		  VARCHAR(255),
    days_since_posted DATE,
    application_link  TEXT
);


SELECT * 
FROM job_data.job_applications AS ja
;

-- Number of jobs applied
SELECT
	ja.applied_company,
	count(applied_position) AS applied_count,
	count(applied_position) FILTER (WHERE ja.rejected_flag = TRUE) AS rejected_count
FROM job_data.job_applications AS ja
GROUP BY 1
ORDER BY 2 DESC
;


SELECT *
FROM job_data.jobs_to_apply AS jta;
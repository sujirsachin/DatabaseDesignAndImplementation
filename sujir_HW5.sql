/* Sachin Mohan Sujir ss1037 */


/* TASK 1 */

select statecode from employer union select location from quarter;

/* End */


/* TASK 2 */

select e.companyname,e.division,e.statecode,i.salaryoffered from employer e inner join interview i on e.companyname=i.companyname and e.division=i.division;

/* End */


/* TASK 3 */

select statecode,description from state where statecode not in(select statecode from employer);

/* End */


/* TASK 4 */

select distinct(companyname),minhrsoffered from interview;

/* End */


/* TASK 5 */

Select * from state  where description like '__a%' or description like '__e%' or description like '__i%' or description like '__o%' or description like '__u%';

/* End */


/* TASK 6 */

select q.qtrcode,q.location,s.description from quarter q inner join state s on q.location=s.statecode;


/* End */


/* Task 7 */

select state.description,employer.companyname from state  left outer join employer on state.statecode=employer.statecode;


/* End */









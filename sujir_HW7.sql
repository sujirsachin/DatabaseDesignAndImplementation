/* Sachin Mohan Sujir ss1037 */

/* HW 7 */



/* Task 1 */

select concat(City,', ',statecode) as 'Location',count(PublisherID) as Count from Publisher group by Location order by count asc, location desc;


/* End */


/* Task 2 */

select b.title,count(r.Rating) as 'Total Ratings',Min(r.Rating) as 'Low', Max(r.Rating) as 'High', Avg(r.rating) as 'Average' from Book b left outer join BookReview r on b.ISBN=r.ISBN group by title order by count(r.Rating) desc,Avg(r.rating) desc;


/* End */


/* Task 3 */

select p.Name as 'Publisher Name', count(b.Title) as'Book Count' from Publisher p inner join Book b on p.PublisherID=b.PublisherID  group by p.Name having count(b.Title)>2 order by count(b.title) desc,p.Name asc;


/* Task 4 */

select Title,Char_Length(Title) as 'Length',substring_index(Title,'Bill',-1) as 'After Bill' from Book where Title like '%Bill%';


/* End */


/* Task 5 */

select distinct(b.title) from Book b inner join OwnersBook o on b.ISBN=o.ISBN;


/* End */




/* *****************End*************** */

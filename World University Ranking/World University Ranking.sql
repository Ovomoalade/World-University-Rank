Create Database World_University_Rankings_Analysis;

Use World_University_Rankings_Analysis;
-- import table
select * from uni_rankings2024;

/* Data Exploration using SQL
Explore the structure of the dataser using basic SQL querries 
(e.g. SELECT, COUNT(), GROUP BY, e.t.c).*/

-- View the structure of the table 
describe uni_rankings2024;
-- Check the total number of record
select count(*) from uni_rankings2024;

-- 3. Analysis Questions top_uni
-- 1. Top Universities by Overall Score

create view Top10_uni as 
select university, Overall from uni_rankings2024 order by overall desc
limit 10;

select * from top10_uni;

-- 2 Top Countries by Research Performance
create view Top10_Country_Research_Performance as
select country, avg(research) as avg_research_score from uni_rankings2024
group by country order by avg_research_score desc 
limit 10;

select * from Top10_Country_Research_Performance;

# 3. Impact of International Outlook on Rankings
select University, 'rank' , 'international outlook' from uni_rankings2024 
where 'international outlook' > 90;

select * from uni_rankings2024;
select university, max(teaching) from uni_rankings2024
group by university order by max(teaching) desc
limit 1;

# 4. Correlation Between Industry Income and Rankings
select University, 'rank', 'Industry Income' from uni_rankings2024
where 'Industry Income' > 90;
/* 5. Conclusion and Insights
From the SQL queries, we can derive the following insights

*   Top Universities: 
The Top 10 universities by overall core typically belong to countries with strong research and
teaching performance

*   Research Performance 
Countries such as the US and the UK tend to dominate research performance metrics, correlating 
with their high university rankings
*  International Outlook Influence:
A high international outlook score generally correlates with better university rankings, though some universities may rank highly with moderate outlook scores due to strong research or teaching metrics.
•	Industry Income:
High industry income can be found among top universities, but it is not always a decisive factor in overall ranking compared to research and citations.
*/
with s_avg as(
select
round(avg(season17_18 *.00001)) as avg_salary
from NBA_season1718_salary)
,p_list as (SELECT
round(season17_18 *.00001) as avg_p_s
,season17_18 as a_salary
,Player
,tm
FROM NBA_season1718_salary)
,avg_p_list as (
SELECT
a.Player
,a.tm
,avg_p_s
,a_salary
from p_list a
join s_avg b on a.avg_p_s = b.avg_salary)
SELECT
MAX(season17_18) AS SALARY
,Player
,TM
,'MAX' AS SALARY_CAT
FROM NBA_season1718_salary
UNION
SELECT
MIN(season17_18) AS SALARY
,Player
,TM
,'MIN' AS SALARY_CAT
FROM NBA_season1718_salary
UNION
SELECT
a_salary as Salary
,group_concat(Player, '; ')
,group_concat(TM, '; ')
,'AVG' AS SALARY_CAT
FROM avg_p_list
group by a_salary

-- 13. Total watch time (hrs)
----------------------------------------------------------
With CTE1 as (
			SELECT Round((SUM(total_watch_time_mins) / 60)/1000000 ,2) AS Watch_Time_Million_Hrs_jotstar 
FROM jotstar_db.content_consumption
),
CTE2 as ( SELECT Round((SUM(total_watch_time_mins) / 60) / 1000000 ,2) AS Watch_Time_Million_Hrs_Liocinema
FROM liocinema_db.content_consumption
)
Select Watch_Time_Million_Hrs_jotstar  , Watch_Time_Million_Hrs_Liocinema
From CTE1 , CTE2;
-- 14. Average watch time (hrs)
----------------------------------------------------------
With CTE1 as (
			SELECT Round(AVG(total_watch_time_mins) / 60,2) AS Avg_Watch__Hrs_jotstar 
FROM jotstar_db.content_consumption
),
CTE2 as ( SELECT Round(AVG(total_watch_time_mins) / 60,2) AS Avg_Watch_Hrs_Liocinema
FROM liocinema_db.content_consumption
)
Select Avg_Watch__Hrs_jotstar  , Avg_Watch_Hrs_Liocinema
From CTE1 , CTE2;
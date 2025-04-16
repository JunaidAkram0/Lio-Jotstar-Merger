-- 7. Inactive Rate (%)
----------------------------------------------------------
WITH CTE1 AS ( 
	SELECT COUNT(user_id) AS Inactive_Users_jotstar
	FROM jotstar_db.subscribers
	WHERE last_active_date IS NOT NULL
),
CTE2 AS ( 
	SELECT COUNT(user_id) AS Total_Users_jotstar 
	FROM jotstar_db.subscribers
),
CTE3 As ( Select Count(User_id) as Inactive_Users_Licinema
from liocinema_db.subscribers
Where last_active_date is not NULL
),
CTE4 As (Select count(User_id) as Total_Users_liocinema
from liocinema_db.subscribers
)
select Round((Inactive_Users_jotstar / Total_Users_jotstar ) *100 ,2) as Inactive_Rate_Jotstar ,
		Round((Inactive_Users_Licinema / Total_Users_liocinema ) *100 ,2) as Inactive_Rate_Liocinema
        From CTE1 , CTE2 ,CTE3 , CTE4;
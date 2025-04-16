						-- 4. Paid users %
----------------------------------------------------------
WITH CTE1 AS (
	SELECT COUNT(user_id) AS Paid_Users_jotstar
	FROM jotstar_db.subscribers
	WHERE subscription_plan IN ('VIP', 'Premium') or new_subscription_plan In ('VIP', 'Premium')
),
CTE2 AS (
	SELECT COUNT(user_id) AS Total_Jotstar_Users
	FROM jotstar_db.subscribers
),
CTE3 as ( SELECT COUNT(user_id) AS Paid_Users_Liocinema
	FROM liocinema_db.subscribers
	WHERE subscription_plan IN ('Basic', 'Premium') or new_subscription_plan In ('Basic', 'Premium')
),
CTE4 as (
	SELECT COUNT(user_id) AS Total_Liocinema_Users
	FROM liocinema_db.subscribers
)
select Round((Paid_Users_jotstar / Total_Jotstar_Users) *100 ,2) as Paid_Users_Percentage_Jotstar
, Round((Paid_Users_Liocinema / Total_Liocinema_Users) *100,2) as Paid_Users_Percentage_Liocinema
from CTE1 , CTE2 , CTE3 ,CTE4;

-- 6. Inactive users
----------------------------------------------------------
With CTE1 as( 
				SELECT COUNT(user_id) AS inactive_Users_Jotstar 
FROM jotstar_db.subscribers
WHERE last_active_date IS not NULL
),
CTE2 as ( Select Count(user_id) as inactive_Users_Liocinema
from liocinema_db.subscribers
where last_active_date is not Null 
)
select Inactive_Users_Jotstar, Inactive_Users_Liocinema
From CTE1 , CTE2;
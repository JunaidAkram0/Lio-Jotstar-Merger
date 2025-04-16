-- 5. Active users
----------------------------------------------------------
With CTE1 as( 
				SELECT COUNT(user_id) AS Active_Users_Jotstar 
FROM jotstar_db.subscribers
WHERE last_active_date IS NULL
),
CTE2 as ( Select Count(user_id) as Active_Users_Liocinema
from liocinema_db.subscribers
where last_active_date is Null 
)
select Active_Users_Jotstar, Active_Users_Liocinema
From CTE1 , CTE2;


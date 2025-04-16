
							-- 2. Total users
----------------------------------------------------------
With CTE1 as( 
				SELECT COUNT(user_id) AS Total_Jotstar_Users 
                from jotstar_db.subscribers
),
CTE2 as ( 		select COUNT(user_id) AS Total_Liocinema_Users 
                from liocinema_db.subscribers
                )
                select Total_Jotstar_Users , Total_Liocinema_Users from CTE1 , CTE2;
-- 11. Downgraded users
----------------------------------------------------------
With CTE1 as (
Select Count(user_id) as "Downgrade_users_jotstar" ,
Case 
		When subscription_plan = "VIP" and new_subscription_plan = "Free" then "Downgrade"
		When subscription_plan = "VIP" and new_subscription_plan = "Premium" then "Downgrade"
        When subscription_plan = "Premium" and new_subscription_plan = "Free" then "Downgrade"
        End as Subscription_Change_jot
				from jotstar_db.subscribers
                group by Subscription_Change_jot
                order by Downgrade_users_jotstar asc
                limit 1
),
CTE2 as (
 select Count(user_id) as "Downgrade_users_liocinema" ,
Case 
		When subscription_plan IN ("Basic" , "Premium") and new_subscription_plan = "Free" then "Downgrade"
		When subscription_plan = "Premium" and new_subscription_plan = "Basic" then "Downgrade"
        End as Subscription_Change_lio
				from liocinema_db.subscribers
                group by Subscription_Change_lio
                order by Downgrade_users_liocinema asc
                limit 1
                )
                
select Downgrade_users_jotstar , Downgrade_users_liocinema from CTE1 , CTE2;
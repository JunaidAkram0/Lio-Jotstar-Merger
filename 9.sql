-- 9. Upgraded users
----------------------------------------------------------
With CTE1 as (
Select Count(user_id) as "Upgrade_users_jotstar" ,
Case 
		When subscription_plan = "Free" and new_subscription_plan = "VIP" then "Upgrade"
		When subscription_plan = "Premium" and new_subscription_plan = "VIP" then "Upgrade"
        When subscription_plan = "Free" and new_subscription_plan = "Premium" then "Upgrade"
        End as Subscription_Change_jot
				from jotstar_db.subscribers
                group by Subscription_Change_jot
                order by Upgrade_users_jotstar asc
                limit 1
),
CTE2 as (
 select Count(user_id) as "Upgrade_users_liocinema" ,
Case 
		When subscription_plan = "Free" and new_subscription_plan IN ("Basic" , "Premium") then "Upgrade"
		When subscription_plan = "Basic" and new_subscription_plan = "Premium" then "Upgrade"
        End as Subscription_Change_lio
				from liocinema_db.subscribers
                group by Subscription_Change_lio
                order by Upgrade_users_liocinema asc
                limit 1
                )
                
select Upgrade_users_jotstar , Upgrade_users_liocinema from CTE1 , CTE2;
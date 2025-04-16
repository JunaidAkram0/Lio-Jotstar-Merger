						-- 3. Paid users
----------------------------------------------------------
With CTE1 as ( select COUNT(user_id) AS Total_Paid_Users_Jotstar
from jotstar_db.subscribers
where subscription_plan IN ("Premium" , "VIP") or new_subscription_plan In ("Premium" , "VIP") 
),
CTE2 as ( select COUNT(User_id) AS Total_Paid_Users_Liocinema 
from liocinema_db.subscribers
where subscription_plan IN ("Premium" , "Basic") or new_subscription_plan In ("Premium" , "Basic")
)
select  Total_Paid_Users_Jotstar , Total_Paid_Users_Liocinema from CTE1 , CTE2;
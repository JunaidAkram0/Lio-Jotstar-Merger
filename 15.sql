-- 15.  Monthly users Growth Rate (%) 

WITH CTE1 AS (
    SELECT 
        DATE_FORMAT(subscription_date , '%Y-%m') AS Month_Jot, 
        COUNT(user_id) AS Monthly_users_Jotstar
    FROM jotstar_db.subscribers
    GROUP BY DATE_FORMAT(subscription_date , '%Y-%m')
),
CTE2 AS (
    SELECT 
        Month_Jot,
        Monthly_users_Jotstar,
        LAG(Monthly_users_Jotstar) OVER (ORDER BY Month_Jot) AS Prev_month_sales_jot
    FROM CTE1
),
CTE3 AS (
    SELECT 
        DATE_FORMAT(subscription_date , '%Y-%m') AS Month_Lio, 
        COUNT(user_id) AS Monthly_Users_Lio
    FROM liocinema_db.subscribers
    GROUP BY DATE_FORMAT(subscription_date , '%Y-%m')
),
CTE4 AS (
    SELECT 
        Month_Lio,
        Monthly_Users_Lio,
        LAG(Monthly_Users_Lio) OVER (ORDER BY Month_Lio) AS Prev_Month_Users_Lio
    FROM CTE3
)

SELECT 
    cte2.Month_Jot,
    ROUND(((cte2.Monthly_users_Jotstar - cte2.Prev_month_sales_jot) / NULLIF(cte2.Prev_month_sales_jot, 0)) * 100, 2) AS Jotstar_Users_Rate,
    cte4.Month_Lio,
    ROUND(((cte4.Monthly_Users_Lio - cte4.Prev_Month_Users_Lio) / NULLIF(cte4.Prev_Month_Users_Lio, 0)) * 100, 2) AS Liocinema_Users_Rate
FROM 
    CTE2 cte2
LEFT JOIN 
    CTE4 cte4 ON cte2.Month_Jot = cte4.Month_Lio;
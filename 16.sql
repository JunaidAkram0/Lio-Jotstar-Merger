-- 16. Upgrade / Downgrade Rate (%)

WITH 
-- Downgrade Jotstar
CTE_Downgrade_Jotstar AS (
    SELECT 
        COUNT(user_id) AS downgrade_users_jotstar
    FROM jotstar_db.subscribers
    WHERE 
        (subscription_plan = 'VIP' AND new_subscription_plan IN ('Free', 'Premium')) OR
        (subscription_plan = 'Premium' AND new_subscription_plan = 'Free')
),

-- Downgrade Liocinema
CTE_Downgrade_Liocinema AS (
    SELECT 
        COUNT(user_id) AS downgrade_users_liocinema
    FROM liocinema_db.subscribers
    WHERE 
        (subscription_plan = 'Premium' AND new_subscription_plan IN ('Basic', 'Free')) OR
        (subscription_plan = 'Basic' AND new_subscription_plan = 'Free')
),

-- Upgrade Jotstar
CTE_Upgrade_Jotstar AS (
    SELECT 
        COUNT(user_id) AS upgrade_users_jotstar
    FROM jotstar_db.subscribers
    WHERE 
        (subscription_plan = 'Free' AND new_subscription_plan IN ('VIP', 'Premium')) OR
        (subscription_plan = 'Premium' AND new_subscription_plan = 'VIP')
),

-- Upgrade Liocinema
CTE_Upgrade_Liocinema AS (
    SELECT 
        COUNT(user_id) AS upgrade_users_liocinema
    FROM liocinema_db.subscribers
    WHERE 
        (subscription_plan = 'Free' AND new_subscription_plan IN ('Basic', 'Premium')) OR
        (subscription_plan = 'Basic' AND new_subscription_plan = 'Premium')
)

SELECT 
    ROUND((uj.upgrade_users_jotstar / NULLIF(udj.downgrade_users_jotstar, 0)) * 100, 2) AS Upgrade_Downgrade_Ratio_Jotstar,
    ROUND((ul.upgrade_users_liocinema / NULLIF(udl.downgrade_users_liocinema, 0)) * 100, 2) AS Upgrade_Downgrade_Ratio_Liocinema
FROM 
    CTE_Upgrade_Jotstar uj,
    CTE_Downgrade_Jotstar udj,
    CTE_Upgrade_Liocinema ul,
    CTE_Downgrade_Liocinema udl;



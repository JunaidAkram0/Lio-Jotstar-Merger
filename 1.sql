
						-- 1. Total content items
----------------------------------------------------------

With CTE1 as ( 
				select distinct 	
								count(content_id) as Jotstar_Content_items
 from jotstar_db.contents
 ),
 CTE2 as ( select distinct 	
								count(content_id) as Liocinema_Content_items
 from liocinema_db.contents) 
 select Jotstar_Content_items , Liocinema_Content_items from CTE1 , CTE2;
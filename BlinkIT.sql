use Blinkit

SELECT COUNT(*) FROM [BlinkIT Grocery Data]

select * from [BlinkIT Grocery Data]

update [BlinkIT Grocery Data]
set Item_Fat_Content=
case
when Item_Fat_Content IN ('LF','low fat')THEN 'Low Fat'
when Item_Fat_Content = 'reg' then 'Regular'
else Item_Fat_Content
end

select DISTINCT(Item_Fat_Content) from [BlinkIT Grocery Data]

select concat(cast(SUM(Sales)/1000000 As decimal (10,2)), ' M') as Total_Sales from [BlinkIT Grocery Data]

SELECT cast(AVG(Sales) as decimal (10,1))as Avg from [BlinkIT Grocery Data]

select COUNT(*) as No_Of_Items from [BlinkIT Grocery Data]
where Outlet_Establishment_Year = 2018


SELECT cast(AVG(Rating) as decimal (10,2))as Avg_rating from [BlinkIT Grocery Data]

select Item_Fat_Content,
CONCAT(CAST(sum(Sales)/100000 AS decimal (10,2)), ' L') as Total_Sales,
cast(AVG(Sales) as decimal (10,0))as Avg,
COUNT(*) as No_Of_Items,
cast(AVG(Rating) as decimal (10,2))as Avg_rating
from [BlinkIT Grocery Data]
group by Item_Fat_Content
ORDER BY Item_Fat_Content

select Top 5 Item_Type,
CAST(sum(Sales) AS decimal (10,2))as Total_Sales,
cast(AVG(Sales) as decimal (10,0))as Avg,
COUNT(*) as No_Of_Items,
cast(AVG(Rating) as decimal (10,2))as Avg_rating
from [BlinkIT Grocery Data]
group by Item_Type
order by Total_Sales Asc

select  Outlet_Location_Type,Item_Fat_Content,
CAST(sum(Sales) AS decimal (10,2))as Total_Sales,
cast(AVG(Sales) as decimal (10,0))as Avg,
COUNT(*) as No_Of_Items,
cast(AVG(Rating) as decimal (10,2))as Avg_rating
from [BlinkIT Grocery Data]
group by Outlet_Location_Type,Item_fat_Content
order by Total_Sales Asc

SELECT * FROM [BlinkIT Grocery Data]

SELECT Outlet_Location_Type,
      ISNULL([Low Fat], 0) AS Low_Fat,
      ISNULL([Regular)], 0) AS Regular
FROM 
( 
   select Outlet_Location_Type, Item_Fat_Content,
          CAST(sum(Sales) as decimal(10,2)) as Total_Sales
   from [BlinkIT Grocery Data]
   group by Outlet_Location_Type, Item_Fat_Content
) as SourceTable
PIVOT
(
    sum(Total_Sales)
    for	Item_Fat_Content in ([Low Fat], [Regular])	
) as pivotTable
ORDER BY Outlet_Location_Type


select Outlet_Establishment_Year,
CAST(sum(Sales) AS decimal(10,2)) as Total_Sales,
cast(avg(Sales)  as decimal(10,2)) as Avg,
COUNT(*) as NO_Of_Items,
cast(avg(Rating) AS DECIMAL (10,2)) AS Avg_Rating
from [BlinkIT Grocery Data]
group by Outlet_Establishment_Year
order by Total_Sales desc

select 
Outlet_Size,
CAST(sum(Sales) AS decimal(10,2)) AS Total_Sales,
concat(CAST((sum(Sales)*100.0/SUM(sum(Sales)) over ()) AS decimal (10,2)), ' %') as Sales_Percentage
from [BlinkIT Grocery Data]
group by Outlet_Size
order by Total_Sales desc

select * from [BlinkIT Grocery Data]


select 
Outlet_Type,
CAST(sum(Sales) AS decimal(10,2)) AS Total_Sales,
concat(CAST((sum(Sales)*100.0/SUM(sum(Sales)) over ()) AS decimal (10,2)), ' %') as Sales_Percentage,
cast(avg(Sales)  as decimal(10,2)) as Avg,
COUNT(*) as NO_Of_Items,
cast(avg(Rating) AS DECIMAL (10,2)) AS Avg_Rating
from [BlinkIT Grocery Data]
group by Outlet_Type
order by Total_Sales desc
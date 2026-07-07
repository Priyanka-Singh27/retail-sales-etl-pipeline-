--Average MRP by Item_Type
SELECT 
  Item_Type,
  ROUND(AVG(Item_MRP), 2) AS Avg_MRP,
  COUNT(*) AS Num_Items
FROM `bigmartsales-501715.bigmart_analysis.bigmart_sales`
GROUP BY Item_Type
ORDER BY Avg_MRP DESC;

--Top 5 outlets by total sales
SELECT 
  Outlet_Identifier,
  Outlet_Type,
  Outlet_Location_Type,
  ROUND(SUM(Item_Outlet_Sales), 2) AS Total_Sales
FROM `bigmartsales-501715.bigmart_analysis.bigmart_sales`
GROUP BY Outlet_Identifier, Outlet_Type, Outlet_Location_Type
ORDER BY Total_Sales DESC
LIMIT 5;

--Total sales by Outlet_Type
SELECT 
  Outlet_Type,
  ROUND(SUM(Item_Outlet_Sales), 2) AS Total_Sales,
  COUNT(*) AS Num_Transactions
FROM `bigmartsales-501715.bigmart_analysis.bigmart_sales`
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;
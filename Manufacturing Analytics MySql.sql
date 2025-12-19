create database sqlProject;
use sqlProject;
select * from manufacturing_datasets;



# Average Manufactured Quantity
SELECT round(avg(`Manufactured Qty`),0) FROM manufacturing_datasets;

#Average Produced Qty
SELECT ROUND(AVG(`Produced Qty`), 0) AS Avg_Produced_Qty
FROM manufacturing_datasets;


#Average Rejected Quantity
SELECT round(avg(`Rejected Qty`),0) FROM manufacturing_datasets;

# Average Processed Quantity
SELECT round(avg(`Processed Qty`),0) FROM manufacturing_datasets;

# Rejection Percentage
SELECT CONCAT(ROUND(SUM(`Rejected Qty`) / SUM(`Processed Qty`) * 100, 2), "%") 
AS Rejection_Percentage
FROM manufacturing_datasets;


# Average Rejected Qty per Machine
SELECT `Machine Code`,
Avg(`Rejected Qty`) as Average_Rejected_Quantity
FROM manufacturing_datasets
GROUP By `Machine Code`;

# Average Produced Qty per Day
Select `Doc Date`,Avg(`Produced Qty`) as Average_Produced_Quantity 
FROM manufacturing_datasets
GROUP BY `Doc Date`;

# Compare Avg Rejected vs Avg Manufactured
SELECT 
    CASE 
        WHEN (SELECT AVG(`Rejected Qty`) FROM manufacturing_datasets) 
             > (SELECT AVG(`Manufactured Qty`) FROM manufacturing_datasets) 
             THEN 'More Rejected'
             
        WHEN (SELECT AVG(`Rejected Qty`) FROM manufacturing_datasets) 
             < (SELECT AVG(`Manufactured Qty`) FROM manufacturing_datasets) 
             THEN 'Less Rejected'
             
        ELSE 'Equal'
    END AS Comparison;

 # Department-wise Comparison   
   SELECT 
    `Department Name`,
    ROUND(AVG(`Manufactured Qty`),0) AS Total_Manufactured_Qty,
    ROUND(AVG(`Rejected Qty`),0) AS Total_Rejected_Qty,
    
    CASE 
        WHEN AVG(`Rejected Qty`) > AVG(`Manufactured Qty`)
             THEN 'More Rejected'
        WHEN AVG(`Rejected Qty`) < AVG(`Manufactured Qty`)
             THEN 'Less Rejected'
        ELSE 'Equal'
    END AS Comparison

FROM manufacturing_datasets
GROUP BY `Department Name`;

    
# Employee-wise Average Rejected Qty    
SELECT `Emp Name`,round(Avg(`Rejected Qty`),2) as Average_Rejected_Quantity from manufacturing_datasets
group by `Emp Name`;

# Top 5 Employees by Produced Qty
SELECT `Emp Name`, SUM(`Produced Qty`) AS Total_Produced
FROM manufacturing_datasets
GROUP BY `Emp Name`
ORDER BY Total_Produced DESC ;

# Total Rejected Qty per Machine
SELECT `Machine Code`, SUM(`Rejected Qty`) AS Total_Rejected
FROM manufacturing_datasets
GROUP BY `Machine Code`
ORDER BY Total_Rejected DESC;


# Percentage Efficiency
SELECT 
    (`Produced Qty` / `Processed Qty`) * 100 AS Efficiency
FROM manufacturing_datasets;
# Count of Documents per Department
SELECT `Department Name`, COUNT(*) AS Total_Orders
FROM manufacturing_datasets
GROUP BY `Department Name`
ORDER BY Total_Orders DESC;


# Department-wise Average Per Day Machine Cost
SELECT 
    `Department Name`, 
    ROUND(AVG(`Per day Machine Cost`), 2) AS Avg_Machine_Cost
FROM manufacturing_datasets
GROUP BY `Department Name`;

 # Most Frequently Used Operation
SELECT `Operation Name`, COUNT(*) AS Used_Count
FROM manufacturing_datasets
GROUP BY `Operation Name`
ORDER BY Used_Count DESC;

# Daily Production Summary
SELECT DATE(`Doc Date`) AS Date, SUM(`Produced Qty`) AS Total_Produced
FROM manufacturing_datasets
GROUP BY Date
ORDER BY Date;

















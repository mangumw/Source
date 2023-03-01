USE [ReportData]
GO
/****** Object:  StoredProcedure [dbo].[usp_weekly_Sales_Cafe_Electronics]    Script Date: 8/19/2022 3:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_weekly_Sales_Cafe_Electronics]
AS
truncate table reportdata..weekly_Sales_Cafe_Electronics

INSERT INTO weekly_Sales_Cafe_Electronics
                         (ISBN, Sku_Number, EAN, DW_ISBN, Title, Status, Pub_Code, Publisher, VIN, Author, Returnable, Disposition, Sr_Buyer, Buyer, Buyer_Number, Dept, Dept_Name, SDept, SDept_Name, Class, Class_Name, 
                         SClass, SClass_Name, Module, Sku_Type, Subject, Strength, Bookscan_Rank, Internet_Rank, BAM_WOS, AWBC_WOS, Sell_Thru, DWCost, Retail, Coordinate_Group, Season, IDate, ExpReceiptDate, Store_Min, 
                         Min_Qty, Max_Qty, Case_Qty, BAM_OnHand, BAM_OnOrder, Warehouse_OnHand, ReturnCenter_OnHand, Qty_OnOrder, Qty_OnBackorder, InTransit, Total_OnHand, Stocked_Stores, Week1Units, Week1Dollars, 
                         Week2Units, Week2Dollars, Week3Units, Week3Dollars, DCWeek1Units, DCWeek1Dollars, DCWeek2Units, DCWeek2Dollars, DCWeek3Units, DCWeek3Dollars, lyWeek1Units, lyWeek1Dollars, lyWeek2Units, 
                         lyWeek2Dollars, lyWeek3Units, lyWeek3Dollars, lyDCWeek1Units, lyDCWeek1Dollars, lyDCWeek2Units, lyDCWeek2Dollars, lyDCWeek3Units, lyDCWeek3Dollars, TYYTDUnits, TYYTDDollars, LYYTDUnits, 
                         LYYTDDollars, DCTYYTDUnits, DCTYYTDDollars, DCLYYTDUnits, DCLYYTDDollars, Week13Units, Week13Dollars, DCWeek13Units, DCWeek13Dollars, WTD_Units, WTD_Dollars, DCWTD_Units, 
                         DCWTD_Dollars, LTD_Units, LTD_Dollars, DCLTD_Units, DCLTD_Dollars, WarehouseID, Load_Date, Planner_Name, LW_Sell_thru, WK8_No_Sales, Active_Stores, Display_Min, FY14_WK13_Units, 
                         FY14_WK13_Dollars)
SELECT        ISBN, Sku_Number, EAN, DW_ISBN, Title, Status, Pub_Code, Publisher, VIN, Author, Returnable, Disposition, Sr_Buyer, Buyer, Buyer_Number, Dept, Dept_Name, SDept, SDept_Name, Class, Class_Name, 
                         SClass, SClass_Name, Module, Sku_Type, Subject, Strength, Bookscan_Rank, Internet_Rank, BAM_WOS, AWBC_WOS, Sell_Thru, DWCost, Retail, Coordinate_Group, Season, IDate, ExpReceiptDate, Store_Min, 
                         Min_Qty, Max_Qty, Case_Qty, BAM_OnHand, BAM_OnOrder, Warehouse_OnHand, ReturnCenter_OnHand, Qty_OnOrder, Qty_OnBackorder, InTransit, Total_OnHand, Stocked_Stores, Week1Units, Week1Dollars, 
                         Week2Units, Week2Dollars, Week3Units, Week3Dollars, DCWeek1Units, DCWeek1Dollars, DCWeek2Units, DCWeek2Dollars, DCWeek3Units, DCWeek3Dollars, lyWeek1Units, lyWeek1Dollars, lyWeek2Units, 
                         lyWeek2Dollars, lyWeek3Units, lyWeek3Dollars, lyDCWeek1Units, lyDCWeek1Dollars, lyDCWeek2Units, lyDCWeek2Dollars, lyDCWeek3Units, lyDCWeek3Dollars, TYYTDUnits, TYYTDDollars, LYYTDUnits, 
                         LYYTDDollars, DCTYYTDUnits, DCTYYTDDollars, DCLYYTDUnits, DCLYYTDDollars, Week13Units, Week13Dollars, DCWeek13Units, DCWeek13Dollars, WTD_Units, WTD_Dollars, DCWTD_Units, 
                         DCWTD_Dollars, LTD_Units, LTD_Dollars, DCLTD_Units, DCLTD_Dollars, WarehouseID, Load_Date, '' AS Expr1, 0 AS Expr2, 0 AS Expr3, 0 AS Expr4, 0 AS Expr5, 0 AS Expr6, 0 AS Expr7
FROM            Dssdata.dbo.CARD
WHERE        (Dept = 13) OR
                         (Dept = 14) OR
                         (Dept = 16) OR
                         (Dept = 70) OR
                         (Dept = 71) OR
                         (Dept = 75) OR
                         (Dept = 3) AND (SDept IN (102, 106, 109, 117, 118))
ORDER BY Dept, SDept, Class


--select count(*) from [reportData].[dbo].[weekly_Sales_Cafe_Electronics];
----- Update Planner_Name ------
update [ReportData].[dbo].[weekly_Sales_Cafe_Electronics]
set [Planner_Name] = 
    (select distinct b.planner_name from reference.dbo.Weekly_Sales_Buyer_Planner_XRef b 
      where ([ReportData].[dbo].[weekly_Sales_Cafe_Electronics].dept = b.dept and
			  [ReportData].[dbo].[weekly_Sales_Cafe_Electronics].sdept = b.sdept and  
             [ReportData].[dbo].[weekly_Sales_Cafe_Electronics].class = b.class)),
[buyer] = 
    (select distinct b.buyer_name from reference.dbo.Weekly_Sales_Buyer_Planner_XRef b 
      where ([ReportData].[dbo].[weekly_Sales_Cafe_Electronics].dept = b.dept and
			  [ReportData].[dbo].[weekly_Sales_Cafe_Electronics].sdept = b.sdept and 
             [ReportData].[dbo].[weekly_Sales_Cafe_Electronics].class = b.class));

----  update TW Sell Thru ------
----- Update FY12_Wk13_Units/Dollars -------

update [reportData].[dbo].[weekly_Sales_Cafe_Electronics]
set 
[FY14_WK13_Units] = (select sum(c.current_units)
from dssdata..weekly_sales c
where [reportData].[dbo].[weekly_Sales_Cafe_Electronics].sku_number = c.sku_number 
and c.day_date >= (getdate()-456) 
and c.day_date <= (getdate()-365)
and (c.Store_Number BETWEEN 100 AND 980
or c.store_number BETWEEN 2099 and 2999));

update [reportData].[dbo].[weekly_Sales_Cafe_Electronics]
set 
[FY14_WK13_Dollars] = (select sum(c.current_dollars)
from dssdata..weekly_sales c
where [reportData].[dbo].[weekly_Sales_Cafe_Electronics].sku_number = c.sku_number 
and c.day_date >= (getdate()-456) 
and c.day_date <= (getdate()-365)
and (c.Store_Number BETWEEN 100 AND 980
or c.store_number BETWEEN 2099 and 2999));

------ Update WK8_No_Sales

update [reportData].[dbo].[weekly_Sales_Cafe_Electronics]
set [WK8_No_Sales] = (select count (e.store_number)
from reference.dbo.Item_Display_Min e,reference.dbo.Active_Stores f , reference..invbal d
where [reportData].[dbo].[weekly_Sales_Cafe_Electronics].sku_number = e.sku_number 
and e.display_min > 0
and f.store_number = e.store_number
and d.sku_number = e.sku_number 
and d.store_number = e.store_number 
and d.ibwkcr+d.Wk1_SLSU+d.Wk2_SLSU+d.Wk3_SLSU+d.Wk4_SLSU+d.Wk5_SLSU+d.Wk6_SLSU+d.Wk7_SLSU+d.wk8_slsu = 0 
and (e.Store_Number BETWEEN 100 AND 980
or e.store_number BETWEEN 2099 and 2999));

------ Update Active_stores

update [reportData].[dbo].[weekly_Sales_Cafe_Electronics]
set active_stores = (select count (e.store_number)
from reference.dbo.Item_Display_Min e,reference.dbo.Active_Stores f
where [reportData].[dbo].[weekly_Sales_Cafe_Electronics].sku_number = e.sku_number 
and e.display_min > 0
and f.store_number = e.store_number
and (e.Store_Number BETWEEN 100 AND 980
or e.store_number BETWEEN 2099 and 2999));

update [reportData].[dbo].[weekly_Sales_Cafe_Electronics]
set [display_min] = (select sum (e.display_min)
from reference.dbo.Item_Display_Min e,reference.dbo.Active_Stores f 
where [reportData].[dbo].[weekly_Sales_Cafe_Electronics].sku_number = e.sku_number
and f.store_number = e.store_number
and (e.Store_Number BETWEEN 100 AND 980
or e.store_number BETWEEN 2099 and 2999));

update [reportData].[dbo].[weekly_Sales_Cafe_Electronics]
set [Display_Min] = isnull (display_min,0),
[FY14_WK13_Units] = isnull ([FY14_WK13_Units],0),
[FY14_WK13_Dollars] = isnull ([FY14_WK13_Dollars],0)

GO

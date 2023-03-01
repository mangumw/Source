USE [ReportData]
GO
/****** Object:  StoredProcedure [dbo].[usp_Build_CARD_Report_Parameters_2NC]    Script Date: 8/19/2022 3:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_Build_CARD_Report_Parameters_2NC]
as
--
-- Build Action Alley Codes
--
drop table ReportDAta.dbo.CardReportParameter_ActionAlley
--
select distinct module 
into ReportData.dbo.CardReportParameter_ActionAlley
from reference.dbo.invmst
--


---Build Condtion
drop table ReportData.dbo.cardReportParameter_Condition_2NC
SELECT DISTINCT Condition
INTO            reportdata.dbo.cardReportParameter_Condition_2NC
FROM         Reference.dbo.Item_Master
WHERE     (Condition IN ('NEW', 'USED'))

-- Build Vendor
--
drop table Reportdata.dbo.CardReportParameter_Vendor
select distinct Vendor_Number 
into ReportData.dbo.CardReportParameter_Vendor 
from reference.dbo.item_master
--
-- Build VIN
--
drop table reportdata.dbo.CardReportParameter_VIN
select distinct VIN 
into ReportData.dbo.CardReportParameter_VIN 
from dssdata.dbo.card

--
-- Build Item_Publisher
--
drop table reportdata.dbo.CardReportParameter_item_Publisher
select distinct(Publisher) 
into reportdata.dbo.CardReportParameter_Item_Publisher
from reference.dbo.item_publisher
order by Publisher
--
-- Build Sku Types
--
drop table reportdata.dbo.CardReportParameter_Sku_Types
select distinct type_sort,sku_group 
into reportdata.dbo.CardReportParameter_Sku_Types
from reference.dbo.sku_type_groups
--
-- Build Coordinate Group
--
drop table reportdata.dbo.cardreportparameter_coordinate_group

select distinct Coordinate_Group 
into reportdata.dbo.cardreportparameter_coordinate_group
from reference.dbo.invmst where Coordinate_Group <> ' '
union all
select All_Indicator as Coordinate_Group from reference.dbo.ALL_iNDICATORS
order by Coordinate_Group
--
-- Build Buyer
--
drop table reportdata.dbo.CardReportParameter_Buyer
select distinct buyer_Number,buyer as BuyerName
into reportdata.dbo.CardReportParameter_Buyer_2NC
from reference.dbo.buyer_srbuyer_xref
union all
select 0,all_indicator from reference.dbo.all_indicators
order by Buyer
--
-- Build Sr_Buyer
--
drop table reportdata.dbo.CardReportParameter_Sr_Buyer
select distinct Sr_Buyer_Name
into reportdata.dbo.CardReportParameter_Sr_Buyer_2NC
from reference.dbo.Category_Master
union all
select all_indicator from reference.dbo.all_indicators
order by Sr_Buyer_Name
--
-- Build Publisher
--
drop table reportdata.dbo.CardReportParameter_Publisher
select distinct pub_code 
into reportdata.dbo.CardReportParameter_Publisher_2NC
from dssdata.dbo.CARD 
union all
select All_Indicator  as Pub_Code from Reference.dbo.All_Indicators
order by pub_code
--
-- Build Season
--
drop table reportdata.dbo.CardReportParameter_Season
select distinct Season 
into reportdata.dbo.CardReportParameter_Season_2NC
from reference.dbo.invmst
union all 
select All_Indicator  as Pub_Code from Reference.dbo.All_Indicators
order by Season
--
-- Build Quarters
--
drop table reportdata.dbo.ReportParameter_Quarters
select distinct fiscal_quarter 
into reportdata.dbo.ReportParameter_Quarters
from reference.dbo.calendar_dim
where fiscal_quarter <= staging.dbo.fn_LastQuarter(getdate())
order by fiscal_quarter desc
--
-- Build Dept
--
drop table reportdata.dbo.CardReportParameter_Dept
select distinct cast(Dept as varchar(3)) as D
into reportdata.dbo.CardReportParameter_Dept
from dssdata.dbo.card_2NC
order by cast(Dept as varchar(3))
GO

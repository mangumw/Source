USE [ReportData]
GO
/****** Object:  StoredProcedure [dbo].[usp_rpt_999_report_bowker_status]    Script Date: 2/2/2023 4:53:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Mark Redman>
-- Create date: <02-02-2006>
-- Description:	<This is the report data selector for the 999 Report>
-- =============================================
ALTER PROCEDURE [dbo].[usp_rpt_999_report_bowker_status] 
	@NumRows varchar(6),
	@Dept char(6),
	@Sub_Dept char(6),
	@Class char(6),
	@Sub_Class char(6),
	@sku_type varchar(25),
	@Coordinate_Group varchar(5),
	@Pub_Code varchar(6),
	@Sr_Buyer varchar(30),
	@PubGroup varchar(6),
	@VIN varchar(20),
--	@IFLDSC varchar(35),
	@AAC varchar(5),
	@Strength varchar(5),
	@Buyer varchar(30),
	@AAMaster varchar(50),
	@Season varchar(6),
	@Planner varchar(30),
	@Sort_Order varchar(10),
	@Feature varchar(255),
	@Subject varchar(6),
	@Condition varchar(20)
	@Sku_Type_2 varchar(20)
AS
	SET NOCOUNT ON;
--
declare @strsql nvarchar(1000)
if @numrows <> '<All>'
begin
	select @strsql = 'set rowcount '
	select @strsql = @strsql + @NumRows 
	select @strsql = @strsql + ' select ISBN,'
end
else
select @strsql = ' select ISBN,'
select @strsql = @strsql + 'Sku_Number,'
select @strsql = @strsql + 'Condition,'
select @strsql = @strsql + 'Title,'
select @strsql = @strsql + 'Pub_Code,'
select @strsql = @strsql + 'Subject,'
select @strsql = @strsql + 'Author,'
select @strsql = @strsql + 'Sr_Buyer,'
select @strsql = @strsql + 'Buyer,'
select @strsql = @strsql + 'ltrim(str(Dept)) + '' / '' + rtrim(SDept_Name) + '' / '' + rtrim(Class_Name) + '' / '' + rtrim(SClass_Name) as Category,'
select @strsql = @strsql + 'Dept,'
select @strsql = @strsql + 'SDept_Name,'
select @strsql = @strsql + 'Class_Name,'
select @strsql = @strsql + 'SClass_Name,'
select @strsql = @strsql + 'Sku_Type, '
select @strsql = @strsql + 'Bowkerstatus, '
select @strsql = @strsql + 'Retail, '
select @strsql = @strsql + 'Disposition, '
select @strsql = @strsql + 'IDate, '
select @strsql = @strsql + 'ExpReceiptDate, '
select @strsql = @strsql + 'Coordinate_Group, '
select @strsql = @strsql + 'Module, '
select @strsql = @strsql + 'DWCost, '
select @strsql = @strsql + 'Store_Min, '
select @strsql = @strsql + 'BAM_OnHand, '
select @strsql = @strsql + 'Warehouse_OnHand, '
select @strsql = @strsql + 'Qty_OnOrder, '
select @strsql = @strsql + 'Qty_OnBackorder, '
select @strsql = @strsql + 'ReturnCenter_OnHand, '
select @strsql = @strsql + 'InTransit, '
select @strsql = @strsql + 'Total_OnHand, '
select @strsql = @strsql + 'Week1Units, '
select @strsql = @strsql + 'Week1Dollars, '
select @strsql = @strsql + 'Week2Units, '
select @strsql = @strsql + 'Week2Dollars, '
select @strsql = @strsql + 'Week3Units, '
select @strsql = @strsql + 'Week3Dollars, '
select @strsql = @strsql + 'TYYTDUnits, '
select @strsql = @strsql + 'TYYTDDollars, '
select @strsql = @strsql + 'LYYTDUnits, '
select @strsql = @strsql + 'LYYTDDollars, '
select @strsql = @strsql + 'Week13Units, '
select @strsql = @strsql + 'Week13Dollars, '
select @strsql = @strsql + 'WTD_Units, '
select @strsql = @strsql + 'WTD_Dollars '
select @strsql = @strsql + 'from dssdata.dbo.CARD '

if @Dept = '<All>'
	select @strsql = @strsql + 'where Dept like ' + '''' + '%' + ''''
else
	select @strsql = @strsql + 'where Dept = ' + ltrim(str(cast(@dept as int)))

--
if @Feature <> '<All>'
	select @strsql = @strsql + ' and sku_number in (select sku_number from reference.dbo.aa_feature_rankings where Feature = ''' + @Feature + ''')'
--
if @Sub_Dept <> '<All>'
	select @strsql = @strsql + ' and SDept = ' + ltrim(str(cast(@Sub_Dept as int)))
--
if @Class <> '<All>'
	select @strsql = @strsql + ' and Class = ' + ltrim(str(cast(@Class as int)))
--
if @Sub_Class <> '<All>'
	select @strsql = @strsql + ' and SClass = ' + ltrim(str(cast(@Sub_Class as int)))
--
if @Coordinate_Group <> '<All>'
  select @strsql = @strsql + ' and Coordinate_Group = ''' + @Coordinate_Group + ''''
--
if @Subject <> '<All>'
  select @strsql = @strsql + ' and Subject = ''' + @Subject + ''''
--
if @VIN <> '<All>'
  select @strsql = @strsql + ' and VIN = ' + @VIN 
--
if @Season <> '<All>'
  select @strsql = @strsql + ' and Season = ''' + @Season + ''''
--
--if @Item_Publisher <> '<All>'
--  select @strsql = @strsql + ' and left(Publisher,30) = ''' + @Item_Publisher + ''''
--
if @sku_type <> 'All'
  select @strsql = @strsql + ' and sku_type in (select sku_Type from reference.dbo.sku_type_groups where sku_group = ''' + @sku_type + ''')'
--
if @planner <> '<All>'
  select @strsql = @strsql + ' and Buyer_Number in (select Buyer_Number from reference.dbo.Buyer_Planner_XRef where Planner = ''' + @Planner + ''')'
--
--if @IFLDSC <> '<All>'
--  select @strsql = @strsql + ' and Merch_Group in (select IFINLN from reference.dbo.INVFIN where IFLDSC = ''' + @IFLDSC + ''')'
--
if @PubGroup <> '<All>'
  select @strsql = @strsql + ' and Pub_Code in (select pub from reference.dbo.Pub_Group where Pub_Grp = ' + '''' + @PubGroup + '''' + ') '
else
  if @Pub_Code <> '<All>'
    select @strsql = @strsql + ' and Pub_Code = ''' + @Pub_Code + ''''
--
if @Sr_Buyer <> '<All>'
  select @strsql = @strsql + ' and Sr_Buyer = ''' + @Sr_Buyer + ''''
--
if @Buyer <> '<All>'
  select @strsql = @strsql + ' and Buyer = ''' + @Buyer + ''''

if @AAC <> '<All>'
  select @strsql = @strsql + ' and Module = ''' + @AAC + ''''
--
if @AAMaster <> '<All>'
  select @strsql = @Strsql + ' and Module in (select FDAACODE from reference.dbo.AAMaster where Master_Code = ' + '''' + @AAMaster + '''' + ') '
--
if @Strength <> '<All>'
  select @strsql = @strsql + ' and Strength = ''' + @Strength + ''''
--
if @Condition <> '<All>'
  select @strsql = @strsql + ' and Condition = ''' + @Condition + ''''
--
if @Sort_Order = 'WK1D'
  select @strsql = @strsql + ' order by Week1Dollars desc, Sr_Buyer,Buyer,Dept, SDept, Class, SClass, sku_Type'
if @Sort_Order = 'WK1U'
  select @strsql = @strsql + ' order by Week1Units desc, Sr_Buyer,Buyer,Dept, SDept, Class, SClass, sku_Type'
if @Sort_Order = 'WTDD'
  select @strsql = @strsql + ' order by WTD_Dollars desc, Sr_Buyer,Buyer,Dept, SDept, Class, SClass, sku_Type'
if @Sort_Order = 'WTDU'
  select @strsql = @strsql + ' order by WTD_Units desc, Sr_Buyer,Buyer,Dept, SDept, Class, SClass, sku_Type'

--
declare @strsql nvarchar(1000)
--
EXEC sp_executesql @strsql

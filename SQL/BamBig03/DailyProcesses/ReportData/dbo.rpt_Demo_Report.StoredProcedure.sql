USE [ReportData]
GO
/****** Object:  StoredProcedure [dbo].[rpt_Demo_Report]    Script Date: 8/19/2022 3:44:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[rpt_Demo_Report]
	@Sku_Type varchar(6)
as
declare @strsql nvarchar(1000)
--
select @strsql = 'select top 50 * from dssdata.dbo.card'
if @strsql <> '<All>'
	select @strsql = @strsql + ' Where Sku_Type = ' + '''' + @Sku_Type + ''''
execute sp_executesql @strsql

GO

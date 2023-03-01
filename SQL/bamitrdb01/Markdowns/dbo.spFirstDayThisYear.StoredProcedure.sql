USE [Markdowns]
GO
/****** Object:  StoredProcedure [dbo].[spFirstDayThisYear]    Script Date: 08/23/2022 14:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spFirstDayThisYear]
AS
	declare @fiscyear smallint
	SELECT @fiscyear = fiscyear FROM BAMITR05.MiscSales.dbo.FiscCal
	 WHERE caldate Between DateAdd(d, -1, GETDATE()) and GETDATE()
	select min(caldate) from miscsales.dbo.fisccal where fiscyear = @fiscyear
GO

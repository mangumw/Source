USE [SCC]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteHashRecords]    Script Date: 8/22/2022 1:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Leisha Kennedy
-- Create date: 02/28/2022
-- Description:Delete HASH records
-- =============================================
CREATE PROCEDURE [dbo].[usp_DeleteHashRecords] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 delete from tblScannedItems where Department like 'HASH(%'

END
GO

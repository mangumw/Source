USE [SCC]
GO
/****** Object:  StoredProcedure [dbo].[usp_SupplementalBatchEmail_q]    Script Date: 8/22/2022 1:57:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************
--Onhand from tblBatchdetail and actualy scanned tblScanned items
--get difference >1 add items to variance report and have recount done
--get >25$ if Onhand <> to one another add item to variance report
*******************************************/
-- =============================================
-- Author:		Trevor Conatser
-- Create date: 2/16/2022
-- Description:	Email Supplemental Batch Detail
-- =============================================
CREATE PROCEDURE [dbo].[usp_SupplementalBatchEmail_q] @Store int


AS
BEGIN


SELECT BatchNumber ,SKU, Description, Author, Department, SubDepartment, SubClass, RetailPrice, ActionAllyPlacement FROM tblBatchDetails WHERE StoreNumber = @Store and Batchnumber = 4 and Batchpass = 9

END


GO

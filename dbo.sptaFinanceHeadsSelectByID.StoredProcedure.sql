USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaFinanceHeadsSelectByID]
  @LoginID NVarChar(8),
  @FinanceHeadID Int 
  AS
  SELECT
		[TA_FinanceHeads].[FinanceHeadID] ,
		[TA_FinanceHeads].[Description]  
  FROM [TA_FinanceHeads] 
  WHERE
  [TA_FinanceHeads].[FinanceHeadID] = @FinanceHeadID
GO

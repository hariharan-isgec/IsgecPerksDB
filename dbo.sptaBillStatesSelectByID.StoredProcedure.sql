USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillStatesSelectByID]
  @LoginID NVarChar(8),
  @BillStatusID Int 
  AS
  SELECT
		[TA_BillStates].[BillStatusID] ,
		[TA_BillStates].[Description]  
  FROM [TA_BillStates] 
  WHERE
  [TA_BillStates].[BillStatusID] = @BillStatusID
GO

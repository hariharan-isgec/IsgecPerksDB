USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetStatesSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
    [COST_CostSheetStates].*  
  FROM [COST_CostSheetStates] 
  WHERE
  [COST_CostSheetStates].[StatusID] = @StatusID
GO

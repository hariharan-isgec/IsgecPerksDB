USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtCostCentersSelectByID]
  @LoginID NVarChar(8),
  @CostCenterID NVarChar(6) 
  AS
  SELECT
    [SPMT_CostCenters].*  
  FROM [SPMT_CostCenters] 
  WHERE
  [SPMT_CostCenters].[CostCenterID] = @CostCenterID
GO

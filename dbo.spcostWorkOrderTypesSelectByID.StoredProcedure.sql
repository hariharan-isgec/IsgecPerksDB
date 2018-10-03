USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostWorkOrderTypesSelectByID]
  @LoginID NVarChar(8),
  @WorkOrderTypeID Int 
  AS
  SELECT
    [COST_WorkOrderTypes].*  
  FROM [COST_WorkOrderTypes] 
  WHERE
  [COST_WorkOrderTypes].[WorkOrderTypeID] = @WorkOrderTypeID
GO

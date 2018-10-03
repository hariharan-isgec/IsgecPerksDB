USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostQuartersSelectByID]
  @LoginID NVarChar(8),
  @Quarter Int 
  AS
  SELECT
    [COST_Quarters].*  
  FROM [COST_Quarters] 
  WHERE
  [COST_Quarters].[Quarter] = @Quarter
GO

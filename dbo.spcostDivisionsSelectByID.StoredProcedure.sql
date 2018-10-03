USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostDivisionsSelectByID]
  @LoginID NVarChar(8),
  @DivisionID Int 
  AS
  SELECT
    [COST_Divisions].*  
  FROM [COST_Divisions] 
  WHERE
  [COST_Divisions].[DivisionID] = @DivisionID
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogStuffingPointsSelectByID]
  @LoginID NVarChar(8),
  @StuffingPointID Int 
  AS
  SELECT
    [ELOG_StuffingPoints].*  
  FROM [ELOG_StuffingPoints] 
  WHERE
  [ELOG_StuffingPoints].[StuffingPointID] = @StuffingPointID
GO

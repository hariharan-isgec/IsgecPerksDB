USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spelog_LG_ICDCFSsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [ELOG_ICDCFSs].* ,
    [ELOG_StuffingPoints1].[Description] AS ELOG_StuffingPoints1_Description 
  FROM [ELOG_ICDCFSs] 
  LEFT OUTER JOIN [ELOG_StuffingPoints] AS [ELOG_StuffingPoints1]
    ON [ELOG_ICDCFSs].[StuffingPointID] = [ELOG_StuffingPoints1].[StuffingPointID]
  WHERE [ELOG_ICDCFSs].[StuffingPointID] = @OrderBy  
  ORDER BY [ELOG_ICDCFSs].[Description]

  SET @RecordCount = @@RowCount
GO

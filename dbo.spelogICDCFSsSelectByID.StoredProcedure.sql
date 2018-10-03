USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogICDCFSsSelectByID]
  @LoginID NVarChar(8),
  @ICDCFSID Int 
  AS
  SELECT
    [ELOG_ICDCFSs].* ,
    [ELOG_StuffingPoints1].[Description] AS ELOG_StuffingPoints1_Description 
  FROM [ELOG_ICDCFSs] 
  LEFT OUTER JOIN [ELOG_StuffingPoints] AS [ELOG_StuffingPoints1]
    ON [ELOG_ICDCFSs].[StuffingPointID] = [ELOG_StuffingPoints1].[StuffingPointID]
  WHERE
  [ELOG_ICDCFSs].[ICDCFSID] = @ICDCFSID
GO

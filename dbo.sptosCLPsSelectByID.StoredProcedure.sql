USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPsSelectByID]
  @ProjectID NVarChar(6),
  @CLPID Int 
  AS
  SELECT
		[TOS_CLPs].[ProjectID] ,
		[TOS_CLPs].[CLPID] ,
		[TOS_CLPs].[Description] ,
		[TOS_CLPs].[Sequence] ,
		[TOS_CLPs].[DisplayType] ,
		[TOS_CLPs].[engTaskID] ,
		[TOS_CLPs].[ordTaskID] ,
		[TOS_CLPs].[desTaskID] ,
		[IDM_Projects1].[Description] AS IDM_Projects1_Description,
		[TOS_Tasks2].[Description] AS TOS_Tasks2_Description,
		[TOS_Tasks3].[Description] AS TOS_Tasks3_Description,
		[TOS_Tasks4].[Description] AS TOS_Tasks4_Description 
  FROM [TOS_CLPs] 
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [TOS_CLPs].[ProjectID] = [IDM_Projects1].[ProjectID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks2].[ProjectID]
    AND [TOS_CLPs].[engTaskID] = [TOS_Tasks2].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks3]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks3].[ProjectID]
    AND [TOS_CLPs].[ordTaskID] = [TOS_Tasks3].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks4]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks4].[ProjectID]
    AND [TOS_CLPs].[desTaskID] = [TOS_Tasks4].[TaskID]
  WHERE
  [TOS_CLPs].[ProjectID] = @ProjectID
  AND [TOS_CLPs].[CLPID] = @CLPID
GO

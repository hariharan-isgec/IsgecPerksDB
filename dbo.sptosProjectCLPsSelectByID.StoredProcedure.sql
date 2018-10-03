USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosProjectCLPsSelectByID]
  @LoginID NVarChar(8),
  @ProjectID NVarChar(6),
  @CLPID Int 
  AS
  SELECT
		[TOS_CLPs].[ProjectID] ,
		[TOS_CLPs].[CLPID] ,
		[TOS_CLPs].[Description] ,
		[TOS_CLPs].[Quantity] ,
		[TOS_CLPs].[Sequence] ,
		[TOS_CLPs].[DisplayType] ,
		[TOS_CLPs].[engTaskID] ,
		[TOS_CLPs].[ordTaskID] ,
		[TOS_CLPs].[desTaskID] ,
		[TOS_CLPs].[ereTaskID] ,
		[TOS_CLPs].[ioTaskID] ,
		[TOS_CLPs].[recTaskID] ,
		[TOS_CLPs].[ad1TaskID] ,
		[TOS_CLPs].[ad2TaskID] ,
		[TOS_CLPs].[ad3TaskID] ,
		[TOS_CLPs].[ad4TaskID] ,
		[TOS_CLPs].[Active] ,
		[TOS_Projects1].[Description] AS TOS_Projects1_Description,
		[TOS_Tasks2].[Description] AS TOS_Tasks2_Description,
		[TOS_Tasks3].[Description] AS TOS_Tasks3_Description,
		[TOS_Tasks4].[Description] AS TOS_Tasks4_Description,
		[TOS_Tasks5].[Description] AS TOS_Tasks5_Description,
		[TOS_Tasks8].[Description] AS TOS_Tasks8_Description,
		[TOS_Tasks9].[Description] AS TOS_Tasks9_Description,
		[TOS_Tasks10].[Description] AS TOS_Tasks10_Description,
		[TOS_Tasks11].[Description] AS TOS_Tasks11_Description,
		[TOS_Tasks6].[Description] AS TOS_Tasks6_Description,
		[TOS_Tasks7].[Description] AS TOS_Tasks7_Description 
  FROM [TOS_CLPs] 
  INNER JOIN [TOS_Projects] AS [TOS_Projects1]
    ON [TOS_CLPs].[ProjectID] = [TOS_Projects1].[ProjectID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks2]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks2].[ProjectID]
    AND [TOS_CLPs].[ereTaskID] = [TOS_Tasks2].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks3]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks3].[ProjectID]
    AND [TOS_CLPs].[desTaskID] = [TOS_Tasks3].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks4]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks4].[ProjectID]
    AND [TOS_CLPs].[engTaskID] = [TOS_Tasks4].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks5]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks5].[ProjectID]
    AND [TOS_CLPs].[ordTaskID] = [TOS_Tasks5].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks8]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks8].[ProjectID]
    AND [TOS_CLPs].[ad1TaskID] = [TOS_Tasks8].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks9]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks9].[ProjectID]
    AND [TOS_CLPs].[ad2TaskID] = [TOS_Tasks9].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks10]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks10].[ProjectID]
    AND [TOS_CLPs].[ad3TaskID] = [TOS_Tasks10].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks11]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks11].[ProjectID]
    AND [TOS_CLPs].[ad4TaskID] = [TOS_Tasks11].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks6]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks6].[ProjectID]
    AND [TOS_CLPs].[ioTaskID] = [TOS_Tasks6].[TaskID]
  LEFT OUTER JOIN [TOS_Tasks] AS [TOS_Tasks7]
    ON [TOS_CLPs].[ProjectID] = [TOS_Tasks7].[ProjectID]
    AND [TOS_CLPs].[recTaskID] = [TOS_Tasks7].[TaskID]
  WHERE
  [TOS_CLPs].[ProjectID] = @ProjectID
  AND [TOS_CLPs].[CLPID] = @CLPID
GO

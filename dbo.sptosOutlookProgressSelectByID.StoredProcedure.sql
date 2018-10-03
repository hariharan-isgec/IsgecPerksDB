USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOutlookProgressSelectByID]
  @LoginID NVarChar(8),
  @ProjectID NVarChar(6),
  @ProgressID Int,
  @CLPID Int 
  AS
  SELECT
		[TOS_CLPDataDetails].[ProjectID] ,
		[TOS_CLPDataDetails].[ProgressID] ,
		[TOS_CLPDataDetails].[CLPID] ,
		[TOS_CLPDataDetails].[Description] ,
		[TOS_CLPDataDetails].[Quantity] ,
		[TOS_CLPDataDetails].[Sequence] ,
		[TOS_CLPDataDetails].[DisplayType] ,
		[TOS_CLPDataDetails].[engEndtDefined] ,
		[TOS_CLPDataDetails].[engEndtActual] ,
		[TOS_CLPDataDetails].[engdelayDays] ,
		[TOS_CLPDataDetails].[engdelayStatus] ,
		[TOS_CLPDataDetails].[ordEndtDefined] ,
		[TOS_CLPDataDetails].[ordEndtActual] ,
		[TOS_CLPDataDetails].[orddelayDays] ,
		[TOS_CLPDataDetails].[orddelayStatus] ,
		[TOS_CLPDataDetails].[desEndtDefined] ,
		[TOS_CLPDataDetails].[desEndtActual] ,
		[TOS_CLPDataDetails].[desdelayDays] ,
		[TOS_CLPDataDetails].[desdelayStatus] ,
		[TOS_CLPDataDetails].[ereEndtDefined] ,
		[TOS_CLPDataDetails].[ereEndtActual] ,
		[TOS_CLPDataDetails].[eredelayDays] ,
		[TOS_CLPDataDetails].[eredelayStatus] ,
		[TOS_CLPDataDetails].[ioEndtDefined] ,
		[TOS_CLPDataDetails].[ioEndtActual] ,
		[TOS_CLPDataDetails].[iodelayDays] ,
		[TOS_CLPDataDetails].[iodelayStatus] ,
		[TOS_CLPDataDetails].[recEndtDefined] ,
		[TOS_CLPDataDetails].[recEndtActual] ,
		[TOS_CLPDataDetails].[recdelayDays] ,
		[TOS_CLPDataDetails].[recdelayStatus] ,
		[TOS_CLPDataDetails].[ad1EndtDefined] ,
		[TOS_CLPDataDetails].[ad1EndtActual] ,
		[TOS_CLPDataDetails].[ad1delayDays] ,
		[TOS_CLPDataDetails].[ad1delayStatus] ,
		[TOS_CLPDataDetails].[ad2EndtDefined] ,
		[TOS_CLPDataDetails].[ad2EndtActual] ,
		[TOS_CLPDataDetails].[ad2delayDays] ,
		[TOS_CLPDataDetails].[ad2delayStatus] ,
		[TOS_CLPDataDetails].[ad3EndtDefined] ,
		[TOS_CLPDataDetails].[ad3EndtActual] ,
		[TOS_CLPDataDetails].[ad3delayDays] ,
		[TOS_CLPDataDetails].[ad3delayStatus] ,
		[TOS_CLPDataDetails].[ad4EndtDefined] ,
		[TOS_CLPDataDetails].[ad4EndtActual] ,
		[TOS_CLPDataDetails].[ad4delayDays] ,
		[TOS_CLPDataDetails].[ad4delayStatus] ,
		[TOS_CLPData1].[Description] AS TOS_CLPData1_Description,
		[TOS_CLPs2].[CLPID] AS TOS_CLPs2_CLPID,
		[TOS_Projects3].[Description] AS TOS_Projects3_Description 
  FROM [TOS_CLPDataDetails] 
  INNER JOIN [TOS_CLPData] AS [TOS_CLPData1]
    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_CLPData1].[ProjectID]
    AND [TOS_CLPDataDetails].[ProgressID] = [TOS_CLPData1].[ProgressID]
  INNER JOIN [TOS_CLPs] AS [TOS_CLPs2]
    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_CLPs2].[ProjectID]
    AND [TOS_CLPDataDetails].[CLPID] = [TOS_CLPs2].[CLPID]
  INNER JOIN [TOS_Projects] AS [TOS_Projects3]
    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_Projects3].[ProjectID]
  WHERE
  [TOS_CLPDataDetails].[ProjectID] = @ProjectID
  AND [TOS_CLPDataDetails].[ProgressID] = @ProgressID
  AND [TOS_CLPDataDetails].[CLPID] = @CLPID
GO

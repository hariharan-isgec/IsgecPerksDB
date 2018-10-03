USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPDataDetailsSelectByID]
  @ProjectID NVarChar(6),
  @ProgressID Int,
  @CLPID Int 
  AS
  SELECT
		[TOS_CLPDataDetails].[ProjectID] ,
		[TOS_CLPDataDetails].[ProgressID] ,
		[TOS_CLPDataDetails].[CLPID] ,
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
		[TOS_CLPDataDetails].[engRemarks] ,
		[TOS_CLPDataDetails].[ordRemarks] ,
		[TOS_CLPDataDetails].[desRemarks] ,
		[TOS_CLPDataDetails].[momBy] ,
		[TOS_CLPDataDetails].[momOn] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description,
		[TOS_CLPData3].[Description] AS TOS_CLPData3_Description,
		[TOS_CLPs4].[Description] AS TOS_CLPs4_Description 
  FROM [TOS_CLPDataDetails] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_CLPDataDetails].[momBy] = [aspnet_Users1].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [TOS_CLPDataDetails].[ProjectID] = [IDM_Projects2].[ProjectID]
  INNER JOIN [TOS_CLPData] AS [TOS_CLPData3]
    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_CLPData3].[ProjectID]
    AND [TOS_CLPDataDetails].[ProgressID] = [TOS_CLPData3].[ProgressID]
  INNER JOIN [TOS_CLPs] AS [TOS_CLPs4]
    ON [TOS_CLPDataDetails].[ProjectID] = [TOS_CLPs4].[ProjectID]
    AND [TOS_CLPDataDetails].[CLPID] = [TOS_CLPs4].[CLPID]
  WHERE
  [TOS_CLPDataDetails].[ProjectID] = @ProjectID
  AND [TOS_CLPDataDetails].[ProgressID] = @ProgressID
  AND [TOS_CLPDataDetails].[CLPID] = @CLPID
GO

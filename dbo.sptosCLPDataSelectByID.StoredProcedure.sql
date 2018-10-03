USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPDataSelectByID]
  @ProjectID NVarChar(6),
  @ProgressID Int 
  AS
  SELECT
		[TOS_CLPData].[ProjectID] ,
		[TOS_CLPData].[ProgressID] ,
		[TOS_CLPData].[Description] ,
		[TOS_CLPData].[AsOn] ,
		[TOS_CLPData].[CreatedBy] ,
		[TOS_CLPData].[CreatedOn] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[IDM_Projects2].[Description] AS IDM_Projects2_Description 
  FROM [TOS_CLPData] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_CLPData].[CreatedBy] = [aspnet_Users1].[LoginID]
  INNER JOIN [IDM_Projects] AS [IDM_Projects2]
    ON [TOS_CLPData].[ProjectID] = [IDM_Projects2].[ProjectID]
  WHERE
  [TOS_CLPData].[ProjectID] = @ProjectID
  AND [TOS_CLPData].[ProgressID] = @ProgressID
GO

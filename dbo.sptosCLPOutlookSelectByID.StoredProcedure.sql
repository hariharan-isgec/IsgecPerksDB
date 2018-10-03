USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPOutlookSelectByID]
	@LoginID Nvarchar(8), 
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
		[TOS_CLPData].[Active] ,
		[TOS_CLPData].[DueByDays] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[TOS_Projects2].[Description] AS TOS_Projects2_Description 
  FROM [TOS_CLPData] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_CLPData].[CreatedBy] = [aspnet_Users1].[LoginID]
  INNER JOIN [TOS_Projects] AS [TOS_Projects2]
    ON [TOS_CLPData].[ProjectID] = [TOS_Projects2].[ProjectID]
  WHERE
  [TOS_CLPData].[ProjectID] = @ProjectID
  AND [TOS_CLPData].[ProgressID] = @ProgressID
GO

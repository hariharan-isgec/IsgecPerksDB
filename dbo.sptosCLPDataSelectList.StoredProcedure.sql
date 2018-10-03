USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPDataSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [TOS_CLPData].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TOS_CLPData].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'ProgressID' THEN [TOS_CLPData].[ProgressID] END,
     CASE @OrderBy WHEN 'ProgressID DESC' THEN [TOS_CLPData].[ProgressID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TOS_CLPData].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TOS_CLPData].[Description] END DESC,
     CASE @OrderBy WHEN 'AsOn' THEN [TOS_CLPData].[AsOn] END,
     CASE @OrderBy WHEN 'AsOn DESC' THEN [TOS_CLPData].[AsOn] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [TOS_CLPData].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [TOS_CLPData].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [TOS_CLPData].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [TOS_CLPData].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

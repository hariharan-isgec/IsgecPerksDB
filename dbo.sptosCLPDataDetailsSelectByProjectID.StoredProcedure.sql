USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPDataDetailsSelectByProjectID]
  @ProjectID NVarChar(6),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
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
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [TOS_CLPDataDetails].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TOS_CLPDataDetails].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'ProgressID' THEN [TOS_CLPDataDetails].[ProgressID] END,
     CASE @OrderBy WHEN 'ProgressID DESC' THEN [TOS_CLPDataDetails].[ProgressID] END DESC,
     CASE @OrderBy WHEN 'CLPID' THEN [TOS_CLPDataDetails].[CLPID] END,
     CASE @OrderBy WHEN 'CLPID DESC' THEN [TOS_CLPDataDetails].[CLPID] END DESC,
     CASE @OrderBy WHEN 'engEndtDefined' THEN [TOS_CLPDataDetails].[engEndtDefined] END,
     CASE @OrderBy WHEN 'engEndtDefined DESC' THEN [TOS_CLPDataDetails].[engEndtDefined] END DESC,
     CASE @OrderBy WHEN 'engEndtActual' THEN [TOS_CLPDataDetails].[engEndtActual] END,
     CASE @OrderBy WHEN 'engEndtActual DESC' THEN [TOS_CLPDataDetails].[engEndtActual] END DESC,
     CASE @OrderBy WHEN 'engdelayDays' THEN [TOS_CLPDataDetails].[engdelayDays] END,
     CASE @OrderBy WHEN 'engdelayDays DESC' THEN [TOS_CLPDataDetails].[engdelayDays] END DESC,
     CASE @OrderBy WHEN 'engdelayStatus' THEN [TOS_CLPDataDetails].[engdelayStatus] END,
     CASE @OrderBy WHEN 'engdelayStatus DESC' THEN [TOS_CLPDataDetails].[engdelayStatus] END DESC,
     CASE @OrderBy WHEN 'ordEndtDefined' THEN [TOS_CLPDataDetails].[ordEndtDefined] END,
     CASE @OrderBy WHEN 'ordEndtDefined DESC' THEN [TOS_CLPDataDetails].[ordEndtDefined] END DESC,
     CASE @OrderBy WHEN 'ordEndtActual' THEN [TOS_CLPDataDetails].[ordEndtActual] END,
     CASE @OrderBy WHEN 'ordEndtActual DESC' THEN [TOS_CLPDataDetails].[ordEndtActual] END DESC,
     CASE @OrderBy WHEN 'orddelayDays' THEN [TOS_CLPDataDetails].[orddelayDays] END,
     CASE @OrderBy WHEN 'orddelayDays DESC' THEN [TOS_CLPDataDetails].[orddelayDays] END DESC,
     CASE @OrderBy WHEN 'orddelayStatus' THEN [TOS_CLPDataDetails].[orddelayStatus] END,
     CASE @OrderBy WHEN 'orddelayStatus DESC' THEN [TOS_CLPDataDetails].[orddelayStatus] END DESC,
     CASE @OrderBy WHEN 'desEndtDefined' THEN [TOS_CLPDataDetails].[desEndtDefined] END,
     CASE @OrderBy WHEN 'desEndtDefined DESC' THEN [TOS_CLPDataDetails].[desEndtDefined] END DESC,
     CASE @OrderBy WHEN 'desEndtActual' THEN [TOS_CLPDataDetails].[desEndtActual] END,
     CASE @OrderBy WHEN 'desEndtActual DESC' THEN [TOS_CLPDataDetails].[desEndtActual] END DESC,
     CASE @OrderBy WHEN 'desdelayDays' THEN [TOS_CLPDataDetails].[desdelayDays] END,
     CASE @OrderBy WHEN 'desdelayDays DESC' THEN [TOS_CLPDataDetails].[desdelayDays] END DESC,
     CASE @OrderBy WHEN 'desdelayStatus' THEN [TOS_CLPDataDetails].[desdelayStatus] END,
     CASE @OrderBy WHEN 'desdelayStatus DESC' THEN [TOS_CLPDataDetails].[desdelayStatus] END DESC,
     CASE @OrderBy WHEN 'engRemarks' THEN [TOS_CLPDataDetails].[engRemarks] END,
     CASE @OrderBy WHEN 'engRemarks DESC' THEN [TOS_CLPDataDetails].[engRemarks] END DESC,
     CASE @OrderBy WHEN 'ordRemarks' THEN [TOS_CLPDataDetails].[ordRemarks] END,
     CASE @OrderBy WHEN 'ordRemarks DESC' THEN [TOS_CLPDataDetails].[ordRemarks] END DESC,
     CASE @OrderBy WHEN 'desRemarks' THEN [TOS_CLPDataDetails].[desRemarks] END,
     CASE @OrderBy WHEN 'desRemarks DESC' THEN [TOS_CLPDataDetails].[desRemarks] END DESC,
     CASE @OrderBy WHEN 'momBy' THEN [TOS_CLPDataDetails].[momBy] END,
     CASE @OrderBy WHEN 'momBy DESC' THEN [TOS_CLPDataDetails].[momBy] END DESC,
     CASE @OrderBy WHEN 'momOn' THEN [TOS_CLPDataDetails].[momOn] END,
     CASE @OrderBy WHEN 'momOn DESC' THEN [TOS_CLPDataDetails].[momOn] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects2_Description' THEN [IDM_Projects2].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects2_Description DESC' THEN [IDM_Projects2].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_CLPData3_Description' THEN [TOS_CLPData3].[Description] END,
     CASE @OrderBy WHEN 'TOS_CLPData3_Description DESC' THEN [TOS_CLPData3].[Description] END DESC,
     CASE @OrderBy WHEN 'TOS_CLPs4_Description' THEN [TOS_CLPs4].[Description] END,
     CASE @OrderBy WHEN 'TOS_CLPs4_Description DESC' THEN [TOS_CLPs4].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

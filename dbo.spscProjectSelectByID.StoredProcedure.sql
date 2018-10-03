USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscProjectSelectByID]
  @LoginID NVarChar(8),
  @RequestID Int,
  @SerialNo Int 
  AS
  SELECT
    [SC_Project].* ,
    [IDM_Projects1].[Description] AS IDM_Projects1_Description,
    [IDM_WBS2].[Description] AS IDM_WBS2_Description,
    [SC_Request3].[RequestRefNo] AS SC_Request3_RequestRefNo 
  FROM [SC_Project] 
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [SC_Project].[ProjectID] = [IDM_Projects1].[ProjectID]
  LEFT OUTER JOIN [IDM_WBS] AS [IDM_WBS2]
    ON [SC_Project].[ElementID] = [IDM_WBS2].[WBSID]
  INNER JOIN [SC_Request] AS [SC_Request3]
    ON [SC_Project].[RequestID] = [SC_Request3].[RequestID]
  WHERE
  [SC_Project].[RequestID] = @RequestID
  AND [SC_Project].[SerialNo] = @SerialNo
GO

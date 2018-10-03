USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRequestStatesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QCM_RequestStates].[StateID] ,
		[QCM_RequestStates].[Description]  
  FROM [QCM_RequestStates] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StateID' THEN [QCM_RequestStates].[StateID] END,
     CASE @OrderBy WHEN 'StateID DESC' THEN [QCM_RequestStates].[StateID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [QCM_RequestStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [QCM_RequestStates].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

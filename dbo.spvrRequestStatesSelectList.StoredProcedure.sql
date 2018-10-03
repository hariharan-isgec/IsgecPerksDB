USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestStatesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[VR_RequestStates].[StatusID] ,
		[VR_RequestStates].[Description]  
  FROM [VR_RequestStates] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [VR_RequestStates].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [VR_RequestStates].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_RequestStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_RequestStates].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

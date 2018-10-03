USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormStatusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[PMS_FormStatus].[FormStatusID] ,
		[PMS_FormStatus].[Description]  
  FROM [PMS_FormStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'FormStatusID' THEN [PMS_FormStatus].[FormStatusID] END,
     CASE @OrderBy WHEN 'FormStatusID DESC' THEN [PMS_FormStatus].[FormStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PMS_FormStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PMS_FormStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

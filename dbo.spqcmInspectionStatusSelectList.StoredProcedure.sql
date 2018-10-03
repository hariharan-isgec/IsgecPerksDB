USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QCM_InspectionStatus].[InspectionStatusID] ,
		[QCM_InspectionStatus].[Description]  
  FROM [QCM_InspectionStatus] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'InspectionStatusID' THEN [QCM_InspectionStatus].[InspectionStatusID] END,
     CASE @OrderBy WHEN 'InspectionStatusID DESC' THEN [QCM_InspectionStatus].[InspectionStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [QCM_InspectionStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [QCM_InspectionStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

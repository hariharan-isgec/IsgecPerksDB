USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionStagesSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QCM_InspectionStages].[InspectionStageID] ,
		[QCM_InspectionStages].[Description]  
  FROM [QCM_InspectionStages] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'InspectionStageID' THEN [QCM_InspectionStages].[InspectionStageID] END,
     CASE @OrderBy WHEN 'InspectionStageID DESC' THEN [QCM_InspectionStages].[InspectionStageID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [QCM_InspectionStages].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [QCM_InspectionStages].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

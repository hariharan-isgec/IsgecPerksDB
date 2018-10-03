USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionFilesSelectByRequestID]
  @RequestID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QCM_InspectionFiles].[RequestID] ,
		[QCM_InspectionFiles].[InspectionID] ,
		[QCM_InspectionFiles].[SerialNo] ,
		[QCM_InspectionFiles].[FileName] ,
		[QCM_InspectionFiles].[DiskFIleName]  
  FROM [QCM_InspectionFiles] 
  INNER JOIN [QCM_Inspections] AS [QCM_Inspections1]
    ON [QCM_InspectionFiles].[RequestID] = [QCM_Inspections1].[RequestID]
    AND [QCM_InspectionFiles].[InspectionID] = [QCM_Inspections1].[InspectionID]
  WHERE
  [QCM_InspectionFiles].[RequestID] = @RequestID
  ORDER BY
     CASE @OrderBy WHEN 'RequestID' THEN [QCM_InspectionFiles].[RequestID] END,
     CASE @OrderBy WHEN 'RequestID DESC' THEN [QCM_InspectionFiles].[RequestID] END DESC,
     CASE @OrderBy WHEN 'InspectionID' THEN [QCM_InspectionFiles].[InspectionID] END,
     CASE @OrderBy WHEN 'InspectionID DESC' THEN [QCM_InspectionFiles].[InspectionID] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [QCM_InspectionFiles].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [QCM_InspectionFiles].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'FileName' THEN [QCM_InspectionFiles].[FileName] END,
     CASE @OrderBy WHEN 'FileName DESC' THEN [QCM_InspectionFiles].[FileName] END DESC,
     CASE @OrderBy WHEN 'DiskFIleName' THEN [QCM_InspectionFiles].[DiskFIleName] END,
     CASE @OrderBy WHEN 'DiskFIleName DESC' THEN [QCM_InspectionFiles].[DiskFIleName] END DESC 
  SET @RecordCount = @@RowCount
GO

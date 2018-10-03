USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionFilesSelectByID]
  @LoginID NVarChar(8),
  @RequestID Int,
  @InspectionID Int,
  @SerialNo Int 
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
  AND [QCM_InspectionFiles].[InspectionID] = @InspectionID
  AND [QCM_InspectionFiles].[SerialNo] = @SerialNo
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRequestFilesSelectByID]
  @LoginID NVarChar(8),
  @RequestID Int,
  @SerialNo Int 
  AS
  SELECT
		[QCM_RequestFiles].[RequestID] ,
		[QCM_RequestFiles].[SerialNo] ,
		[QCM_RequestFiles].[FileName] ,
		[QCM_RequestFiles].[DiskFIleName] ,
		[QCM_Requests1].[Description] AS QCM_Requests1_Description 
  FROM [QCM_RequestFiles] 
  INNER JOIN [QCM_Requests] AS [QCM_Requests1]
    ON [QCM_RequestFiles].[RequestID] = [QCM_Requests1].[RequestID]
  WHERE
  [QCM_RequestFiles].[RequestID] = @RequestID
  AND [QCM_RequestFiles].[SerialNo] = @SerialNo
GO

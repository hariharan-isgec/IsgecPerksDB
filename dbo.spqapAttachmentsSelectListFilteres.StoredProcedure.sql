USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapAttachmentsSelectListFilteres]
  @Filter_RequestNo Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RequestNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestNo'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QAP_Attachments].[RequestNo]'
  SET @LGSQL = @LGSQL + ', [QAP_Attachments].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [QAP_Attachments] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [QAP_AttachmentStates] AS [QAP_AttachmentStates1]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Attachments].[StatusID] = [QAP_AttachmentStates1].[StatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [QAP_Requests] AS [QAP_Requests1]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Attachments].[RequestNo] = [QAP_Requests1].[RequestNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_RequestNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [QAP_Attachments].[RequestNo] = ' + STR(@Filter_RequestNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestNo' THEN '[QAP_Attachments].[RequestNo]'
                        WHEN 'RequestNo DESC' THEN '[QAP_Attachments].[RequestNo] DESC'
                        WHEN 'SerialNo' THEN '[QAP_Attachments].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[QAP_Attachments].[SerialNo] DESC'
                        WHEN 'Description' THEN '[QAP_Attachments].[Description]'
                        WHEN 'Description DESC' THEN '[QAP_Attachments].[Description] DESC'
                        WHEN 'FileName' THEN '[QAP_Attachments].[FileName]'
                        WHEN 'FileName DESC' THEN '[QAP_Attachments].[FileName] DESC'
                        WHEN 'DiskFile' THEN '[QAP_Attachments].[DiskFile]'
                        WHEN 'DiskFile DESC' THEN '[QAP_Attachments].[DiskFile] DESC'
                        WHEN 'StatusID' THEN '[QAP_Attachments].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[QAP_Attachments].[StatusID] DESC'
                        WHEN 'QAP_AttachmentStates1_Description' THEN '[QAP_AttachmentStates1].[Description]'
                        WHEN 'QAP_AttachmentStates1_Description DESC' THEN '[QAP_AttachmentStates1].[Description] DESC'
                        WHEN 'QAP_Requests1_QAPNo' THEN '[QAP_Requests1].[QAPNo]'
                        WHEN 'QAP_Requests1_QAPNo DESC' THEN '[QAP_Requests1].[QAPNo] DESC'
                        ELSE '[QAP_Attachments].[RequestNo],[QAP_Attachments].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QAP_Attachments].[RequestNo] ,
		[QAP_Attachments].[SerialNo] ,
		[QAP_Attachments].[Description] ,
		[QAP_Attachments].[FileName] ,
		[QAP_Attachments].[DiskFile] ,
		[QAP_Attachments].[StatusID] ,
		[QAP_AttachmentStates1].[Description] AS QAP_AttachmentStates1_Description,
		[QAP_Requests1].[QAPNo] AS QAP_Requests1_QAPNo 
  FROM [QAP_Attachments] 
    	INNER JOIN #PageIndex
          ON [QAP_Attachments].[RequestNo] = #PageIndex.RequestNo
          AND [QAP_Attachments].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [QAP_AttachmentStates] AS [QAP_AttachmentStates1]
    ON [QAP_Attachments].[StatusID] = [QAP_AttachmentStates1].[StatusID]
  INNER JOIN [QAP_Requests] AS [QAP_Requests1]
    ON [QAP_Attachments].[RequestNo] = [QAP_Requests1].[RequestNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestAttachmentsSelectListFilteres]
  @Filter_ApplID Int,
  @Filter_RequestID Int,
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
 ,ApplID Int NOT NULL
 ,RequestID Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ApplID'
  SET @LGSQL = @LGSQL + ', RequestID'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ERP_RequestAttachments].[ApplID]'
  SET @LGSQL = @LGSQL + ', [ERP_RequestAttachments].[RequestID]'
  SET @LGSQL = @LGSQL + ', [ERP_RequestAttachments].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [ERP_RequestAttachments] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [ERP_Applications] AS [ERP_Applications1]'
  SET @LGSQL = @LGSQL + '    ON [ERP_RequestAttachments].[ApplID] = [ERP_Applications1].[ApplID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ERP_ChaneRequest] AS [ERP_ChaneRequest2]'
  SET @LGSQL = @LGSQL + '    ON [ERP_RequestAttachments].[ApplID] = [ERP_ChaneRequest2].[ApplID]'
  SET @LGSQL = @LGSQL + '    AND [ERP_RequestAttachments].[RequestID] = [ERP_ChaneRequest2].[RequestID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ApplID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ERP_RequestAttachments].[ApplID] = ' + STR(@Filter_ApplID)
  IF (@Filter_RequestID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ERP_RequestAttachments].[RequestID] = ' + STR(@Filter_RequestID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ApplID' THEN '[ERP_RequestAttachments].[ApplID]'
                        WHEN 'ApplID DESC' THEN '[ERP_RequestAttachments].[ApplID] DESC'
                        WHEN 'RequestID' THEN '[ERP_RequestAttachments].[RequestID]'
                        WHEN 'RequestID DESC' THEN '[ERP_RequestAttachments].[RequestID] DESC'
                        WHEN 'SerialNo' THEN '[ERP_RequestAttachments].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[ERP_RequestAttachments].[SerialNo] DESC'
                        WHEN 'Description' THEN '[ERP_RequestAttachments].[Description]'
                        WHEN 'Description DESC' THEN '[ERP_RequestAttachments].[Description] DESC'
                        WHEN 'FileName' THEN '[ERP_RequestAttachments].[FileName]'
                        WHEN 'FileName DESC' THEN '[ERP_RequestAttachments].[FileName] DESC'
                        WHEN 'DiskFile' THEN '[ERP_RequestAttachments].[DiskFile]'
                        WHEN 'DiskFile DESC' THEN '[ERP_RequestAttachments].[DiskFile] DESC'
                        WHEN 'ERP_Applications1_ApplName' THEN '[ERP_Applications1].[ApplName]'
                        WHEN 'ERP_Applications1_ApplName DESC' THEN '[ERP_Applications1].[ApplName] DESC'
                        WHEN 'ERP_ChaneRequest2_ChangeSubject' THEN '[ERP_ChaneRequest2].[ChangeSubject]'
                        WHEN 'ERP_ChaneRequest2_ChangeSubject DESC' THEN '[ERP_ChaneRequest2].[ChangeSubject] DESC'
                        ELSE '[ERP_RequestAttachments].[ApplID],[ERP_RequestAttachments].[RequestID],[ERP_RequestAttachments].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ERP_RequestAttachments].[ApplID] ,
		[ERP_RequestAttachments].[RequestID] ,
		[ERP_RequestAttachments].[SerialNo] ,
		[ERP_RequestAttachments].[Description] ,
		[ERP_RequestAttachments].[FileName] ,
		[ERP_RequestAttachments].[DiskFile] ,
		[ERP_Applications1].[ApplName] AS ERP_Applications1_ApplName,
		[ERP_ChaneRequest2].[ChangeSubject] AS ERP_ChaneRequest2_ChangeSubject 
  FROM [ERP_RequestAttachments] 
    	INNER JOIN #PageIndex
          ON [ERP_RequestAttachments].[ApplID] = #PageIndex.ApplID
          AND [ERP_RequestAttachments].[RequestID] = #PageIndex.RequestID
          AND [ERP_RequestAttachments].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [ERP_Applications] AS [ERP_Applications1]
    ON [ERP_RequestAttachments].[ApplID] = [ERP_Applications1].[ApplID]
  INNER JOIN [ERP_ChaneRequest] AS [ERP_ChaneRequest2]
    ON [ERP_RequestAttachments].[ApplID] = [ERP_ChaneRequest2].[ApplID]
    AND [ERP_RequestAttachments].[RequestID] = [ERP_ChaneRequest2].[RequestID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrExecutionAttachmentsSelectListFilteres]
  @Filter_SRNNo Int,
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
 ,SRNNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SRNNo'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_ExecutionAttachments].[SRNNo]'
  SET @LGSQL = @LGSQL + ', [VR_ExecutionAttachments].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [VR_ExecutionAttachments] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [VR_RequestExecution] AS [VR_RequestExecution1]'
  SET @LGSQL = @LGSQL + '    ON [VR_ExecutionAttachments].[SRNNo] = [VR_RequestExecution1].[SRNNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SRNNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [VR_ExecutionAttachments].[SRNNo] = ' + STR(@Filter_SRNNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SRNNo' THEN '[VR_ExecutionAttachments].[SRNNo]'
                        WHEN 'SRNNo DESC' THEN '[VR_ExecutionAttachments].[SRNNo] DESC'
                        WHEN 'SerialNo' THEN '[VR_ExecutionAttachments].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[VR_ExecutionAttachments].[SerialNo] DESC'
                        WHEN 'Description' THEN '[VR_ExecutionAttachments].[Description]'
                        WHEN 'Description DESC' THEN '[VR_ExecutionAttachments].[Description] DESC'
                        WHEN 'FileName' THEN '[VR_ExecutionAttachments].[FileName]'
                        WHEN 'FileName DESC' THEN '[VR_ExecutionAttachments].[FileName] DESC'
                        WHEN 'DiskFile' THEN '[VR_ExecutionAttachments].[DiskFile]'
                        WHEN 'DiskFile DESC' THEN '[VR_ExecutionAttachments].[DiskFile] DESC'
                        WHEN 'VR_RequestExecution1_ExecutionDescription' THEN '[VR_RequestExecution1].[ExecutionDescription]'
                        WHEN 'VR_RequestExecution1_ExecutionDescription DESC' THEN '[VR_RequestExecution1].[ExecutionDescription] DESC'
                        ELSE '[VR_ExecutionAttachments].[SRNNo],[VR_ExecutionAttachments].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[VR_ExecutionAttachments].[SRNNo] ,
		[VR_ExecutionAttachments].[SerialNo] ,
		[VR_ExecutionAttachments].[Description] ,
		[VR_ExecutionAttachments].[FileName] ,
		[VR_ExecutionAttachments].[DiskFile] ,
		[VR_RequestExecution1].[ExecutionDescription] AS VR_RequestExecution1_ExecutionDescription 
  FROM [VR_ExecutionAttachments] 
    	INNER JOIN #PageIndex
          ON [VR_ExecutionAttachments].[SRNNo] = #PageIndex.SRNNo
          AND [VR_ExecutionAttachments].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [VR_RequestExecution] AS [VR_RequestExecution1]
    ON [VR_ExecutionAttachments].[SRNNo] = [VR_RequestExecution1].[SRNNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

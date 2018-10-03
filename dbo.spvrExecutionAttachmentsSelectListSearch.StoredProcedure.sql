USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrExecutionAttachmentsSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SRNNo Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SRNNo, SerialNo)
  SELECT [VR_ExecutionAttachments].[SRNNo], [VR_ExecutionAttachments].[SerialNo] FROM [VR_ExecutionAttachments]
  INNER JOIN [VR_RequestExecution] AS [VR_RequestExecution1]
    ON [VR_ExecutionAttachments].[SRNNo] = [VR_RequestExecution1].[SRNNo]
 WHERE  
   ( 
         STR(ISNULL([VR_ExecutionAttachments].[SRNNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([VR_ExecutionAttachments].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_ExecutionAttachments].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_ExecutionAttachments].[FileName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_ExecutionAttachments].[DiskFile],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SRNNo' THEN [VR_ExecutionAttachments].[SRNNo] END,
     CASE @OrderBy WHEN 'SRNNo DESC' THEN [VR_ExecutionAttachments].[SRNNo] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [VR_ExecutionAttachments].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [VR_ExecutionAttachments].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_ExecutionAttachments].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_ExecutionAttachments].[Description] END DESC,
     CASE @OrderBy WHEN 'FileName' THEN [VR_ExecutionAttachments].[FileName] END,
     CASE @OrderBy WHEN 'FileName DESC' THEN [VR_ExecutionAttachments].[FileName] END DESC,
     CASE @OrderBy WHEN 'DiskFile' THEN [VR_ExecutionAttachments].[DiskFile] END,
     CASE @OrderBy WHEN 'DiskFile DESC' THEN [VR_ExecutionAttachments].[DiskFile] END DESC,
     CASE @OrderBy WHEN 'VR_RequestExecution1_ExecutionDescription' THEN [VR_RequestExecution1].[ExecutionDescription] END,
     CASE @OrderBy WHEN 'VR_RequestExecution1_ExecutionDescription DESC' THEN [VR_RequestExecution1].[ExecutionDescription] END DESC 

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

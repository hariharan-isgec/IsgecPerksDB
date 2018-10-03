USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcm_LG_RequestFilesSelectListFilteresinXML]
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
 ,RequestID Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestID'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QCM_RequestFiles].[RequestID]'
  SET @LGSQL = @LGSQL + ', [QCM_RequestFiles].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [QCM_RequestFiles] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [QCM_Requests] AS [QCM_Requests1]'
  SET @LGSQL = @LGSQL + '    ON [QCM_RequestFiles].[RequestID] = [QCM_Requests1].[RequestID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_RequestID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QCM_RequestFiles].[RequestID] = ' + STR(@Filter_RequestID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestID' THEN '[QCM_RequestFiles].[RequestID]'
                        WHEN 'RequestID DESC' THEN '[QCM_RequestFiles].[RequestID] DESC'
                        WHEN 'SerialNo' THEN '[QCM_RequestFiles].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[QCM_RequestFiles].[SerialNo] DESC'
                        WHEN 'FileName' THEN '[QCM_RequestFiles].[FileName]'
                        WHEN 'FileName DESC' THEN '[QCM_RequestFiles].[FileName] DESC'
                        WHEN 'DiskFIleName' THEN '[QCM_RequestFiles].[DiskFIleName]'
                        WHEN 'DiskFIleName DESC' THEN '[QCM_RequestFiles].[DiskFIleName] DESC'
                        WHEN 'QCM_Requests1_Description' THEN '[QCM_Requests1].[Description]'
                        WHEN 'QCM_Requests1_Description DESC' THEN '[QCM_Requests1].[Description] DESC'
                        ELSE '[QCM_RequestFiles].[RequestID],[QCM_RequestFiles].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QCM_RequestFiles].[RequestID] ,
		[QCM_RequestFiles].[SerialNo] ,
		[QCM_RequestFiles].[FileName] ,
		[QCM_RequestFiles].[DiskFIleName] ,
		[QCM_Requests1].[Description] AS QCM_Requests1_Description 
  FROM [QCM_RequestFiles] 
    	INNER JOIN #PageIndex
          ON [QCM_RequestFiles].[RequestID] = #PageIndex.RequestID
          AND [QCM_RequestFiles].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [QCM_Requests] AS [QCM_Requests1]
    ON [QCM_RequestFiles].[RequestID] = [QCM_Requests1].[RequestID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID 
     FOR XML AUTO ,ELEMENTs, ROOT('Files')
  END
GO

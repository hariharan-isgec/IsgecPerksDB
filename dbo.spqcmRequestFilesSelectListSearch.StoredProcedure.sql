USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRequestFilesSelectListSearch]
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
 ,RequestID Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (RequestID, SerialNo)
  SELECT [QCM_RequestFiles].[RequestID], [QCM_RequestFiles].[SerialNo] FROM [QCM_RequestFiles]
  INNER JOIN [QCM_Requests] AS [QCM_Requests1]
    ON [QCM_RequestFiles].[RequestID] = [QCM_Requests1].[RequestID]
 WHERE  
   ( 
         STR(ISNULL([QCM_RequestFiles].[RequestID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([QCM_RequestFiles].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_RequestFiles].[FileName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_RequestFiles].[DiskFIleName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RequestID' THEN [QCM_RequestFiles].[RequestID] END,
     CASE @OrderBy WHEN 'RequestID DESC' THEN [QCM_RequestFiles].[RequestID] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [QCM_RequestFiles].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [QCM_RequestFiles].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'FileName' THEN [QCM_RequestFiles].[FileName] END,
     CASE @OrderBy WHEN 'FileName DESC' THEN [QCM_RequestFiles].[FileName] END DESC,
     CASE @OrderBy WHEN 'DiskFIleName' THEN [QCM_RequestFiles].[DiskFIleName] END,
     CASE @OrderBy WHEN 'DiskFIleName DESC' THEN [QCM_RequestFiles].[DiskFIleName] END DESC,
     CASE @OrderBy WHEN 'QCM_Requests1_Description' THEN [QCM_Requests1].[Description] END,
     CASE @OrderBy WHEN 'QCM_Requests1_Description DESC' THEN [QCM_Requests1].[Description] END DESC 

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
  END
GO

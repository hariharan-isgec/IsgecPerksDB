USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionFilesSelectListSearch]
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
 ,InspectionID Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (RequestID, InspectionID, SerialNo)
  SELECT [QCM_InspectionFiles].[RequestID], [QCM_InspectionFiles].[InspectionID], [QCM_InspectionFiles].[SerialNo] FROM [QCM_InspectionFiles]
  INNER JOIN [QCM_Inspections] AS [QCM_Inspections1]
    ON [QCM_InspectionFiles].[RequestID] = [QCM_Inspections1].[RequestID]
    AND [QCM_InspectionFiles].[InspectionID] = [QCM_Inspections1].[InspectionID]
 WHERE  
   ( 
         STR(ISNULL([QCM_InspectionFiles].[RequestID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([QCM_InspectionFiles].[InspectionID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([QCM_InspectionFiles].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_InspectionFiles].[FileName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_InspectionFiles].[DiskFIleName],'')) LIKE @KeyWord1
   ) 
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

  SELECT
		[QCM_InspectionFiles].[RequestID] ,
		[QCM_InspectionFiles].[InspectionID] ,
		[QCM_InspectionFiles].[SerialNo] ,
		[QCM_InspectionFiles].[FileName] ,
		[QCM_InspectionFiles].[DiskFIleName]  
  FROM [QCM_InspectionFiles] 
    	INNER JOIN #PageIndex
          ON [QCM_InspectionFiles].[RequestID] = #PageIndex.RequestID
          AND [QCM_InspectionFiles].[InspectionID] = #PageIndex.InspectionID
          AND [QCM_InspectionFiles].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [QCM_Inspections] AS [QCM_Inspections1]
    ON [QCM_InspectionFiles].[RequestID] = [QCM_Inspections1].[RequestID]
    AND [QCM_InspectionFiles].[InspectionID] = [QCM_Inspections1].[InspectionID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

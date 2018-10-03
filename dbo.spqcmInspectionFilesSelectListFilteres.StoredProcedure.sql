USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionFilesSelectListFilteres]
  @Filter_RequestID Int,
  @Filter_InspectionID Int,
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
 ,InspectionID Int NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestID'
  SET @LGSQL = @LGSQL + ', InspectionID'
  SET @LGSQL = @LGSQL + ', SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QCM_InspectionFiles].[RequestID]'
  SET @LGSQL = @LGSQL + ', [QCM_InspectionFiles].[InspectionID]'
  SET @LGSQL = @LGSQL + ', [QCM_InspectionFiles].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [QCM_InspectionFiles] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [QCM_Inspections] AS [QCM_Inspections1]'
  SET @LGSQL = @LGSQL + '    ON [QCM_InspectionFiles].[RequestID] = [QCM_Inspections1].[RequestID]'
  SET @LGSQL = @LGSQL + '    AND [QCM_InspectionFiles].[InspectionID] = [QCM_Inspections1].[InspectionID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_RequestID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QCM_InspectionFiles].[RequestID] = ' + STR(@Filter_RequestID)
  IF (@Filter_InspectionID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QCM_InspectionFiles].[InspectionID] = ' + STR(@Filter_InspectionID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestID' THEN '[QCM_InspectionFiles].[RequestID]'
                        WHEN 'RequestID DESC' THEN '[QCM_InspectionFiles].[RequestID] DESC'
                        WHEN 'InspectionID' THEN '[QCM_InspectionFiles].[InspectionID]'
                        WHEN 'InspectionID DESC' THEN '[QCM_InspectionFiles].[InspectionID] DESC'
                        WHEN 'SerialNo' THEN '[QCM_InspectionFiles].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[QCM_InspectionFiles].[SerialNo] DESC'
                        WHEN 'FileName' THEN '[QCM_InspectionFiles].[FileName]'
                        WHEN 'FileName DESC' THEN '[QCM_InspectionFiles].[FileName] DESC'
                        WHEN 'DiskFIleName' THEN '[QCM_InspectionFiles].[DiskFIleName]'
                        WHEN 'DiskFIleName DESC' THEN '[QCM_InspectionFiles].[DiskFIleName] DESC'
                        ELSE '[QCM_InspectionFiles].[RequestID],[QCM_InspectionFiles].[InspectionID],[QCM_InspectionFiles].[SerialNo]'
                    END
  EXEC (@LGSQL)

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

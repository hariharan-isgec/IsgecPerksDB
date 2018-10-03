USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionStatusSelectListSearch]
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
 ,InspectionStatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (InspectionStatusID)
  SELECT [QCM_InspectionStatus].[InspectionStatusID] FROM [QCM_InspectionStatus]
 WHERE  
   ( 
         STR(ISNULL([QCM_InspectionStatus].[InspectionStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_InspectionStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'InspectionStatusID' THEN [QCM_InspectionStatus].[InspectionStatusID] END,
     CASE @OrderBy WHEN 'InspectionStatusID DESC' THEN [QCM_InspectionStatus].[InspectionStatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [QCM_InspectionStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [QCM_InspectionStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[QCM_InspectionStatus].[InspectionStatusID] ,
		[QCM_InspectionStatus].[Description]  
  FROM [QCM_InspectionStatus] 
    	INNER JOIN #PageIndex
          ON [QCM_InspectionStatus].[InspectionStatusID] = #PageIndex.InspectionStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmInspectionStagesSelectListSearch]
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
 ,InspectionStageID Int NOT NULL
  )
  INSERT INTO #PageIndex (InspectionStageID)
  SELECT [QCM_InspectionStages].[InspectionStageID] FROM [QCM_InspectionStages]
 WHERE  
   ( 
         STR(ISNULL([QCM_InspectionStages].[InspectionStageID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QCM_InspectionStages].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'InspectionStageID' THEN [QCM_InspectionStages].[InspectionStageID] END,
     CASE @OrderBy WHEN 'InspectionStageID DESC' THEN [QCM_InspectionStages].[InspectionStageID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [QCM_InspectionStages].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [QCM_InspectionStages].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[QCM_InspectionStages].[InspectionStageID] ,
		[QCM_InspectionStages].[Description]  
  FROM [QCM_InspectionStages] 
    	INNER JOIN #PageIndex
          ON [QCM_InspectionStages].[InspectionStageID] = #PageIndex.InspectionStageID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

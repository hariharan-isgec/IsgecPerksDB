USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmQualificationsSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,QualificationID Int NOT NULL
  )
  INSERT INTO #PageIndex (QualificationID)
  SELECT [HRM_Qualifications].[QualificationID] FROM [HRM_Qualifications]
 WHERE  
   ( 
         STR(ISNULL([HRM_Qualifications].[QualificationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Qualifications].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'QualificationID' THEN [HRM_Qualifications].[QualificationID] END,
     CASE @orderBy WHEN 'QualificationID DESC' THEN [HRM_Qualifications].[QualificationID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_Qualifications].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_Qualifications].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_Qualifications].[QualificationID],
		[HRM_Qualifications].[Description] 
  FROM [HRM_Qualifications] 
    	INNER JOIN #PageIndex
          ON [HRM_Qualifications].[QualificationID] = #PageIndex.QualificationID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

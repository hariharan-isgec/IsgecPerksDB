USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectTypesSelectListSearch]
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
 ,ProjectTypeID NVarChar(10) NOT NULL
  )
  INSERT INTO #PageIndex (ProjectTypeID)
  SELECT [COST_ProjectTypes].[ProjectTypeID] FROM [COST_ProjectTypes]
 WHERE  
   ( 
         LOWER(ISNULL([COST_ProjectTypes].[ProjectTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_ProjectTypes].[ProjectTypeDescription],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectTypeID' THEN [COST_ProjectTypes].[ProjectTypeID] END,
     CASE @OrderBy WHEN 'ProjectTypeID DESC' THEN [COST_ProjectTypes].[ProjectTypeID] END DESC,
     CASE @OrderBy WHEN 'ProjectTypeDescription' THEN [COST_ProjectTypes].[ProjectTypeDescription] END,
     CASE @OrderBy WHEN 'ProjectTypeDescription DESC' THEN [COST_ProjectTypes].[ProjectTypeDescription] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [COST_ProjectTypes].*  
  FROM [COST_ProjectTypes] 
      INNER JOIN #PageIndex
          ON [COST_ProjectTypes].[ProjectTypeID] = #PageIndex.ProjectTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

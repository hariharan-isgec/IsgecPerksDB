USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDetailViewTypesSelectListSearch]
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
 ,DVTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (DVTypeID)
  SELECT [WF_DetailViewTypes].[DVTypeID] FROM [WF_DetailViewTypes]
 WHERE  
   ( 
         STR(ISNULL([WF_DetailViewTypes].[DVTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([WF_DetailViewTypes].[DVTypeDescription],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'DVTypeID' THEN [WF_DetailViewTypes].[DVTypeID] END,
     CASE @OrderBy WHEN 'DVTypeID DESC' THEN [WF_DetailViewTypes].[DVTypeID] END DESC,
     CASE @OrderBy WHEN 'DVTypeDescription' THEN [WF_DetailViewTypes].[DVTypeDescription] END,
     CASE @OrderBy WHEN 'DVTypeDescription DESC' THEN [WF_DetailViewTypes].[DVTypeDescription] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [WF_DetailViewTypes].*  
  FROM [WF_DetailViewTypes] 
      INNER JOIN #PageIndex
          ON [WF_DetailViewTypes].[DVTypeID] = #PageIndex.DVTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

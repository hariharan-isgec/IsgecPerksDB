USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfGraphTypesSelectListSearch]
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
 ,GraphTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (GraphTypeID)
  SELECT [WF_GraphTypes].[GraphTypeID] FROM [WF_GraphTypes]
 WHERE  
   ( 
         STR(ISNULL([WF_GraphTypes].[GraphTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([WF_GraphTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'GraphTypeID' THEN [WF_GraphTypes].[GraphTypeID] END,
     CASE @OrderBy WHEN 'GraphTypeID DESC' THEN [WF_GraphTypes].[GraphTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [WF_GraphTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [WF_GraphTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [WF_GraphTypes].*  
  FROM [WF_GraphTypes] 
      INNER JOIN #PageIndex
          ON [WF_GraphTypes].[GraphTypeID] = #PageIndex.GraphTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

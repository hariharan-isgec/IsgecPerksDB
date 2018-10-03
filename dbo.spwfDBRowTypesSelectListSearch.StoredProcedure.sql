USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowTypesSelectListSearch]
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
 ,RowTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (RowTypeID)
  SELECT [WF_DBRowTypes].[RowTypeID] FROM [WF_DBRowTypes]
 WHERE  
   ( 
         STR(ISNULL([WF_DBRowTypes].[RowTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([WF_DBRowTypes].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([WF_DBRowTypes].[cssClass],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RowTypeID' THEN [WF_DBRowTypes].[RowTypeID] END,
     CASE @OrderBy WHEN 'RowTypeID DESC' THEN [WF_DBRowTypes].[RowTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [WF_DBRowTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [WF_DBRowTypes].[Description] END DESC,
     CASE @OrderBy WHEN 'cssClass' THEN [WF_DBRowTypes].[cssClass] END,
     CASE @OrderBy WHEN 'cssClass DESC' THEN [WF_DBRowTypes].[cssClass] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [WF_DBRowTypes].*  
  FROM [WF_DBRowTypes] 
      INNER JOIN #PageIndex
          ON [WF_DBRowTypes].[RowTypeID] = #PageIndex.RowTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

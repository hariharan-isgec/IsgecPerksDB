USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCLastNumberSelectListSearch]
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
 ,NumberID Int NOT NULL
  )
  INSERT INTO #PageIndex (NumberID)
  SELECT [SPMT_DCLastNumber].[NumberID] FROM [SPMT_DCLastNumber]
 WHERE  
   ( 
         STR(ISNULL([SPMT_DCLastNumber].[NumberID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCLastNumber].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCLastNumber].[LastNumber], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCLastNumber].[Year], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'NumberID' THEN [SPMT_DCLastNumber].[NumberID] END,
     CASE @OrderBy WHEN 'NumberID DESC' THEN [SPMT_DCLastNumber].[NumberID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [SPMT_DCLastNumber].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [SPMT_DCLastNumber].[Description] END DESC,
     CASE @OrderBy WHEN 'LastNumber' THEN [SPMT_DCLastNumber].[LastNumber] END,
     CASE @OrderBy WHEN 'LastNumber DESC' THEN [SPMT_DCLastNumber].[LastNumber] END DESC,
     CASE @OrderBy WHEN 'Year' THEN [SPMT_DCLastNumber].[Year] END,
     CASE @OrderBy WHEN 'Year DESC' THEN [SPMT_DCLastNumber].[Year] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [SPMT_DCLastNumber].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [SPMT_DCLastNumber].[Active] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [SPMT_DCLastNumber].*  
  FROM [SPMT_DCLastNumber] 
      INNER JOIN #PageIndex
          ON [SPMT_DCLastNumber].[NumberID] = #PageIndex.NumberID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

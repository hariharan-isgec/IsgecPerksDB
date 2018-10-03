USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOStatusSelectListSearch]
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
 ,StatusID Int NOT NULL
  )
  INSERT INTO #PageIndex (StatusID)
  SELECT [EITL_POStatus].[StatusID] FROM [EITL_POStatus]
 WHERE  
   ( 
         STR(ISNULL([EITL_POStatus].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StatusID' THEN [EITL_POStatus].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [EITL_POStatus].[StatusID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [EITL_POStatus].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [EITL_POStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[EITL_POStatus].[StatusID] ,
		[EITL_POStatus].[Description]  
  FROM [EITL_POStatus] 
    	INNER JOIN #PageIndex
          ON [EITL_POStatus].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

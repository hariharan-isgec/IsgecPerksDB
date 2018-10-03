USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlMaterialStateSelectListSearch]
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
 ,StateID Int NOT NULL
  )
  INSERT INTO #PageIndex (StateID)
  SELECT [EITL_MaterialState].[StateID] FROM [EITL_MaterialState]
 WHERE  
   ( 
         STR(ISNULL([EITL_MaterialState].[StateID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_MaterialState].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StateID' THEN [EITL_MaterialState].[StateID] END,
     CASE @OrderBy WHEN 'StateID DESC' THEN [EITL_MaterialState].[StateID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [EITL_MaterialState].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [EITL_MaterialState].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[EITL_MaterialState].[StateID] ,
		[EITL_MaterialState].[Description]  
  FROM [EITL_MaterialState] 
    	INNER JOIN #PageIndex
          ON [EITL_MaterialState].[StateID] = #PageIndex.StateID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

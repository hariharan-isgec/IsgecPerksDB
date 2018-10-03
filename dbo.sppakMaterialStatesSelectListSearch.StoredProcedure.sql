USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakMaterialStatesSelectListSearch]
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
 ,MaterialStateID Int NOT NULL
  )
  INSERT INTO #PageIndex (MaterialStateID)
  SELECT [VR_MaterialStates].[MaterialStateID] FROM [VR_MaterialStates]
 WHERE  
   ( 
         STR(ISNULL([VR_MaterialStates].[MaterialStateID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([VR_MaterialStates].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'MaterialStateID' THEN [VR_MaterialStates].[MaterialStateID] END,
     CASE @OrderBy WHEN 'MaterialStateID DESC' THEN [VR_MaterialStates].[MaterialStateID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [VR_MaterialStates].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [VR_MaterialStates].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [VR_MaterialStates].*  
  FROM [VR_MaterialStates] 
      INNER JOIN #PageIndex
          ON [VR_MaterialStates].[MaterialStateID] = #PageIndex.MaterialStateID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

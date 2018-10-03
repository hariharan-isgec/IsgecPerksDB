USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLNaturesSelectListSearch]
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
 ,GLNatureID Int NOT NULL
  )
  INSERT INTO #PageIndex (GLNatureID)
  SELECT [COST_GLNatures].[GLNatureID] FROM [COST_GLNatures]
 WHERE  
   ( 
         STR(ISNULL([COST_GLNatures].[GLNatureID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_GLNatures].[GLNatureDescription],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'GLNatureID' THEN [COST_GLNatures].[GLNatureID] END,
     CASE @OrderBy WHEN 'GLNatureID DESC' THEN [COST_GLNatures].[GLNatureID] END DESC,
     CASE @OrderBy WHEN 'GLNatureDescription' THEN [COST_GLNatures].[GLNatureDescription] END,
     CASE @OrderBy WHEN 'GLNatureDescription DESC' THEN [COST_GLNatures].[GLNatureDescription] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [COST_GLNatures].*  
  FROM [COST_GLNatures] 
      INNER JOIN #PageIndex
          ON [COST_GLNatures].[GLNatureID] = #PageIndex.GLNatureID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

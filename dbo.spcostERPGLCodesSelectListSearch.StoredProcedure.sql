USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostERPGLCodesSelectListSearch]
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
 ,GLCode NVarChar(7) NOT NULL
  )
  INSERT INTO #PageIndex (GLCode)
  SELECT [COST_ERPGLCodes].[GLCode] FROM [COST_ERPGLCodes]
 WHERE  
   ( 
         LOWER(ISNULL([COST_ERPGLCodes].[GLCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([COST_ERPGLCodes].[GLDescription],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'GLCode' THEN [COST_ERPGLCodes].[GLCode] END,
     CASE @OrderBy WHEN 'GLCode DESC' THEN [COST_ERPGLCodes].[GLCode] END DESC,
     CASE @OrderBy WHEN 'GLDescription' THEN [COST_ERPGLCodes].[GLDescription] END,
     CASE @OrderBy WHEN 'GLDescription DESC' THEN [COST_ERPGLCodes].[GLDescription] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [COST_ERPGLCodes].*  
  FROM [COST_ERPGLCodes] 
      INNER JOIN #PageIndex
          ON [COST_ERPGLCodes].[GLCode] = #PageIndex.GLCode
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

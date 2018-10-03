USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastSoftwaresSelectListPaged]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  SoftwareID Int NOT NULL
  )
  INSERT INTO #PageIndex (SoftwareID)
  SELECT [AST_Softwares].[SoftwareID] FROM [AST_Softwares]
  ORDER BY
     CASE @orderBy WHEN 'SoftwareID' THEN [AST_Softwares].[SoftwareID] END,
     CASE @orderBy WHEN 'SoftwareID DESC' THEN [AST_Softwares].[SoftwareID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [AST_Softwares].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [AST_Softwares].[Description] END DESC 

  SET @RecordCount = @@RowCount

  SELECT
		[AST_Softwares].[SoftwareID],
		[AST_Softwares].[Description] 
  FROM [AST_Softwares] 
    	INNER JOIN #PageIndex
          ON [AST_Softwares].[SoftwareID] = #PageIndex.SoftwareID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
GO

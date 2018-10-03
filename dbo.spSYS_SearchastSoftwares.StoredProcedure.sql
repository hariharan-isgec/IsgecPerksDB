USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchastSoftwares]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  SoftwareID Int NOT NULL
  )
  INSERT INTO #PageIndex (SoftwareID)
  SELECT [AST_Softwares].[SoftwareID] FROM [AST_Softwares]
  WHERE STR(ISNULL([AST_Softwares].[SoftwareID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Softwares].[Description],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [AST_Softwares].[SoftwareID] AS SearchCode, 
  ISNULL([AST_Softwares].[Description],'') 
  AS SearchDescription 
  FROM [AST_Softwares] 
    	INNER JOIN #PageIndex
          ON [AST_Softwares].[SoftwareID] = #PageIndex.SoftwareID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

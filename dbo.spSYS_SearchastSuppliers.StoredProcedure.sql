USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchastSuppliers]
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
  SupplierID Int NOT NULL
  )
  INSERT INTO #PageIndex (SupplierID)
  SELECT [AST_Suppliers].[SupplierID] FROM [AST_Suppliers]
  WHERE STR(ISNULL([AST_Suppliers].[SupplierID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([AST_Suppliers].[Description],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [AST_Suppliers].[SupplierID] AS SearchCode, 
  ISNULL([AST_Suppliers].[Description],'') 
  AS SearchDescription 
  FROM [AST_Suppliers] 
    	INNER JOIN #PageIndex
          ON [AST_Suppliers].[SupplierID] = #PageIndex.SupplierID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

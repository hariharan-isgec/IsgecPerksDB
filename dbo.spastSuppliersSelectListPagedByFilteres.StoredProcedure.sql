USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastSuppliersSelectListPagedByFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  SupplierID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (SupplierID) ' + 
               'SELECT [AST_Suppliers].[SupplierID] FROM [AST_Suppliers] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SupplierID' THEN '[AST_Suppliers].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[AST_Suppliers].[SupplierID] DESC'
                        WHEN 'Description' THEN '[AST_Suppliers].[Description]'
                        WHEN 'Description DESC' THEN '[AST_Suppliers].[Description] DESC'
                        ELSE '[AST_Suppliers].[SupplierID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[AST_Suppliers].[SupplierID],
		[AST_Suppliers].[Description] 
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

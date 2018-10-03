USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmSuppliersSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,SupplierID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SupplierID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ASM_Suppliers].[SupplierID]'  SET @LGSQL = @LGSQL + ' FROM [ASM_Suppliers] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SupplierID' THEN '[ASM_Suppliers].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[ASM_Suppliers].[SupplierID] DESC'
                        WHEN 'Description' THEN '[ASM_Suppliers].[Description]'
                        WHEN 'Description DESC' THEN '[ASM_Suppliers].[Description] DESC'
                        ELSE '[ASM_Suppliers].[SupplierID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ASM_Suppliers].[SupplierID],
		[ASM_Suppliers].[Description] 
  FROM [ASM_Suppliers] 
    	INNER JOIN #PageIndex
          ON [ASM_Suppliers].[SupplierID] = #PageIndex.SupplierID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

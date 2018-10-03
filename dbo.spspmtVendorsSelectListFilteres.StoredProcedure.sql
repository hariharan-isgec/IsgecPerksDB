USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtVendorsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,VendorID NVarChar(9) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'VendorID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_Vendors].[VendorID]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_Vendors] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'VendorID' THEN '[SPMT_Vendors].[VendorID]'
                        WHEN 'VendorID DESC' THEN '[SPMT_Vendors].[VendorID] DESC'
                        WHEN 'Description' THEN '[SPMT_Vendors].[Description]'
                        WHEN 'Description DESC' THEN '[SPMT_Vendors].[Description] DESC'
                        ELSE '[SPMT_Vendors].[VendorID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[SPMT_Vendors].[VendorID] ,
		[SPMT_Vendors].[Description]  
  FROM [SPMT_Vendors] 
    	INNER JOIN #PageIndex
          ON [SPMT_Vendors].[VendorID] = #PageIndex.VendorID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

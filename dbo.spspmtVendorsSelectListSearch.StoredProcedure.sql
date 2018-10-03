USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtVendorsSelectListSearch]
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
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,VendorID NVarChar(9) NOT NULL
  )
  INSERT INTO #PageIndex (VendorID)
  SELECT [SPMT_Vendors].[VendorID] FROM [SPMT_Vendors]
 WHERE  
   ( 
         LOWER(ISNULL([SPMT_Vendors].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_Vendors].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'VendorID' THEN [SPMT_Vendors].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [SPMT_Vendors].[VendorID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [SPMT_Vendors].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [SPMT_Vendors].[Description] END DESC 

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

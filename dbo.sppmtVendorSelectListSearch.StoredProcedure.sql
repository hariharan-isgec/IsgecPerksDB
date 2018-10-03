USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmtVendorSelectListSearch]
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
  SELECT [PMT_Vendor].[VendorID] FROM [PMT_Vendor]
 WHERE  
   ( 
        LOWER(ISNULL([PMT_Vendor].[VendorID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMT_Vendor].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'VendorID' THEN [PMT_Vendor].[VendorID] END,
     CASE @orderBy WHEN 'VendorID DESC' THEN [PMT_Vendor].[VendorID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [PMT_Vendor].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [PMT_Vendor].[Description] END DESC,
     CASE @orderBy WHEN 'Active' THEN [PMT_Vendor].[Active] END,
     CASE @orderBy WHEN 'Active DESC' THEN [PMT_Vendor].[Active] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[PMT_Vendor].[VendorID],
		[PMT_Vendor].[Description],
		[PMT_Vendor].[Active] 
  FROM [PMT_Vendor] 
    	INNER JOIN #PageIndex
          ON [PMT_Vendor].[VendorID] = #PageIndex.VendorID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOfficesSelectListSearch]
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
 ,OfficeID Int NOT NULL
  )
  INSERT INTO #PageIndex (OfficeID)
  SELECT [HRM_Offices].[OfficeID] FROM [HRM_Offices]
 WHERE  
   ( 
         STR(ISNULL([HRM_Offices].[OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices].[Address],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices].[City],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'OfficeID' THEN [HRM_Offices].[OfficeID] END,
     CASE @OrderBy WHEN 'OfficeID DESC' THEN [HRM_Offices].[OfficeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [HRM_Offices].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_Offices].[Description] END DESC,
     CASE @OrderBy WHEN 'Address' THEN [HRM_Offices].[Address] END,
     CASE @OrderBy WHEN 'Address DESC' THEN [HRM_Offices].[Address] END DESC,
     CASE @OrderBy WHEN 'City' THEN [HRM_Offices].[City] END,
     CASE @OrderBy WHEN 'City DESC' THEN [HRM_Offices].[City] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_Offices].[OfficeID] ,
		[HRM_Offices].[Description] ,
		[HRM_Offices].[Address] ,
		[HRM_Offices].[City]  
  FROM [HRM_Offices] 
    	INNER JOIN #PageIndex
          ON [HRM_Offices].[OfficeID] = #PageIndex.OfficeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

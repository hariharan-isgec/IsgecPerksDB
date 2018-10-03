USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomCompaniesSelectListSearch]
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
 ,CompanyID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (CompanyID)
  SELECT [HRM_Companies].[CompanyID] FROM [HRM_Companies]
 WHERE  
   ( 
         LOWER(ISNULL([HRM_Companies].[CompanyID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies].[ShortName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Companies].[BaaNID],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CompanyID' THEN [HRM_Companies].[CompanyID] END,
     CASE @OrderBy WHEN 'CompanyID DESC' THEN [HRM_Companies].[CompanyID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [HRM_Companies].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_Companies].[Description] END DESC,
     CASE @OrderBy WHEN 'ShortName' THEN [HRM_Companies].[ShortName] END,
     CASE @OrderBy WHEN 'ShortName DESC' THEN [HRM_Companies].[ShortName] END DESC,
     CASE @OrderBy WHEN 'BaaNID' THEN [HRM_Companies].[BaaNID] END,
     CASE @OrderBy WHEN 'BaaNID DESC' THEN [HRM_Companies].[BaaNID] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [HRM_Companies].*  
  FROM [HRM_Companies] 
      INNER JOIN #PageIndex
          ON [HRM_Companies].[CompanyID] = #PageIndex.CompanyID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

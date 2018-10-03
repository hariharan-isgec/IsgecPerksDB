USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwDesignationsSelectListSearch]
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
 ,DesignationID Int NOT NULL
  )
  INSERT INTO #PageIndex (DesignationID)
  SELECT [HRM_Designations].[DesignationID] FROM [HRM_Designations]
 WHERE  
   ( 
         STR(ISNULL([HRM_Designations].[DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Designations].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Designations].[ShortName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Designations].[Sequence], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'DesignationID' THEN [HRM_Designations].[DesignationID] END,
     CASE @OrderBy WHEN 'DesignationID DESC' THEN [HRM_Designations].[DesignationID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [HRM_Designations].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [HRM_Designations].[Description] END DESC,
     CASE @OrderBy WHEN 'ShortName' THEN [HRM_Designations].[ShortName] END,
     CASE @OrderBy WHEN 'ShortName DESC' THEN [HRM_Designations].[ShortName] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [HRM_Designations].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [HRM_Designations].[Sequence] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [HRM_Designations].*  
  FROM [HRM_Designations] 
      INNER JOIN #PageIndex
          ON [HRM_Designations].[DesignationID] = #PageIndex.DesignationID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

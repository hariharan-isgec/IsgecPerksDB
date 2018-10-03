USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmstDesignationsSelectListSearch]
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
     CASE @orderBy WHEN 'DesignationID' THEN [HRM_Designations].[DesignationID] END,
     CASE @orderBy WHEN 'DesignationID DESC' THEN [HRM_Designations].[DesignationID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_Designations].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_Designations].[Description] END DESC,
     CASE @orderBy WHEN 'ShortName' THEN [HRM_Designations].[ShortName] END,
     CASE @orderBy WHEN 'ShortName DESC' THEN [HRM_Designations].[ShortName] END DESC,
     CASE @orderBy WHEN 'Sequence' THEN [HRM_Designations].[Sequence] END,
     CASE @orderBy WHEN 'Sequence DESC' THEN [HRM_Designations].[Sequence] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_Designations].[DesignationID] ,
		[HRM_Designations].[Description] ,
		[HRM_Designations].[ShortName] ,
		[HRM_Designations].[Sequence]  
  FROM [HRM_Designations] 
    	INNER JOIN #PageIndex
          ON [HRM_Designations].[DesignationID] = #PageIndex.DesignationID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

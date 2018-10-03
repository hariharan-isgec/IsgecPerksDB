USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmBloodGroupsSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  BloodGroupID NVarChar(5) NOT NULL
  )
  INSERT INTO #PageIndex (BloodGroupID)
  SELECT [HRM_BloodGroups].[BloodGroupID] FROM [HRM_BloodGroups]
 WHERE  
   ( 
         LOWER(ISNULL([HRM_BloodGroups].[BloodGroupID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_BloodGroups].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'BloodGroupID' THEN [HRM_BloodGroups].[BloodGroupID] END,
     CASE @orderBy WHEN 'BloodGroupID DESC' THEN [HRM_BloodGroups].[BloodGroupID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_BloodGroups].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_BloodGroups].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_BloodGroups].[BloodGroupID],
		[HRM_BloodGroups].[Description] 
  FROM [HRM_BloodGroups] 
    	INNER JOIN #PageIndex
          ON [HRM_BloodGroups].[BloodGroupID] = #PageIndex.BloodGroupID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

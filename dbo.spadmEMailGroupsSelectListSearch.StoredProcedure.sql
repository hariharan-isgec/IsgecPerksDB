USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmEMailGroupsSelectListSearch]
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
 ,EMailGroup NVarChar(50) NOT NULL
  )
  INSERT INTO #PageIndex (EMailGroup)
  SELECT [HRM_EMailGroups].[EMailGroup] FROM [HRM_EMailGroups]
 WHERE  
   ( 
         LOWER(ISNULL([HRM_EMailGroups].[EMailGroup],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_EMailGroups].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'EMailGroup' THEN [HRM_EMailGroups].[EMailGroup] END,
     CASE @orderBy WHEN 'EMailGroup DESC' THEN [HRM_EMailGroups].[EMailGroup] END DESC,
     CASE @orderBy WHEN 'Description' THEN [HRM_EMailGroups].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [HRM_EMailGroups].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[HRM_EMailGroups].[EMailGroup],
		[HRM_EMailGroups].[Description] 
  FROM [HRM_EMailGroups] 
    	INNER JOIN #PageIndex
          ON [HRM_EMailGroups].[EMailGroup] = #PageIndex.EMailGroup
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

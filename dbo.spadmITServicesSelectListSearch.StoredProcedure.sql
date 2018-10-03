USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITServicesSelectListSearch]
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
 ,ITServiceID NVarChar(15) NOT NULL
  )
  INSERT INTO #PageIndex (ITServiceID)
  SELECT [ADM_ITServices].[ITServiceID] FROM [ADM_ITServices]
  LEFT OUTER JOIN [HRM_EMailGroups] AS [HRM_EMailGroups1]
    ON [ADM_ITServices].[EMailGroup] = [HRM_EMailGroups1].[EMailGroup]
 WHERE  
   ( 
         LOWER(ISNULL([ADM_ITServices].[ITServiceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITServices].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ADM_ITServices].[AlertAfterDays], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITServices].[EMailGroup],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_EMailGroups1].[EMailGroup],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_EMailGroups1].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ITServiceID' THEN [ADM_ITServices].[ITServiceID] END,
     CASE @orderBy WHEN 'ITServiceID DESC' THEN [ADM_ITServices].[ITServiceID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_ITServices].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_ITServices].[Description] END DESC,
     CASE @orderBy WHEN 'AlertAfterDays' THEN [ADM_ITServices].[AlertAfterDays] END,
     CASE @orderBy WHEN 'AlertAfterDays DESC' THEN [ADM_ITServices].[AlertAfterDays] END DESC,
     CASE @orderBy WHEN 'EMailGroup' THEN [ADM_ITServices].[EMailGroup] END,
     CASE @orderBy WHEN 'EMailGroup DESC' THEN [ADM_ITServices].[EMailGroup] END DESC,
     CASE @orderBy WHEN 'HRM_EMailGroups1_EMailGroup' THEN [HRM_EMailGroups1].[EMailGroup] END,
     CASE @orderBy WHEN 'HRM_EMailGroups1_EMailGroup DESC' THEN [HRM_EMailGroups1].[EMailGroup] END DESC,
     CASE @orderBy WHEN 'HRM_EMailGroups1_Description' THEN [HRM_EMailGroups1].[Description] END,
     CASE @orderBy WHEN 'HRM_EMailGroups1_Description DESC' THEN [HRM_EMailGroups1].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ADM_ITServices].[ITServiceID],
		[ADM_ITServices].[Description],
		[ADM_ITServices].[AlertAfterDays],
		[ADM_ITServices].[EMailGroup],
		[HRM_EMailGroups1].[EMailGroup] AS HRM_EMailGroups1_EMailGroup,
		[HRM_EMailGroups1].[Description] AS HRM_EMailGroups1_Description 
  FROM [ADM_ITServices] 
    	INNER JOIN #PageIndex
          ON [ADM_ITServices].[ITServiceID] = #PageIndex.ITServiceID
  LEFT OUTER JOIN [HRM_EMailGroups] AS [HRM_EMailGroups1]
    ON [ADM_ITServices].[EMailGroup] = [HRM_EMailGroups1].[EMailGroup]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITServicesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,ITServiceID NVarChar(15) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ITServiceID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_ITServices].[ITServiceID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_ITServices] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_EMailGroups] AS [HRM_EMailGroups1]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ITServices].[EMailGroup] = [HRM_EMailGroups1].[EMailGroup]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ITServiceID' THEN '[ADM_ITServices].[ITServiceID]'
                        WHEN 'ITServiceID DESC' THEN '[ADM_ITServices].[ITServiceID] DESC'
                        WHEN 'Description' THEN '[ADM_ITServices].[Description]'
                        WHEN 'Description DESC' THEN '[ADM_ITServices].[Description] DESC'
                        WHEN 'AlertAfterDays' THEN '[ADM_ITServices].[AlertAfterDays]'
                        WHEN 'AlertAfterDays DESC' THEN '[ADM_ITServices].[AlertAfterDays] DESC'
                        WHEN 'EMailGroup' THEN '[ADM_ITServices].[EMailGroup]'
                        WHEN 'EMailGroup DESC' THEN '[ADM_ITServices].[EMailGroup] DESC'
                        WHEN 'HRM_EMailGroups1_EMailGroup' THEN '[HRM_EMailGroups1].[EMailGroup]'
                        WHEN 'HRM_EMailGroups1_EMailGroup DESC' THEN '[HRM_EMailGroups1].[EMailGroup] DESC'
                        WHEN 'HRM_EMailGroups1_Description' THEN '[HRM_EMailGroups1].[Description]'
                        WHEN 'HRM_EMailGroups1_Description DESC' THEN '[HRM_EMailGroups1].[Description] DESC'
                        ELSE '[ADM_ITServices].[ITServiceID]'
                    END
  EXEC (@LGSQL)

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

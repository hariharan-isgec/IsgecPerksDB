USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmBloodGroupsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  BloodGroupID NVarChar(5) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (BloodGroupID) ' + 
               'SELECT [HRM_BloodGroups].[BloodGroupID] FROM [HRM_BloodGroups] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BloodGroupID' THEN '[HRM_BloodGroups].[BloodGroupID]'
                        WHEN 'BloodGroupID DESC' THEN '[HRM_BloodGroups].[BloodGroupID] DESC'
                        WHEN 'Description' THEN '[HRM_BloodGroups].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_BloodGroups].[Description] DESC'
                        ELSE '[HRM_BloodGroups].[BloodGroupID]'
                    END
  EXEC (@LGSQL)

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

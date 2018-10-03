USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmEmployeeGroupsSelectListFilteres]
  @Filter_GroupID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,GroupID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'GroupID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QCM_EmployeeGroups].[GroupID]'
  SET @LGSQL = @LGSQL + ' FROM [QCM_EmployeeGroups] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_GroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QCM_EmployeeGroups].[GroupID] = ' + STR(@Filter_GroupID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'GroupID' THEN '[QCM_EmployeeGroups].[GroupID]'
                        WHEN 'GroupID DESC' THEN '[QCM_EmployeeGroups].[GroupID] DESC'
                        WHEN 'Description' THEN '[QCM_EmployeeGroups].[Description]'
                        WHEN 'Description DESC' THEN '[QCM_EmployeeGroups].[Description] DESC'
                        ELSE '[QCM_EmployeeGroups].[GroupID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QCM_EmployeeGroups].[GroupID] ,
		[QCM_EmployeeGroups].[Description]  
  FROM [QCM_EmployeeGroups] 
    	INNER JOIN #PageIndex
          ON [QCM_EmployeeGroups].[GroupID] = #PageIndex.GroupID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

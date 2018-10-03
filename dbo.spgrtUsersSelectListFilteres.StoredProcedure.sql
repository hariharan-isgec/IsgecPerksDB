USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtUsersSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @UserID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,UserID NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'UserID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[GRT_Users].[UserID]'
  SET @LGSQL = @LGSQL + ' FROM [GRT_Users] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [GRT_Users].[UserID] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [GRT_Users].[UserID] = (''' + @UserID + ''')'
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'UserID' THEN '[GRT_Users].[UserID]'
                        WHEN 'UserID DESC' THEN '[GRT_Users].[UserID] DESC'
                        WHEN 'Designation' THEN '[GRT_Users].[Designation]'
                        WHEN 'Designation DESC' THEN '[GRT_Users].[Designation] DESC'
                        WHEN 'Department' THEN '[GRT_Users].[Department]'
                        WHEN 'Department DESC' THEN '[GRT_Users].[Department] DESC'
                        WHEN 'DirectNo' THEN '[GRT_Users].[DirectNo]'
                        WHEN 'DirectNo DESC' THEN '[GRT_Users].[DirectNo] DESC'
                        WHEN 'CellNo' THEN '[GRT_Users].[CellNo]'
                        WHEN 'CellNo DESC' THEN '[GRT_Users].[CellNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        ELSE '[GRT_Users].[UserID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[GRT_Users].[UserID] ,
		[GRT_Users].[Designation] ,
		[GRT_Users].[Department] ,
		[GRT_Users].[DirectNo] ,
		[GRT_Users].[CellNo] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [GRT_Users] 
    	INNER JOIN #PageIndex
          ON [GRT_Users].[UserID] = #PageIndex.UserID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [GRT_Users].[UserID] = [HRM_Employees1].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

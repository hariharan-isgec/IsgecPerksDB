USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPunchRequiredSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  RecordID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (RecordID) ' + 
               'SELECT [ATN_PunchRequired].[RecordID] FROM [ATN_PunchRequired] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [ATN_PunchRequired].[CardNo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RecordID' THEN '[ATN_PunchRequired].[RecordID]'
                        WHEN 'RecordID DESC' THEN '[ATN_PunchRequired].[RecordID] DESC'
                        WHEN 'CardNo' THEN '[ATN_PunchRequired].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATN_PunchRequired].[CardNo] DESC'
                        WHEN 'NoPunch' THEN '[ATN_PunchRequired].[NoPunch]'
                        WHEN 'NoPunch DESC' THEN '[ATN_PunchRequired].[NoPunch] DESC'
                        WHEN 'OnePunch' THEN '[ATN_PunchRequired].[OnePunch]'
                        WHEN 'OnePunch DESC' THEN '[ATN_PunchRequired].[OnePunch] DESC'
                        WHEN 'RuleException' THEN '[ATN_PunchRequired].[RuleException]'
                        WHEN 'RuleException DESC' THEN '[ATN_PunchRequired].[RuleException] DESC'
                        WHEN 'HRM_Employees1_CardNo' THEN '[HRM_Employees1].[CardNo]'
                        WHEN 'HRM_Employees1_CardNo DESC' THEN '[HRM_Employees1].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        ELSE '[ATN_PunchRequired].[RecordID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ATN_PunchRequired].[RecordID],
		[ATN_PunchRequired].[CardNo],
		[ATN_PunchRequired].[NoPunch],
		[ATN_PunchRequired].[OnePunch],
		[ATN_PunchRequired].[RuleException],
		[ATN_PunchRequired].[AllLocation],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [ATN_PunchRequired] 
    	INNER JOIN #PageIndex
          ON [ATN_PunchRequired].[RecordID] = #PageIndex.RecordID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_PunchRequired].[CardNo] = [HRM_Employees1].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

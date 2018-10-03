USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITEventProgressSelectListFilteres]
  @Filter_EventID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,EventID Int NOT NULL
 ,ITServiceID NVarChar(15) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'EventID'  SET @LGSQL = @LGSQL + ', ITServiceID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_ITEventStatus].[EventID]'  SET @LGSQL = @LGSQL + ', [ADM_ITEventStatus].[ITServiceID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_ITEventStatus] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [ADM_ITEventTransactions] AS [ADM_ITEventTransactions1]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ITEventStatus].[EventID] = [ADM_ITEventTransactions1].[EventID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ADM_ITServices] AS [ADM_ITServices2]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ITEventStatus].[ITServiceID] = [ADM_ITServices2].[ITServiceID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ITEventStatus].[RespondedBy] = [HRM_Employees3].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_EventID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ADM_ITEventStatus].[EventID] = ' + STR(@Filter_EventID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'EventID' THEN '[ADM_ITEventStatus].[EventID]'
                        WHEN 'EventID DESC' THEN '[ADM_ITEventStatus].[EventID] DESC'
                        WHEN 'ITServiceID' THEN '[ADM_ITEventStatus].[ITServiceID]'
                        WHEN 'ITServiceID DESC' THEN '[ADM_ITEventStatus].[ITServiceID] DESC'
                        WHEN 'ActionNotRequired' THEN '[ADM_ITEventStatus].[ActionNotRequired]'
                        WHEN 'ActionNotRequired DESC' THEN '[ADM_ITEventStatus].[ActionNotRequired] DESC'
                        WHEN 'ActionTaken' THEN '[ADM_ITEventStatus].[ActionTaken]'
                        WHEN 'ActionTaken DESC' THEN '[ADM_ITEventStatus].[ActionTaken] DESC'
                        WHEN 'Responded' THEN '[ADM_ITEventStatus].[Responded]'
                        WHEN 'Responded DESC' THEN '[ADM_ITEventStatus].[Responded] DESC'
                        WHEN 'RespondedBy' THEN '[ADM_ITEventStatus].[RespondedBy]'
                        WHEN 'RespondedBy DESC' THEN '[ADM_ITEventStatus].[RespondedBy] DESC'
                        WHEN 'RespondedOn' THEN '[ADM_ITEventStatus].[RespondedOn]'
                        WHEN 'RespondedOn DESC' THEN '[ADM_ITEventStatus].[RespondedOn] DESC'
                        WHEN 'AlertedOn' THEN '[ADM_ITEventStatus].[AlertedOn]'
                        WHEN 'AlertedOn DESC' THEN '[ADM_ITEventStatus].[AlertedOn] DESC'
                        WHEN 'ADM_ITEventTransactions1_EventID' THEN '[ADM_ITEventTransactions1].[EventID]'
                        WHEN 'ADM_ITEventTransactions1_EventID DESC' THEN '[ADM_ITEventTransactions1].[EventID] DESC'
                        WHEN 'ADM_ITEventTransactions1_EventDate' THEN '[ADM_ITEventTransactions1].[EventDate]'
                        WHEN 'ADM_ITEventTransactions1_EventDate DESC' THEN '[ADM_ITEventTransactions1].[EventDate] DESC'
                        WHEN 'ADM_ITEventTransactions1_CardNo' THEN '[ADM_ITEventTransactions1].[CardNo]'
                        WHEN 'ADM_ITEventTransactions1_CardNo DESC' THEN '[ADM_ITEventTransactions1].[CardNo] DESC'
                        WHEN 'ADM_ITEventTransactions1_Description' THEN '[ADM_ITEventTransactions1].[Description]'
                        WHEN 'ADM_ITEventTransactions1_Description DESC' THEN '[ADM_ITEventTransactions1].[Description] DESC'
                        WHEN 'ADM_ITEventTransactions1_Completed' THEN '[ADM_ITEventTransactions1].[Completed]'
                        WHEN 'ADM_ITEventTransactions1_Completed DESC' THEN '[ADM_ITEventTransactions1].[Completed] DESC'
                        WHEN 'ADM_ITEventTransactions1_CompletedOn' THEN '[ADM_ITEventTransactions1].[CompletedOn]'
                        WHEN 'ADM_ITEventTransactions1_CompletedOn DESC' THEN '[ADM_ITEventTransactions1].[CompletedOn] DESC'
                        WHEN 'ADM_ITServices2_ITServiceID' THEN '[ADM_ITServices2].[ITServiceID]'
                        WHEN 'ADM_ITServices2_ITServiceID DESC' THEN '[ADM_ITServices2].[ITServiceID] DESC'
                        WHEN 'ADM_ITServices2_Description' THEN '[ADM_ITServices2].[Description]'
                        WHEN 'ADM_ITServices2_Description DESC' THEN '[ADM_ITServices2].[Description] DESC'
                        WHEN 'ADM_ITServices2_AlertAfterDays' THEN '[ADM_ITServices2].[AlertAfterDays]'
                        WHEN 'ADM_ITServices2_AlertAfterDays DESC' THEN '[ADM_ITServices2].[AlertAfterDays] DESC'
                        WHEN 'ADM_ITServices2_EMailGroup' THEN '[ADM_ITServices2].[EMailGroup]'
                        WHEN 'ADM_ITServices2_EMailGroup DESC' THEN '[ADM_ITServices2].[EMailGroup] DESC'
                        WHEN 'HRM_Employees3_CardNo' THEN '[HRM_Employees3].[CardNo]'
                        WHEN 'HRM_Employees3_CardNo DESC' THEN '[HRM_Employees3].[CardNo] DESC'
                        WHEN 'HRM_Employees3_EmployeeName' THEN '[HRM_Employees3].[EmployeeName]'
                        WHEN 'HRM_Employees3_EmployeeName DESC' THEN '[HRM_Employees3].[EmployeeName] DESC'
                        WHEN 'HRM_Employees3_C_OfficeID' THEN '[HRM_Employees3].[C_OfficeID]'
                        WHEN 'HRM_Employees3_C_OfficeID DESC' THEN '[HRM_Employees3].[C_OfficeID] DESC'
                        ELSE '[ADM_ITEventStatus].[EventID],[ADM_ITEventStatus].[ITServiceID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ADM_ITEventStatus].[EventID],
		[ADM_ITEventStatus].[ITServiceID],
		[ADM_ITEventStatus].[ActionNotRequired],
		[ADM_ITEventStatus].[ActionTaken],
		[ADM_ITEventStatus].[Responded],
		[ADM_ITEventStatus].[RespondedBy],
		[ADM_ITEventStatus].[RespondedOn],
		[ADM_ITEventStatus].[AlertedOn],
		[ADM_ITEventTransactions1].[EventID] AS ADM_ITEventTransactions1_EventID,
		[ADM_ITEventTransactions1].[EventDate] AS ADM_ITEventTransactions1_EventDate,
		[ADM_ITEventTransactions1].[CardNo] AS ADM_ITEventTransactions1_CardNo,
		[ADM_ITEventTransactions1].[Description] AS ADM_ITEventTransactions1_Description,
		[ADM_ITEventTransactions1].[Completed] AS ADM_ITEventTransactions1_Completed,
		[ADM_ITEventTransactions1].[CompletedOn] AS ADM_ITEventTransactions1_CompletedOn,
		[ADM_ITServices2].[ITServiceID] AS ADM_ITServices2_ITServiceID,
		[ADM_ITServices2].[Description] AS ADM_ITServices2_Description,
		[ADM_ITServices2].[AlertAfterDays] AS ADM_ITServices2_AlertAfterDays,
		[ADM_ITServices2].[EMailGroup] AS ADM_ITServices2_EMailGroup,
		[HRM_Employees3].[CardNo] AS HRM_Employees3_CardNo,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
		[HRM_Employees3].[C_OfficeID] AS HRM_Employees3_C_OfficeID 
  FROM [ADM_ITEventStatus] 
    	INNER JOIN #PageIndex
          ON [ADM_ITEventStatus].[EventID] = #PageIndex.EventID
          AND [ADM_ITEventStatus].[ITServiceID] = #PageIndex.ITServiceID
  INNER JOIN [ADM_ITEventTransactions] AS [ADM_ITEventTransactions1]
    ON [ADM_ITEventStatus].[EventID] = [ADM_ITEventTransactions1].[EventID]
  INNER JOIN [ADM_ITServices] AS [ADM_ITServices2]
    ON [ADM_ITEventStatus].[ITServiceID] = [ADM_ITServices2].[ITServiceID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [ADM_ITEventStatus].[RespondedBy] = [HRM_Employees3].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITEventStatusSelectListSearch]
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
 ,EventID Int NOT NULL
 ,ITServiceID NVarChar(15) NOT NULL
  )
  INSERT INTO #PageIndex (EventID, ITServiceID)
  SELECT [ADM_ITEventStatus].[EventID], [ADM_ITEventStatus].[ITServiceID] FROM [ADM_ITEventStatus]
  INNER JOIN [ADM_ITEventTransactions] AS [ADM_ITEventTransactions1]
    ON [ADM_ITEventStatus].[EventID] = [ADM_ITEventTransactions1].[EventID]
  INNER JOIN [ADM_ITServices] AS [ADM_ITServices2]
    ON [ADM_ITEventStatus].[ITServiceID] = [ADM_ITServices2].[ITServiceID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [ADM_ITEventStatus].[RespondedBy] = [HRM_Employees3].[CardNo]
 WHERE  
   ( 
         STR(ISNULL([ADM_ITEventStatus].[EventID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITEventStatus].[ITServiceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITEventStatus].[RespondedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITEventTransactions1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITEventTransactions1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITServices2].[ITServiceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITServices2].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([ADM_ITServices2].[AlertAfterDays], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITServices2].[EMailGroup],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees3].[C_OfficeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees3].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees3].[C_DesignationID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'EventID' THEN [ADM_ITEventStatus].[EventID] END,
     CASE @orderBy WHEN 'EventID DESC' THEN [ADM_ITEventStatus].[EventID] END DESC,
     CASE @orderBy WHEN 'ITServiceID' THEN [ADM_ITEventStatus].[ITServiceID] END,
     CASE @orderBy WHEN 'ITServiceID DESC' THEN [ADM_ITEventStatus].[ITServiceID] END DESC,
     CASE @orderBy WHEN 'ActionNotRequired' THEN [ADM_ITEventStatus].[ActionNotRequired] END,
     CASE @orderBy WHEN 'ActionNotRequired DESC' THEN [ADM_ITEventStatus].[ActionNotRequired] END DESC,
     CASE @orderBy WHEN 'ActionTaken' THEN [ADM_ITEventStatus].[ActionTaken] END,
     CASE @orderBy WHEN 'ActionTaken DESC' THEN [ADM_ITEventStatus].[ActionTaken] END DESC,
     CASE @orderBy WHEN 'Responded' THEN [ADM_ITEventStatus].[Responded] END,
     CASE @orderBy WHEN 'Responded DESC' THEN [ADM_ITEventStatus].[Responded] END DESC,
     CASE @orderBy WHEN 'RespondedBy' THEN [ADM_ITEventStatus].[RespondedBy] END,
     CASE @orderBy WHEN 'RespondedBy DESC' THEN [ADM_ITEventStatus].[RespondedBy] END DESC,
     CASE @orderBy WHEN 'RespondedOn' THEN [ADM_ITEventStatus].[RespondedOn] END,
     CASE @orderBy WHEN 'RespondedOn DESC' THEN [ADM_ITEventStatus].[RespondedOn] END DESC,
     CASE @orderBy WHEN 'AlertedOn' THEN [ADM_ITEventStatus].[AlertedOn] END,
     CASE @orderBy WHEN 'AlertedOn DESC' THEN [ADM_ITEventStatus].[AlertedOn] END DESC,
     CASE @orderBy WHEN 'ADM_ITEventTransactions1_EventID' THEN [ADM_ITEventTransactions1].[EventID] END,
     CASE @orderBy WHEN 'ADM_ITEventTransactions1_EventID DESC' THEN [ADM_ITEventTransactions1].[EventID] END DESC,
     CASE @orderBy WHEN 'ADM_ITEventTransactions1_EventDate' THEN [ADM_ITEventTransactions1].[EventDate] END,
     CASE @orderBy WHEN 'ADM_ITEventTransactions1_EventDate DESC' THEN [ADM_ITEventTransactions1].[EventDate] END DESC,
     CASE @orderBy WHEN 'ADM_ITEventTransactions1_CardNo' THEN [ADM_ITEventTransactions1].[CardNo] END,
     CASE @orderBy WHEN 'ADM_ITEventTransactions1_CardNo DESC' THEN [ADM_ITEventTransactions1].[CardNo] END DESC,
     CASE @orderBy WHEN 'ADM_ITEventTransactions1_Description' THEN [ADM_ITEventTransactions1].[Description] END,
     CASE @orderBy WHEN 'ADM_ITEventTransactions1_Description DESC' THEN [ADM_ITEventTransactions1].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_ITEventTransactions1_Completed' THEN [ADM_ITEventTransactions1].[Completed] END,
     CASE @orderBy WHEN 'ADM_ITEventTransactions1_Completed DESC' THEN [ADM_ITEventTransactions1].[Completed] END DESC,
     CASE @orderBy WHEN 'ADM_ITEventTransactions1_CompletedOn' THEN [ADM_ITEventTransactions1].[CompletedOn] END,
     CASE @orderBy WHEN 'ADM_ITEventTransactions1_CompletedOn DESC' THEN [ADM_ITEventTransactions1].[CompletedOn] END DESC,
     CASE @orderBy WHEN 'ADM_ITServices2_ITServiceID' THEN [ADM_ITServices2].[ITServiceID] END,
     CASE @orderBy WHEN 'ADM_ITServices2_ITServiceID DESC' THEN [ADM_ITServices2].[ITServiceID] END DESC,
     CASE @orderBy WHEN 'ADM_ITServices2_Description' THEN [ADM_ITServices2].[Description] END,
     CASE @orderBy WHEN 'ADM_ITServices2_Description DESC' THEN [ADM_ITServices2].[Description] END DESC,
     CASE @orderBy WHEN 'ADM_ITServices2_AlertAfterDays' THEN [ADM_ITServices2].[AlertAfterDays] END,
     CASE @orderBy WHEN 'ADM_ITServices2_AlertAfterDays DESC' THEN [ADM_ITServices2].[AlertAfterDays] END DESC,
     CASE @orderBy WHEN 'ADM_ITServices2_EMailGroup' THEN [ADM_ITServices2].[EMailGroup] END,
     CASE @orderBy WHEN 'ADM_ITServices2_EMailGroup DESC' THEN [ADM_ITServices2].[EMailGroup] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_CardNo' THEN [HRM_Employees3].[CardNo] END,
     CASE @orderBy WHEN 'HRM_Employees3_CardNo DESC' THEN [HRM_Employees3].[CardNo] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_EmployeeName' THEN [HRM_Employees3].[EmployeeName] END,
     CASE @orderBy WHEN 'HRM_Employees3_EmployeeName DESC' THEN [HRM_Employees3].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'HRM_Employees3_C_OfficeID' THEN [HRM_Employees3].[C_OfficeID] END,
     CASE @orderBy WHEN 'HRM_Employees3_C_OfficeID DESC' THEN [HRM_Employees3].[C_OfficeID] END DESC 

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

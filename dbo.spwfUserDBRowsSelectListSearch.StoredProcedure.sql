USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfUserDBRowsSelectListSearch]
  @LoginID NVarChar(8),
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
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,UserID NVarChar(8) NOT NULL
 ,DashboardID Int NOT NULL
 ,DBRows Int NOT NULL
  )
  INSERT INTO #PageIndex (UserID, DashboardID, DBRows)
  SELECT [WF_UserDBRows].[UserID], [WF_UserDBRows].[DashboardID], [WF_UserDBRows].[DBRows] FROM [WF_UserDBRows]
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [WF_UserDBRows].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [WF_DBRows] AS [WF_DBRows2]
    ON [WF_UserDBRows].[DashboardID] = [WF_DBRows2].[DashboardID]
    AND [WF_UserDBRows].[DBRows] = [WF_DBRows2].[DBRows]
  INNER JOIN [WF_UserDashboards] AS [WF_UserDashboards3]
    ON [WF_UserDBRows].[UserID] = [WF_UserDashboards3].[UserID]
    AND [WF_UserDBRows].[DashboardID] = [WF_UserDashboards3].[DashboardID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData4]
    ON [WF_UserDBRows].[ReminderCountDBDataID] = [WF_DBData4].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData5]
    ON [WF_UserDBRows].[ReminderAvgDBDataID] = [WF_DBData5].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData6]
    ON [WF_UserDBRows].[ReminderMaxDBDataID] = [WF_DBData6].[DBDataID]
 WHERE  
   ( 
         LOWER(ISNULL([WF_UserDBRows].[UserID],'')) LIKE @KeyWord1
     OR STR(ISNULL([WF_UserDBRows].[DashboardID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([WF_UserDBRows].[DBRows], 0)) LIKE @KeyWord1
     OR STR(ISNULL([WF_UserDBRows].[ReminderMaxDBDataID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([WF_UserDBRows].[ReminderLapsDaysMax], 0)) LIKE @KeyWord1
     OR STR(ISNULL([WF_UserDBRows].[ReminderFrequencyDays], 0)) LIKE @KeyWord1
     OR STR(ISNULL([WF_UserDBRows].[ReminderCountDBDataID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([WF_UserDBRows].[ReminderCountThreshold], 0)) LIKE @KeyWord1
     OR STR(ISNULL([WF_UserDBRows].[ReminderLapsDaysAvg], 0)) LIKE @KeyWord1
     OR STR(ISNULL([WF_UserDBRows].[ReminderAvgDBDataID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'UserID' THEN [WF_UserDBRows].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [WF_UserDBRows].[UserID] END DESC,
     CASE @OrderBy WHEN 'DashboardID' THEN [WF_UserDBRows].[DashboardID] END,
     CASE @OrderBy WHEN 'DashboardID DESC' THEN [WF_UserDBRows].[DashboardID] END DESC,
     CASE @OrderBy WHEN 'DBRows' THEN [WF_UserDBRows].[DBRows] END,
     CASE @OrderBy WHEN 'DBRows DESC' THEN [WF_UserDBRows].[DBRows] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [WF_UserDBRows].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [WF_UserDBRows].[Active] END DESC,
     CASE @OrderBy WHEN 'ActionAllowed' THEN [WF_UserDBRows].[ActionAllowed] END,
     CASE @OrderBy WHEN 'ActionAllowed DESC' THEN [WF_UserDBRows].[ActionAllowed] END DESC,
     CASE @OrderBy WHEN 'UpdateAllowed' THEN [WF_UserDBRows].[UpdateAllowed] END,
     CASE @OrderBy WHEN 'UpdateAllowed DESC' THEN [WF_UserDBRows].[UpdateAllowed] END DESC,
     CASE @OrderBy WHEN 'ReminderOnCount' THEN [WF_UserDBRows].[ReminderOnCount] END,
     CASE @OrderBy WHEN 'ReminderOnCount DESC' THEN [WF_UserDBRows].[ReminderOnCount] END DESC,
     CASE @OrderBy WHEN 'ReminderCountThreshold' THEN [WF_UserDBRows].[ReminderCountThreshold] END,
     CASE @OrderBy WHEN 'ReminderCountThreshold DESC' THEN [WF_UserDBRows].[ReminderCountThreshold] END DESC,
     CASE @OrderBy WHEN 'ReminderCountDBDataID' THEN [WF_UserDBRows].[ReminderCountDBDataID] END,
     CASE @OrderBy WHEN 'ReminderCountDBDataID DESC' THEN [WF_UserDBRows].[ReminderCountDBDataID] END DESC,
     CASE @OrderBy WHEN 'ReminderOnAvg' THEN [WF_UserDBRows].[ReminderOnAvg] END,
     CASE @OrderBy WHEN 'ReminderOnAvg DESC' THEN [WF_UserDBRows].[ReminderOnAvg] END DESC,
     CASE @OrderBy WHEN 'ReminderLapsDaysAvg' THEN [WF_UserDBRows].[ReminderLapsDaysAvg] END,
     CASE @OrderBy WHEN 'ReminderLapsDaysAvg DESC' THEN [WF_UserDBRows].[ReminderLapsDaysAvg] END DESC,
     CASE @OrderBy WHEN 'ReminderAvgDBDataID' THEN [WF_UserDBRows].[ReminderAvgDBDataID] END,
     CASE @OrderBy WHEN 'ReminderAvgDBDataID DESC' THEN [WF_UserDBRows].[ReminderAvgDBDataID] END DESC,
     CASE @OrderBy WHEN 'ReminderOnMax' THEN [WF_UserDBRows].[ReminderOnMax] END,
     CASE @OrderBy WHEN 'ReminderOnMax DESC' THEN [WF_UserDBRows].[ReminderOnMax] END DESC,
     CASE @OrderBy WHEN 'ReminderLapsDaysMax' THEN [WF_UserDBRows].[ReminderLapsDaysMax] END,
     CASE @OrderBy WHEN 'ReminderLapsDaysMax DESC' THEN [WF_UserDBRows].[ReminderLapsDaysMax] END DESC,
     CASE @OrderBy WHEN 'ReminderMaxDBDataID' THEN [WF_UserDBRows].[ReminderMaxDBDataID] END,
     CASE @OrderBy WHEN 'ReminderMaxDBDataID DESC' THEN [WF_UserDBRows].[ReminderMaxDBDataID] END DESC,
     CASE @OrderBy WHEN 'ReminderFrequencyDays' THEN [WF_UserDBRows].[ReminderFrequencyDays] END,
     CASE @OrderBy WHEN 'ReminderFrequencyDays DESC' THEN [WF_UserDBRows].[ReminderFrequencyDays] END DESC,
     CASE @OrderBy WHEN 'RunDate' THEN [WF_UserDBRows].[RunDate] END,
     CASE @OrderBy WHEN 'RunDate DESC' THEN [WF_UserDBRows].[RunDate] END DESC,
     CASE @OrderBy WHEN 'NextRunDate' THEN [WF_UserDBRows].[NextRunDate] END,
     CASE @OrderBy WHEN 'NextRunDate DESC' THEN [WF_UserDBRows].[NextRunDate] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'WF_DBRows2_Description' THEN [WF_DBRows2].[Description] END,
     CASE @OrderBy WHEN 'WF_DBRows2_Description DESC' THEN [WF_DBRows2].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_UserDashboards3_DashboardID' THEN [WF_UserDashboards3].[DashboardID] END,
     CASE @OrderBy WHEN 'WF_UserDashboards3_DashboardID DESC' THEN [WF_UserDashboards3].[DashboardID] END DESC,
     CASE @OrderBy WHEN 'WF_DBData4_Description' THEN [WF_DBData4].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData4_Description DESC' THEN [WF_DBData4].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData5_Description' THEN [WF_DBData5].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData5_Description DESC' THEN [WF_DBData5].[Description] END DESC,
     CASE @OrderBy WHEN 'WF_DBData6_Description' THEN [WF_DBData6].[Description] END,
     CASE @OrderBy WHEN 'WF_DBData6_Description DESC' THEN [WF_DBData6].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [WF_UserDBRows].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [WF_DBRows2].[Description] AS WF_DBRows2_Description,
    [WF_UserDashboards3].[DashboardID] AS WF_UserDashboards3_DashboardID,
    [WF_DBData4].[Description] AS WF_DBData4_Description,
    [WF_DBData5].[Description] AS WF_DBData5_Description,
    [WF_DBData6].[Description] AS WF_DBData6_Description 
  FROM [WF_UserDBRows] 
      INNER JOIN #PageIndex
          ON [WF_UserDBRows].[UserID] = #PageIndex.UserID
          AND [WF_UserDBRows].[DashboardID] = #PageIndex.DashboardID
          AND [WF_UserDBRows].[DBRows] = #PageIndex.DBRows
  INNER JOIN [aspnet_users] AS [aspnet_users1]
    ON [WF_UserDBRows].[UserID] = [aspnet_users1].[LoginID]
  INNER JOIN [WF_DBRows] AS [WF_DBRows2]
    ON [WF_UserDBRows].[DashboardID] = [WF_DBRows2].[DashboardID]
    AND [WF_UserDBRows].[DBRows] = [WF_DBRows2].[DBRows]
  INNER JOIN [WF_UserDashboards] AS [WF_UserDashboards3]
    ON [WF_UserDBRows].[UserID] = [WF_UserDashboards3].[UserID]
    AND [WF_UserDBRows].[DashboardID] = [WF_UserDashboards3].[DashboardID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData4]
    ON [WF_UserDBRows].[ReminderCountDBDataID] = [WF_DBData4].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData5]
    ON [WF_UserDBRows].[ReminderAvgDBDataID] = [WF_DBData5].[DBDataID]
  LEFT OUTER JOIN [WF_DBData] AS [WF_DBData6]
    ON [WF_UserDBRows].[ReminderMaxDBDataID] = [WF_DBData6].[DBDataID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwf_LG_UserDBRowsForReminder]
  @StartRowIndex int,
  @MaximumRows int,
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,UserID NVarChar(8) NOT NULL
 ,DashboardID Int NOT NULL
 ,DBRows Int NOT NULL
  )
INSERT INTO #PageIndex ( 
  UserID
  , DashboardID
  , DBRows
  )
   SELECT 
  [WF_UserDBRows].[UserID]
  , [WF_UserDBRows].[DashboardID]
  , [WF_UserDBRows].[DBRows]
   FROM [WF_UserDBRows] 
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
    WHERE ([WF_UserDBRows].[ReminderOnCount] = 1 OR [WF_UserDBRows].[ReminderOnAvg] = 1 OR [WF_UserDBRows].[ReminderOnMax] = 1 ) 
    AND  ( 1 = case when [WF_UserDBRows].[NextRunDate] is NULL then 1  
				else   
					case when DATEADD(dd, DATEDIFF(dd, 0, [WF_UserDBRows].[NextRunDate]), 0)  <= DATEADD(dd, DATEDIFF(dd, 0, getdate()), 0)  then 1 
					else   0 
					end   
                end)   
  EXEC (@LGSQL) 

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

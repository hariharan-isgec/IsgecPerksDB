USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtGreetingsSelectByID]
  @LoginID NVarChar(8),
  @UserID NVarChar(8),
  @SerialNo Int 
  AS
  SELECT
		[GRT_Greetings].[UserID] ,
		[GRT_Greetings].[SerialNo] ,
		[GRT_Greetings].[ToEmailID] ,
		[GRT_Greetings].[ToName] ,
		[GRT_Greetings].[SentOn] ,
		[GRT_Greetings].[UsingGreetingID] ,
		[GRT_Config1].[Description] AS GRT_Config1_Description,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName 
  FROM [GRT_Greetings] 
  LEFT OUTER JOIN [GRT_Config] AS [GRT_Config1]
    ON [GRT_Greetings].[UsingGreetingID] = [GRT_Config1].[GreetingID]
  INNER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [GRT_Greetings].[UserID] = [HRM_Employees2].[CardNo]
  WHERE
  [GRT_Greetings].[UserID] = @UserID
  AND [GRT_Greetings].[SerialNo] = @SerialNo
GO

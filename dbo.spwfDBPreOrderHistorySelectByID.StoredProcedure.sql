USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBPreOrderHistorySelectByID]
  @LoginID NVarChar(8),
  @WFID Int 
  AS
  SELECT
    [WF1_PreOrder_History].* ,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName 
  FROM [WF1_PreOrder_History] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [WF1_PreOrder_History].[UserId] = [aspnet_Users3].[LoginID]
  INNER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [WF1_PreOrder_History].[Buyer] = [aspnet_Users2].[LoginID]
  WHERE
  [WF1_PreOrder_History].[WFID] = @WFID
GO

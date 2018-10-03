USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfUserDashboardsInsert]
  @UserID NVarChar(8),
  @DashboardID Int,
  @Active Bit,
  @ActionAllowed Bit,
  @UpdateAllowed Bit,
  @Return_UserID NVarChar(8) = null OUTPUT, 
  @Return_DashboardID Int = null OUTPUT 
  AS
  INSERT [WF_UserDashboards]
  (
   [UserID]
  ,[DashboardID]
  ,[Active]
  ,[ActionAllowed]
  ,[UpdateAllowed]
  )
  VALUES
  (
   UPPER(@UserID)
  ,@DashboardID
  ,@Active
  ,@ActionAllowed
  ,@UpdateAllowed
  )
  SET @Return_UserID = @UserID
  SET @Return_DashboardID = @DashboardID
GO

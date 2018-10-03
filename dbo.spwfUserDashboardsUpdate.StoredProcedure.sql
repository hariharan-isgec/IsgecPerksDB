USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfUserDashboardsUpdate]
  @Original_UserID NVarChar(8), 
  @Original_DashboardID Int, 
  @UserID NVarChar(8),
  @DashboardID Int,
  @Active Bit,
  @ActionAllowed Bit,
  @UpdateAllowed Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [WF_UserDashboards] SET 
   [UserID] = @UserID
  ,[DashboardID] = @DashboardID
  ,[Active] = @Active
  ,[ActionAllowed] = @ActionAllowed
  ,[UpdateAllowed] = @UpdateAllowed
  WHERE
  [UserID] = @Original_UserID
  AND [DashboardID] = @Original_DashboardID
  SET @RowCount = @@RowCount
GO

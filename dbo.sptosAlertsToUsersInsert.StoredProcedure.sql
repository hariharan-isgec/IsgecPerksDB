USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosAlertsToUsersInsert]
  @ProjectID NVarChar(6),
  @UserID NVarChar(8),
  @Active Bit,
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_UserID NVarChar(8) = null OUTPUT 
  AS
  INSERT [TOS_AlertsToUsers]
  (
   [ProjectID]
  ,[UserID]
  ,[Active]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,UPPER(@UserID)
  ,@Active
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_UserID = @UserID
GO

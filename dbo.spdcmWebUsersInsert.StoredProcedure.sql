USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmWebUsersInsert]
  @UserID NVarChar(20),
  @UserName NVarChar(40),
  @CreatedBy NVarChar(8),
  @ActivateOn DateTime,
  @TillDays Decimal(3),
  @Return_UserID NVarChar(20) = null OUTPUT
  AS
  INSERT [DCM_WebUsers]
  (
   [UserID]
  ,[UserName]
  ,[CreatedBy]
  ,[ActivateOn]
  ,[TillDays]
  )
  VALUES
  (
   @UserID
  ,@UserName
  ,@CreatedBy
  ,@ActivateOn
  ,@TillDays
  )
  SET @Return_UserID = @UserID
GO

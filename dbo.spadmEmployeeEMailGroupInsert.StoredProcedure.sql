USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmEmployeeEMailGroupInsert]
  @CardNo NVarChar(8),
  @EMailGroup NVarChar(50),
  @Return_CardNo NVarChar(8) = null OUTPUT
  AS
  INSERT [HRM_EmployeeEMailGroup]
  (
   [CardNo]
  ,[EMailGroup]
  )
  VALUES
  (
   @CardNo
  ,@EMailGroup
  )
  SET @Return_CardNo = @CardNo
GO

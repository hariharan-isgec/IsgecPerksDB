USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnEmployeeConfigurationInsert]
  @CardNo NVarChar(8),
  @SendVerifyMail Bit,
  @SendApproveMail Bit,
  @AttendanceThroughExcel Bit,
  @Return_CardNo NVarChar(8) = null OUTPUT 
  AS
  INSERT [ATN_EmployeeConfiguration]
  (
   [CardNo]
  ,[SendVerifyMail]
  ,[SendApproveMail]
  ,[AttendanceThroughExcel]
  )
  VALUES
  (
   UPPER(@CardNo)
  ,@SendVerifyMail
  ,@SendApproveMail
  ,@AttendanceThroughExcel
  )
  SET @Return_CardNo = @CardNo
GO

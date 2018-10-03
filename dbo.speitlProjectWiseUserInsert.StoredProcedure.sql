USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlProjectWiseUserInsert]
  @UserID NVarChar(8),
  @ProjectID NVarChar(6),
  @Return_SerialNo BigInt = null OUTPUT 
  AS
  INSERT [EITL_ProjectWiseUser]
  (
   [UserID]
  ,[ProjectID]
  )
  VALUES
  (
   @UserID
  ,@ProjectID
  )
  SET @Return_SerialNo = Scope_Identity()
GO

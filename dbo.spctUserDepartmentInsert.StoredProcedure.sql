USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spctUserDepartmentInsert]
  @UserID NVarChar(8),
  @DepartmentID NVarChar(6),
  @IsActive Bit,
  @Return_UserID NVarChar(8) = null OUTPUT, 
  @Return_DepartmentID NVarChar(6) = null OUTPUT 
  AS
  INSERT [CT_UserDepartment]
  (
   [UserID]
  ,[DepartmentID]
  ,[IsActive]
  )
  VALUES
  (
   UPPER(@UserID)
  ,UPPER(@DepartmentID)
  ,@IsActive
  )
  SET @Return_UserID = @UserID
  SET @Return_DepartmentID = @DepartmentID
GO

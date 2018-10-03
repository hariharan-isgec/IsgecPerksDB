USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmEmployeeGroupUsersInsert]
  @GroupiD Int,
  @CardNo NVarChar(8),
  @Return_GroupiD Int = null OUTPUT, 
  @Return_CardNo NVarChar(8) = null OUTPUT 
  AS
  INSERT [QCM_EmployeeGroupUsers]
  (
   [GroupiD]
  ,[CardNo]
  )
  VALUES
  (
   @GroupiD
  ,UPPER(@CardNo)
  )
  SET @Return_GroupiD = @GroupiD
  SET @Return_CardNo = @CardNo
GO

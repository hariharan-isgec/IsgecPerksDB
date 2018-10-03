USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmOfficesInsert]
  @Description NVarChar(50),
  @Address NVarChar(250),
  @City NVarChar(50),
  @Return_OfficeID Int = null OUTPUT
  AS
  INSERT [HRM_Offices]
  (
   [Description]
  ,[Address]
  ,[City]
  )
  VALUES
  (
   @Description
  ,@Address
  ,@City
  )
  SET @Return_OfficeID = Scope_Identity()
GO

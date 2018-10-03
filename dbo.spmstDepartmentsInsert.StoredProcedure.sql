USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmstDepartmentsInsert]
  @DepartmentID NVarChar(6),
  @Description NVarChar(30),
  @Return_DepartmentID NVarChar(6) = null OUTPUT
  AS
  INSERT [HRM_Departments]
  (
   [DepartmentID]
  ,[Description]
  )
  VALUES
  (
   UPPER(@DepartmentID)
  ,@Description
  )
  SET @Return_DepartmentID = @DepartmentID
GO

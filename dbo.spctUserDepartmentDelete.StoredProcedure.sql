USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spctUserDepartmentDelete]
  @Original_UserID NVarChar(8),
  @Original_DepartmentID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [CT_UserDepartment]
  WHERE
  [CT_UserDepartment].[UserID] = @Original_UserID
  AND [CT_UserDepartment].[DepartmentID] = @Original_DepartmentID
  SET @RowCount = @@RowCount
GO

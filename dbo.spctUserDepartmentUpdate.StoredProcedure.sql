USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spctUserDepartmentUpdate]
  @Original_UserID NVarChar(8), 
  @Original_DepartmentID NVarChar(6), 
  @UserID NVarChar(8),
  @DepartmentID NVarChar(6),
  @IsActive Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [CT_UserDepartment] SET 
   [UserID] = @UserID
  ,[DepartmentID] = @DepartmentID
  ,[IsActive] = @IsActive
  WHERE
  [UserID] = @Original_UserID
  AND [DepartmentID] = @Original_DepartmentID
  SET @RowCount = @@RowCount
GO

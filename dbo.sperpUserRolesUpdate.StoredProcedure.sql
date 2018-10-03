USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpUserRolesUpdate]
  @Original_SerialNo Int, 
  @RequesterID NVarChar(8),
  @ApproverID NVarChar(8),
  @RoleID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [ERP_UserRoles] SET 
   [RequesterID] = @RequesterID
  ,[ApproverID] = @ApproverID
  ,[RoleID] = @RoleID
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO

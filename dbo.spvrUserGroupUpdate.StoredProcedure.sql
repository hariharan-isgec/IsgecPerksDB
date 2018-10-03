USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUserGroupUpdate]
  @Original_SerialNo Int, 
  @UserID NVarChar(8),
  @GroupID Int,
  @RoleID NVarChar(20),
  @OutOfContractApprover Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [VR_UserGroup] SET 
   [UserID] = @UserID
  ,[GroupID] = @GroupID
  ,[RoleID] = @RoleID
  ,[OutOfContractApprover] = @OutOfContractApprover
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO

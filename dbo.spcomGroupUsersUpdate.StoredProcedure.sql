USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomGroupUsersUpdate]
  @Original_GroupID NVarChar(6), 
  @Original_LoginID NVarChar(8), 
  @GroupID NVarChar(6),
  @LoginID NVarChar(8),
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SYS_GroupLogins] SET 
   [GroupID] = @GroupID
  ,[LoginID] = @LoginID
  ,[Active] = @Active
  WHERE
  [GroupID] = @Original_GroupID
  AND [LoginID] = @Original_LoginID
  SET @RowCount = @@RowCount
GO

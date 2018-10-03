USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGUsersUpdate]
  @UserFullName NVarChar(50),
  @Original_UserName NVarChar(20), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [aspnet_Users] SET 
   [UserFullName] = @UserFullName
  WHERE
  [UserName] = @Original_UserName
  SET @RowCount = @@RowCount
GO

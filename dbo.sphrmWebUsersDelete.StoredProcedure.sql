USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmWebUsersDelete]
  @Original_UserName NVarChar(256),
  @RowCount int = null OUTPUT
  AS
  DELETE [aspnet_Users]
  WHERE
  [aspnet_Users].[UserName] = @Original_UserName
  SET @RowCount = @@RowCount
GO

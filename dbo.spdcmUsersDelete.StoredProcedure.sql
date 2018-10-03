USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmUsersDelete]
  @Original_UserName NVarChar(20),
  @RowCount int = null OUTPUT
  AS
  DELETE [aspnet_Users]
  WHERE
  [aspnet_Users].[UserName] = @Original_UserName
  SET @RowCount = @@RowCount
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spgrtUsersDelete]
  @Original_UserID NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [GRT_Users]
  WHERE
  [GRT_Users].[UserID] = @Original_UserID
  SET @RowCount = @@RowCount
GO

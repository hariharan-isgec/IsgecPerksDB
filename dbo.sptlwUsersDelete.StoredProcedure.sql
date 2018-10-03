USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwUsersDelete]
  @Original_LoginID NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [aspnet_Users]
  WHERE
  [aspnet_Users].[LoginID] = @Original_LoginID
  SET @RowCount = @@RowCount
GO

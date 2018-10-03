USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomGroupUsersDelete]
  @Original_GroupID NVarChar(6),
  @Original_LoginID NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [SYS_GroupLogins]
  WHERE
  [SYS_GroupLogins].[GroupID] = @Original_GroupID
  AND [SYS_GroupLogins].[LoginID] = @Original_LoginID
  SET @RowCount = @@RowCount
GO

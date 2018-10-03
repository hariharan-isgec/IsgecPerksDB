USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomGroupsDelete]
  @Original_GroupID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  DELETE [SYS_Groups]
  WHERE
  [SYS_Groups].[GroupID] = @Original_GroupID
  SET @RowCount = @@RowCount
GO

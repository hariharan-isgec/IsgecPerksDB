USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGApplicationsDelete]
  @Original_ApplicationID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SYS_Applications]
  WHERE
  [SYS_Applications].[ApplicationID] = @Original_ApplicationID
  SET @RowCount = @@RowCount
GO

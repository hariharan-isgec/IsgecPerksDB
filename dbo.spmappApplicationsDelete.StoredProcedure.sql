USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmappApplicationsDelete]
  @Original_AppID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [MAPP_Applications]
  WHERE
  [MAPP_Applications].[AppID] = @Original_AppID
  SET @RowCount = @@RowCount
GO

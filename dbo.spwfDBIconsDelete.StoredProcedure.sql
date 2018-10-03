USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBIconsDelete]
  @Original_DBIconID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [WF_DBIcons]
  WHERE
  [WF_DBIcons].[DBIconID] = @Original_DBIconID
  SET @RowCount = @@RowCount
GO

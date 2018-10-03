USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBDataDelete]
  @Original_DBDataID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [WF_DBData]
  WHERE
  [WF_DBData].[DBDataID] = @Original_DBDataID
  SET @RowCount = @@RowCount
GO

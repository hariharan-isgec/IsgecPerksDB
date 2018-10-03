USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowTypesDelete]
  @Original_RowTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [WF_DBRowTypes]
  WHERE
  [WF_DBRowTypes].[RowTypeID] = @Original_RowTypeID
  SET @RowCount = @@RowCount
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfGraphTypesDelete]
  @Original_GraphTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [WF_GraphTypes]
  WHERE
  [WF_GraphTypes].[GraphTypeID] = @Original_GraphTypeID
  SET @RowCount = @@RowCount
GO

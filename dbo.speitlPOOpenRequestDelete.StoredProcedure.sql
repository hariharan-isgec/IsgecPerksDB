USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOOpenRequestDelete]
  @Original_RequestNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [EITL_POOpenRequest]
  WHERE
  [EITL_POOpenRequest].[RequestNo] = @Original_RequestNo
  SET @RowCount = @@RowCount
GO

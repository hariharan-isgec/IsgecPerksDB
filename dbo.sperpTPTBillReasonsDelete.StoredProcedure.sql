USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpTPTBillReasonsDelete]
  @Original_ReasonID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ERP_TPTBillReasons]
  WHERE
  [ERP_TPTBillReasons].[ReasonID] = @Original_ReasonID
  SET @RowCount = @@RowCount
GO

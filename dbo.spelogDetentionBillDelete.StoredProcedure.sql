USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillDelete]
  @Original_IRNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_DetentionBill]
  WHERE
  [ELOG_DetentionBill].[IRNo] = @Original_IRNo
  SET @RowCount = @@RowCount
GO

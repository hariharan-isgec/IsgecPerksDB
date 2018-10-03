USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtBillStatusDelete]
  @Original_BillStatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_BillStatus]
  WHERE
  [SPMT_BillStatus].[BillStatusID] = @Original_BillStatusID
  SET @RowCount = @@RowCount
GO

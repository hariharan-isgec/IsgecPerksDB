USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpTPTBillStatusDelete]
  @Original_BillStatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ERP_TPTBillStatus]
  WHERE
  [ERP_TPTBillStatus].[BillStatusID] = @Original_BillStatusID
  SET @RowCount = @@RowCount
GO

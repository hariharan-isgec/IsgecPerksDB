USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillTypesDelete]
  @Original_BillTypeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_DetentionBillTypes]
  WHERE
  [ELOG_DetentionBillTypes].[BillTypeID] = @Original_BillTypeID
  SET @RowCount = @@RowCount
GO

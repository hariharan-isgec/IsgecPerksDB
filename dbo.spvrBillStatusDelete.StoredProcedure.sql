USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrBillStatusDelete]
  @Original_BillStatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_BillStatus]
  WHERE
  [VR_BillStatus].[BillStatusID] = @Original_BillStatusID
  SET @RowCount = @@RowCount
GO

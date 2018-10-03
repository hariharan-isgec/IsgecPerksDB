USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrTransporterBillDelete]
  @Original_IRNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_TransporterBill]
  WHERE
  [VR_TransporterBill].[IRNo] = @Original_IRNo
  SET @RowCount = @@RowCount
GO

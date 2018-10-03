USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCDetailsDelete]
  @Original_ChallanID NVarChar(20),
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_DCDetails]
  WHERE
  [SPMT_DCDetails].[ChallanID] = @Original_ChallanID
  AND [SPMT_DCDetails].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO

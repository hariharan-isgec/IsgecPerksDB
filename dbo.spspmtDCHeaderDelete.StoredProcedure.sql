USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCHeaderDelete]
  @Original_ChallanID NVarChar(20),
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_DCHeader]
  WHERE
  [SPMT_DCHeader].[ChallanID] = @Original_ChallanID
  SET @RowCount = @@RowCount
GO

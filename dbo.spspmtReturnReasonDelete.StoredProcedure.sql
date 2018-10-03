USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtReturnReasonDelete]
  @Original_ReasonID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_ReturnReason]
  WHERE
  [SPMT_ReturnReason].[ReasonID] = @Original_ReasonID
  SET @RowCount = @@RowCount
GO

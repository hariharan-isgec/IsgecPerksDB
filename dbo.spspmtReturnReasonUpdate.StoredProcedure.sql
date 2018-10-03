USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtReturnReasonUpdate]
  @Original_ReasonID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_ReturnReason] SET 
   [Description] = @Description
  WHERE
  [ReasonID] = @Original_ReasonID
  SET @RowCount = @@RowCount
GO

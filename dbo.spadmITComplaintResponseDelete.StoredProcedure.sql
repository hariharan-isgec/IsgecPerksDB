USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITComplaintResponseDelete]
  @Original_CallID Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_ITComplaintResponse]
  WHERE
  [ADM_ITComplaintResponse].[CallID] = @Original_CallID
  AND [ADM_ITComplaintResponse].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO

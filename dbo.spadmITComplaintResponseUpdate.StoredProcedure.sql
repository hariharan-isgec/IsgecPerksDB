USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITComplaintResponseUpdate]
  @Original_CallID Int, 
  @Original_SerialNo Int, 
  @Remarks NVarChar(250),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_ITComplaintResponse] SET 
   [Remarks] = @Remarks
  WHERE
  [CallID] = @Original_CallID
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmComplaintResponseDelete]
  @Original_CallID Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_ComplaintResponse]
  WHERE
  [ADM_ComplaintResponse].[CallID] = @Original_CallID
  AND [ADM_ComplaintResponse].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscApprovalDelete]
  @Original_RequestID Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SC_Approval]
  WHERE
  [SC_Approval].[RequestID] = @Original_RequestID
  AND [SC_Approval].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO

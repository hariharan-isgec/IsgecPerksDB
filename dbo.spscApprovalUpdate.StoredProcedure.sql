USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscApprovalUpdate]
  @Original_RequestID Int, 
  @Original_SerialNo Int, 
  @RequestID Int,
  @ApproverID NVarChar(8),
  @StatusID NVarChar(2),
  @ApproverRemarks NVarChar(500),
  @ApprovedOn DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [SC_Approval] SET 
   [RequestID] = @RequestID
  ,[ApproverID] = @ApproverID
  ,[StatusID] = @StatusID
  ,[ApproverRemarks] = @ApproverRemarks
  ,[ApprovedOn] = @ApprovedOn
  WHERE
  [RequestID] = @Original_RequestID
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO

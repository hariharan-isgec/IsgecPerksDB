USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnApproveApplicationUpdate]
  @ApplStatusID Int,
  @ApprovalRemark NVarChar(100),
  @ApprovalOn DateTime,
  @Original_LeaveApplID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_ApplHeader] SET 
   [ApplStatusID] = @ApplStatusID
  ,[ApprovalRemark] = @ApprovalRemark
  ,[ApprovalOn] = @ApprovalOn
  WHERE
  [LeaveApplID] = @Original_LeaveApplID
  SET @RowCount = @@RowCount
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnPostApplicationUpdate]
  @ApplStatusID Int,
  @PostedOn DateTime,
  @PostedBy NVarChar(8),
  @PostingRemark NVarChar(100),
  @Original_LeaveApplID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_ApplHeader] SET 
   [ApplStatusID] = @ApplStatusID
  ,[PostedOn] = @PostedOn
  ,[PostedBy] = @PostedBy
  ,[PostingRemark] = @PostingRemark
  WHERE
  [LeaveApplID] = @Original_LeaveApplID
  SET @RowCount = @@RowCount
GO

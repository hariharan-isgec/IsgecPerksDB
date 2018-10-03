USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCostSheetUpdate]
  @Original_ProjectGroupID Int, 
  @Original_FinYear Int, 
  @Original_Quarter Int, 
  @Original_Revision Int, 
  @ProjectGroupID Int,
  @FinYear Int,
  @Quarter Int,
  @Revision Int,
  @StatusID Int,
  @AutoUpdateERPData Bit,
  @LockERPData Bit,
  @LockAdjustmentEntry Bit,
  @Remarks NVarChar(250),
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @ApproverRemarks NVarChar(250),
  @ApprovedBy NVarChar(8),
  @ApprovedOn DateTime,
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_CostSheet] SET 
   [ProjectGroupID] = @ProjectGroupID
  ,[FinYear] = @FinYear
  ,[Quarter] = @Quarter
  ,[Revision] = @Revision
  ,[StatusID] = @StatusID
  ,[AutoUpdateERPData] = @AutoUpdateERPData
  ,[LockERPData] = @LockERPData
  ,[LockAdjustmentEntry] = @LockAdjustmentEntry
  ,[Remarks] = @Remarks
  ,[CreatedBy] = @CreatedBy
  ,[CreatedOn] = @CreatedOn
  ,[ApproverRemarks] = @ApproverRemarks
  ,[ApprovedBy] = @ApprovedBy
  ,[ApprovedOn] = @ApprovedOn
  WHERE
  [ProjectGroupID] = @Original_ProjectGroupID
  AND [FinYear] = @Original_FinYear
  AND [Quarter] = @Original_Quarter
  AND [Revision] = @Original_Revision
  SET @RowCount = @@RowCount
GO

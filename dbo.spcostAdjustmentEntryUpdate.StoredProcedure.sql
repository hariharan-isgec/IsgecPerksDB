USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostAdjustmentEntryUpdate]
  @Original_ProjectGroupID Int, 
  @Original_FinYear Int, 
  @Original_Quarter Int, 
  @Original_Revision Int, 
  @Original_AdjustmentSerialNo Int, 
  @ProjectID NVarChar(6),
  @CrGLCode NVarChar(7),
  @DrGLCode NVarChar(7),
  @Amount Decimal(14,2),
  @Active Bit,
  @Remarks NVarChar(250),
  @FinYear Int,
  @ProjectGroupID Int,
  @Revision Int,
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @Quarter Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_AdjustmentEntry] SET 
   [ProjectID] = @ProjectID
  ,[CrGLCode] = @CrGLCode
  ,[DrGLCode] = @DrGLCode
  ,[Amount] = @Amount
  ,[Active] = @Active
  ,[Remarks] = @Remarks
  ,[FinYear] = @FinYear
  ,[ProjectGroupID] = @ProjectGroupID
  ,[Revision] = @Revision
  ,[CreatedBy] = @CreatedBy
  ,[CreatedOn] = @CreatedOn
  ,[Quarter] = @Quarter
  WHERE
  [ProjectGroupID] = @Original_ProjectGroupID
  AND [FinYear] = @Original_FinYear
  AND [Quarter] = @Original_Quarter
  AND [Revision] = @Original_Revision
  AND [AdjustmentSerialNo] = @Original_AdjustmentSerialNo
  SET @RowCount = @@RowCount
GO

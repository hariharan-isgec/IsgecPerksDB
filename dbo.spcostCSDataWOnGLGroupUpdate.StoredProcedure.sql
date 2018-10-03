USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCSDataWOnGLGroupUpdate]
  @Original_ProjectGroupID Int, 
  @Original_FinYear Int, 
  @Original_Quarter Int, 
  @Original_Revision Int, 
  @Original_WorkOrderTypeID Int, 
  @Original_GLGroupID Int, 
  @ProjectGroupID Int,
  @FinYear Int,
  @Quarter Int,
  @Revision Int,
  @WorkOrderTypeID Int,
  @GLGroupID Int,
  @CrAmount Decimal(14,2),
  @DrAmount Decimal(14,2),
  @Amount Decimal(14,2),
  @CrFC Decimal(14,2),
  @DrFC Decimal(14,2),
  @NetFC Decimal(14,2),
  @FC NVarchar(10),
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_CSDataWOnGLGroup] SET 
   [ProjectGroupID] = @ProjectGroupID
  ,[FinYear] = @FinYear
  ,[Quarter] = @Quarter
  ,[Revision] = @Revision
  ,[WorkOrderTypeID] = @WorkOrderTypeID
  ,[GLGroupID] = @GLGroupID
  ,[CrAmount] = @CrAmount
  ,[DrAmount] = @DrAmount
  ,[Amount] = @Amount
  ,[CrFC] = @CrFC
  ,[DrFC] = @DrFC
  ,[NetFC] = @NetFC
  ,[FC] = @FC
  WHERE
  [ProjectGroupID] = @Original_ProjectGroupID
  AND [FinYear] = @Original_FinYear
  AND [Quarter] = @Original_Quarter
  AND [Revision] = @Original_Revision
  AND [WorkOrderTypeID] = @Original_WorkOrderTypeID
  AND [GLGroupID] = @Original_GLGroupID
  SET @RowCount = @@RowCount
GO

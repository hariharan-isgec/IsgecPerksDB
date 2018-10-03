USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostCSDataWOnGLGroupInsert]
  @ProjectGroupID Int,
  @FinYear Int,
  @Quarter Int,
  @Revision Int,
  @WorkOrderTypeID Int,
  @GLGroupID Int,
  @CrAmount Decimal(14,2),
  @DrAmount Decimal(14,2),
  @Amount Decimal(14,2),
  @Return_ProjectGroupID Int = null OUTPUT, 
  @Return_FinYear Int = null OUTPUT, 
  @Return_Quarter Int = null OUTPUT, 
  @Return_Revision Int = null OUTPUT, 
  @Return_WorkOrderTypeID Int = null OUTPUT, 
  @Return_GLGroupID Int = null OUTPUT 
  AS
  INSERT [COST_CSDataWOnGLGroup]
  (
   [ProjectGroupID]
  ,[FinYear]
  ,[Quarter]
  ,[Revision]
  ,[WorkOrderTypeID]
  ,[GLGroupID]
  ,[CrAmount]
  ,[DrAmount]
  ,[Amount]
  )
  VALUES
  (
   @ProjectGroupID
  ,@FinYear
  ,@Quarter
  ,@Revision
  ,@WorkOrderTypeID
  ,@GLGroupID
  ,@CrAmount
  ,@DrAmount
  ,@Amount
  )
  SET @Return_ProjectGroupID = @ProjectGroupID
  SET @Return_FinYear = @FinYear
  SET @Return_Quarter = @Quarter
  SET @Return_Revision = @Revision
  SET @Return_WorkOrderTypeID = @WorkOrderTypeID
  SET @Return_GLGroupID = @GLGroupID
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectsInputInsert]
  @ProjectGroupID Int,
  @StatusID Int,
  @FinYear Int,
  @Quarter Int,
  @CurrencyGOV NVarChar(6),
  @GroupOrderValue Decimal(14,2),
  @CFforGOV Decimal(10,4),
  @GroupOrderValueINR Decimal(14,2),
  @CurrencyPR NVarChar(6),
  @CFforPR Decimal(10,4),
  @ProjectRevenue Decimal(14,2),
  @ProjectMargin Decimal(14,2),
  @ExportIncentive Decimal(14,2),
  @Remarks NVarChar(250),
  @CreatedOn DateTime,
  @ApproverRemarks NVarChar(250),
  @CreatedBy NVarChar(8),
  @CFforBalanceCalculationByAC Decimal(10,4),
  @ReceivedBy NVarChar(8),
  @ReceivedOn DateTime,
  @ReceiverRemarks NVarChar(250),
  @ApprovedBy NVarChar(8),
  @ApprovedOn DateTime,
  @CurrencyPRByAC NVarChar(6),
  @ProjectRevenueByAC Decimal(14,2),
  @ExportIncentiveINR Decimal(14,2),
  @ProjectRevenueINR Decimal(14,2),
  @ProjectMarginINR Decimal(14,2),
  @ProjectMarginByAC Decimal(14,2),
  @ProjectMarginByACINR Decimal(14,2),
  @ExportIncentiveByACINR Decimal(14,2),
  @ProjectRevenueByACINR Decimal(14,2),
  @ExportIncentiveByAC Decimal(14,2),
  @CFforPRByAC Decimal(10,4),
  @Return_ProjectGroupID Int = null OUTPUT, 
  @Return_FinYear Int = null OUTPUT, 
  @Return_Quarter Int = null OUTPUT 
  AS
  INSERT [COST_ProjectsInput]
  (
   [ProjectGroupID]
  ,[StatusID]
  ,[FinYear]
  ,[Quarter]
  ,[CurrencyGOV]
  ,[GroupOrderValue]
  ,[CFforGOV]
  ,[GroupOrderValueINR]
  ,[CurrencyPR]
  ,[CFforPR]
  ,[ProjectRevenue]
  ,[ProjectMargin]
  ,[ExportIncentive]
  ,[Remarks]
  ,[CreatedOn]
  ,[ApproverRemarks]
  ,[CreatedBy]
  ,[CFforBalanceCalculationByAC]
  ,[ReceivedBy]
  ,[ReceivedOn]
  ,[ReceiverRemarks]
  ,[ApprovedBy]
  ,[ApprovedOn]
  ,[CurrencyPRByAC]
  ,[ProjectRevenueByAC]
  ,[ExportIncentiveINR]
  ,[ProjectRevenueINR]
  ,[ProjectMarginINR]
  ,[ProjectMarginByAC]
  ,[ProjectMarginByACINR]
  ,[ExportIncentiveByACINR]
  ,[ProjectRevenueByACINR]
  ,[ExportIncentiveByAC]
  ,[CFforPRByAC]
  )
  VALUES
  (
   @ProjectGroupID
  ,@StatusID
  ,@FinYear
  ,@Quarter
  ,@CurrencyGOV
  ,@GroupOrderValue
  ,@CFforGOV
  ,@GroupOrderValueINR
  ,@CurrencyPR
  ,@CFforPR
  ,@ProjectRevenue
  ,@ProjectMargin
  ,@ExportIncentive
  ,@Remarks
  ,@CreatedOn
  ,@ApproverRemarks
  ,@CreatedBy
  ,@CFforBalanceCalculationByAC
  ,@ReceivedBy
  ,@ReceivedOn
  ,@ReceiverRemarks
  ,@ApprovedBy
  ,@ApprovedOn
  ,@CurrencyPRByAC
  ,@ProjectRevenueByAC
  ,@ExportIncentiveINR
  ,@ProjectRevenueINR
  ,@ProjectMarginINR
  ,@ProjectMarginByAC
  ,@ProjectMarginByACINR
  ,@ExportIncentiveByACINR
  ,@ProjectRevenueByACINR
  ,@ExportIncentiveByAC
  ,@CFforPRByAC
  )
  SET @Return_ProjectGroupID = @ProjectGroupID
  SET @Return_FinYear = @FinYear
  SET @Return_Quarter = @Quarter
GO

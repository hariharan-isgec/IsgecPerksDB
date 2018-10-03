USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectsInputUpdate]
  @Original_ProjectGroupID Int, 
  @Original_FinYear Int, 
  @Original_Quarter Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_ProjectsInput] SET 
   [ProjectGroupID] = @ProjectGroupID
  ,[StatusID] = @StatusID
  ,[FinYear] = @FinYear
  ,[Quarter] = @Quarter
  ,[CurrencyGOV] = @CurrencyGOV
  ,[GroupOrderValue] = @GroupOrderValue
  ,[CFforGOV] = @CFforGOV
  ,[GroupOrderValueINR] = @GroupOrderValueINR
  ,[CurrencyPR] = @CurrencyPR
  ,[CFforPR] = @CFforPR
  ,[ProjectRevenue] = @ProjectRevenue
  ,[ProjectMargin] = @ProjectMargin
  ,[ExportIncentive] = @ExportIncentive
  ,[Remarks] = @Remarks
  ,[CreatedOn] = @CreatedOn
  ,[ApproverRemarks] = @ApproverRemarks
  ,[CreatedBy] = @CreatedBy
  ,[CFforBalanceCalculationByAC] = @CFforBalanceCalculationByAC
  ,[ReceivedBy] = @ReceivedBy
  ,[ReceivedOn] = @ReceivedOn
  ,[ReceiverRemarks] = @ReceiverRemarks
  ,[ApprovedBy] = @ApprovedBy
  ,[ApprovedOn] = @ApprovedOn
  ,[CurrencyPRByAC] = @CurrencyPRByAC
  ,[ProjectRevenueByAC] = @ProjectRevenueByAC
  ,[ExportIncentiveINR] = @ExportIncentiveINR
  ,[ProjectRevenueINR] = @ProjectRevenueINR
  ,[ProjectMarginINR] = @ProjectMarginINR
  ,[ProjectMarginByAC] = @ProjectMarginByAC
  ,[ProjectMarginByACINR] = @ProjectMarginByACINR
  ,[ExportIncentiveByACINR] = @ExportIncentiveByACINR
  ,[ProjectRevenueByACINR] = @ProjectRevenueByACINR
  ,[ExportIncentiveByAC] = @ExportIncentiveByAC
  ,[CFforPRByAC] = @CFforPRByAC
  WHERE
  [ProjectGroupID] = @Original_ProjectGroupID
  AND [FinYear] = @Original_FinYear
  AND [Quarter] = @Original_Quarter
  SET @RowCount = @@RowCount
GO

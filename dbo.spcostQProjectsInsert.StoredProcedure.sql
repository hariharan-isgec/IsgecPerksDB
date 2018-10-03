USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostQProjectsInsert]
  @ProjectID NVarChar(6),
  @Description NVarChar(60),
  @FinYear Int,
  @Quarter Int,
  @ProjectTypeID NVarChar(10),
  @WorkOrderTypeID Int,
  @DivisionID Int,
  @CurrencyID NVarChar(6),
  @CFforPOV Decimal(10,6),
  @ProjectOrderValue Decimal(12,2),
  @ProjectCost Decimal(12,2),
  @MarginCurrentYear Decimal(12,2),
  @WarrantyPercentage Decimal(6,2),
  @ProjectOrderValueINR Decimal(12,2),
  @MarginCurrentYearINR Decimal(12,2),
  @ProjectCostINR Decimal(12,2),
  @BusinessPartnerID NVarChar(9),
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_FinYear Int = null OUTPUT, 
  @Return_Quarter Int = null OUTPUT 
  AS
  INSERT [COST_Projects]
  (
   [ProjectID]
  ,[Description]
  ,[FinYear]
  ,[Quarter]
  ,[ProjectTypeID]
  ,[WorkOrderTypeID]
  ,[DivisionID]
  ,[CurrencyID]
  ,[CFforPOV]
  ,[ProjectOrderValue]
  ,[ProjectCost]
  ,[MarginCurrentYear]
  ,[WarrantyPercentage]
  ,[ProjectOrderValueINR]
  ,[MarginCurrentYearINR]
  ,[ProjectCostINR]
  ,[BusinessPartnerID]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,@Description
  ,@FinYear
  ,@Quarter
  ,@ProjectTypeID
  ,@WorkOrderTypeID
  ,@DivisionID
  ,@CurrencyID
  ,@CFforPOV
  ,@ProjectOrderValue
  ,@ProjectCost
  ,@MarginCurrentYear
  ,@WarrantyPercentage
  ,@ProjectOrderValueINR
  ,@MarginCurrentYearINR
  ,@ProjectCostINR
  ,@BusinessPartnerID
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_FinYear = @FinYear
  SET @Return_Quarter = @Quarter
GO

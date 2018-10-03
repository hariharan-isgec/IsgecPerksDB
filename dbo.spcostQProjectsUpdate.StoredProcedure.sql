USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostQProjectsUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_FinYear Int, 
  @Original_Quarter Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_Projects] SET 
   [ProjectID] = @ProjectID
  ,[Description] = @Description
  ,[FinYear] = @FinYear
  ,[Quarter] = @Quarter
  ,[ProjectTypeID] = @ProjectTypeID
  ,[WorkOrderTypeID] = @WorkOrderTypeID
  ,[DivisionID] = @DivisionID
  ,[CurrencyID] = @CurrencyID
  ,[CFforPOV] = @CFforPOV
  ,[ProjectOrderValue] = @ProjectOrderValue
  ,[ProjectCost] = @ProjectCost
  ,[MarginCurrentYear] = @MarginCurrentYear
  ,[WarrantyPercentage] = @WarrantyPercentage
  ,[ProjectOrderValueINR] = @ProjectOrderValueINR
  ,[MarginCurrentYearINR] = @MarginCurrentYearINR
  ,[ProjectCostINR] = @ProjectCostINR
  ,[BusinessPartnerID] = @BusinessPartnerID
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [FinYear] = @Original_FinYear
  AND [Quarter] = @Original_Quarter
  SET @RowCount = @@RowCount
GO

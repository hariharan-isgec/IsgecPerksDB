USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostProjectsUpdate]
  @Original_ProjectID NVarChar(6), 
  @ProjectCost Decimal(12,2),
  @ProjectCostINR Decimal(12,2),
  @MarginCurrentYear Decimal(12,2),
  @MarginCurrentYearINR Decimal(12,2),
  @Description NVarChar(60),
  @ProjectTypeID NVarChar(10),
  @ProjectOrderValue Decimal(12,2),
  @DivisionID Int,
  @CurrencyID NVarChar(6),
  @WarrantyPercentage Decimal(6,2),
  @CFforPOV Decimal(10,4),
  @ProjectID NVarChar(6),
  @WorkOrderTypeID Int,
  @ProjectOrderValueINR Decimal(12,2),
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_Projects] SET 
   [ProjectCost] = @ProjectCost
  ,[ProjectCostINR] = @ProjectCostINR
  ,[MarginCurrentYear] = @MarginCurrentYear
  ,[MarginCurrentYearINR] = @MarginCurrentYearINR
  ,[Description] = @Description
  ,[ProjectTypeID] = @ProjectTypeID
  ,[ProjectOrderValue] = @ProjectOrderValue
  ,[DivisionID] = @DivisionID
  ,[CurrencyID] = @CurrencyID
  ,[WarrantyPercentage] = @WarrantyPercentage
  ,[CFforPOV] = @CFforPOV
  ,[ProjectID] = @ProjectID
  ,[WorkOrderTypeID] = @WorkOrderTypeID
  ,[ProjectOrderValueINR] = @ProjectOrderValueINR
  WHERE
  [ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO

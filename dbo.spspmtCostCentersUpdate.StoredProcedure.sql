USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtCostCentersUpdate]
  @Original_CostCenterID NVarChar(6), 
  @CostCenterID NVarChar(6),
  @Description NVarChar(50),
  @BaaNCompany NVarChar(10),
  @BaaNLedger NVarChar(20),
  @Location NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [SPMT_CostCenters] SET 
   [CostCenterID] = @CostCenterID
  ,[Description] = @Description
  ,[BaaNCompany] = @BaaNCompany
  ,[BaaNLedger] = @BaaNLedger
  ,[Location] = @Location
  WHERE
  [CostCenterID] = @Original_CostCenterID
  SET @RowCount = @@RowCount
GO

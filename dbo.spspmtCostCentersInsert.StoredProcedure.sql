USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtCostCentersInsert]
  @CostCenterID NVarChar(6),
  @Description NVarChar(50),
  @BaaNCompany NVarChar(10),
  @BaaNLedger NVarChar(20),
  @Location NVarChar(50),
  @Return_CostCenterID NVarChar(6) = null OUTPUT 
  AS
  INSERT [SPMT_CostCenters]
  (
   [CostCenterID]
  ,[Description]
  ,[BaaNCompany]
  ,[BaaNLedger]
  ,[Location]
  )
  VALUES
  (
   UPPER(@CostCenterID)
  ,@Description
  ,@BaaNCompany
  ,@BaaNLedger
  ,@Location
  )
  SET @Return_CostCenterID = @CostCenterID
GO

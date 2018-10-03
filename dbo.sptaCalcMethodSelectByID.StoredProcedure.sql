USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCalcMethodSelectByID]
  @LoginID NVarChar(8),
  @CalculationTypeID NVarChar(10) 
  AS
  SELECT
		[TA_CalcMethod].[CalculationTypeID] ,
		[TA_CalcMethod].[CalculationDescription]  
  FROM [TA_CalcMethod] 
  WHERE
  [TA_CalcMethod].[CalculationTypeID] = @CalculationTypeID
GO

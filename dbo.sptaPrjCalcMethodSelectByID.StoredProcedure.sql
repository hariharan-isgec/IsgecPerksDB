USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaPrjCalcMethodSelectByID]
  @LoginID NVarChar(8),
  @ProjectCalcID Int 
  AS
  SELECT
		[TA_PrjCalcMethod].[ProjectCalcID] ,
		[TA_PrjCalcMethod].[Description]  
  FROM [TA_PrjCalcMethod] 
  WHERE
  [TA_PrjCalcMethod].[ProjectCalcID] = @ProjectCalcID
GO

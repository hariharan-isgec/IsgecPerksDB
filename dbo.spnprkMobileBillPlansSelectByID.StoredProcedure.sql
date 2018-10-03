USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkMobileBillPlansSelectByID]
  @LoginID NVarChar(8),
  @MobileBillPlanID Int 
  AS
  SELECT
    [PRK_MobileBillPlans].*  
  FROM [PRK_MobileBillPlans] 
  WHERE
  [PRK_MobileBillPlans].[MobileBillPlanID] = @MobileBillPlanID
GO

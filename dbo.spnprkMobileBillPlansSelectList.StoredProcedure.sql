USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkMobileBillPlansSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PRK_MobileBillPlans].*  
  FROM [PRK_MobileBillPlans] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'MobileBillPlanID' THEN [PRK_MobileBillPlans].[MobileBillPlanID] END,
     CASE @OrderBy WHEN 'MobileBillPlanID DESC' THEN [PRK_MobileBillPlans].[MobileBillPlanID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PRK_MobileBillPlans].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PRK_MobileBillPlans].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

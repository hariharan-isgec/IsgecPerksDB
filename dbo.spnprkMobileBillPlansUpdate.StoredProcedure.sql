USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkMobileBillPlansUpdate]
  @Original_MobileBillPlanID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_MobileBillPlans] SET 
   [Description] = @Description
  WHERE
  [MobileBillPlanID] = @Original_MobileBillPlanID
  SET @RowCount = @@RowCount
GO

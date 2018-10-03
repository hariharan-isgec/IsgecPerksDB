USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkMobileBillPlansDelete]
  @Original_MobileBillPlanID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_MobileBillPlans]
  WHERE
  [PRK_MobileBillPlans].[MobileBillPlanID] = @Original_MobileBillPlanID
  SET @RowCount = @@RowCount
GO

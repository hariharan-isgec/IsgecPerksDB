USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkPetrolRateDelete]
  @Original_FinYear Int,
  @Original_MonthID Int,
  @Original_LocationID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_PetrolRate]
  WHERE
  [PRK_PetrolRate].[FinYear] = @Original_FinYear
  AND [PRK_PetrolRate].[MonthID] = @Original_MonthID
  AND [PRK_PetrolRate].[LocationID] = @Original_LocationID
  SET @RowCount = @@RowCount
GO

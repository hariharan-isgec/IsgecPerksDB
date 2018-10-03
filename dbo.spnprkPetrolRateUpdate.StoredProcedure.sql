USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkPetrolRateUpdate]
  @Original_FinYear Int, 
  @Original_MonthID Int, 
  @Original_LocationID Int, 
  @FinYear Int,
  @MonthID Int,
  @LocationID Int,
  @PetrolRate Decimal(6,2),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_PetrolRate] SET 
   [FinYear] = @FinYear
  ,[MonthID] = @MonthID
  ,[LocationID] = @LocationID
  ,[PetrolRate] = @PetrolRate
  WHERE
  [FinYear] = @Original_FinYear
  AND [MonthID] = @Original_MonthID
  AND [LocationID] = @Original_LocationID
  SET @RowCount = @@RowCount
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkPetrolRateInsert]
  @FinYear Int,
  @MonthID Int,
  @LocationID Int,
  @PetrolRate Decimal(6,2),
  @Return_FinYear Int = null OUTPUT, 
  @Return_MonthID Int = null OUTPUT, 
  @Return_LocationID Int = null OUTPUT 
  AS
  INSERT [PRK_PetrolRate]
  (
   [FinYear]
  ,[MonthID]
  ,[LocationID]
  ,[PetrolRate]
  )
  VALUES
  (
   @FinYear
  ,@MonthID
  ,@LocationID
  ,@PetrolRate
  )
  SET @Return_FinYear = @FinYear
  SET @Return_MonthID = @MonthID
  SET @Return_LocationID = @LocationID
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkMonthsInsert]
  @MonthID Int,
  @MonthName NVarChar(3),
  @Return_MonthID Int = null OUTPUT 
  AS
  INSERT [PRK_Months]
  (
   [MonthID]
  ,[MonthName]
  )
  VALUES
  (
   @MonthID
  ,@MonthName
  )
  SET @Return_MonthID = @MonthID
GO

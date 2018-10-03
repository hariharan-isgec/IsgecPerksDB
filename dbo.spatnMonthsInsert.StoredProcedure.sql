USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnMonthsInsert]
  @MonthID NVarChar(3),
  @ShortName NVarChar(3),
  @Description NVarChar(30),
  @Return_MonthID NVarChar(3) = null OUTPUT
  AS
  INSERT [ATN_Months]
  (
   [MonthID]
  ,[ShortName]
  ,[Description]
  )
  VALUES
  (
   UPPER(@MonthID)
  ,@ShortName
  ,@Description
  )
  SET @Return_MonthID = @MonthID
GO

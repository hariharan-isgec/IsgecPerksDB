USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnFinYearInsert]
  @FinYear NVarChar(4),
  @Description NVarChar(30),
  @StartDate DateTime,
  @EndDate DateTime,
  @Active Bit,
  @Return_FinYear NVarChar(4) = null OUTPUT
  AS
  INSERT [ATN_FinYear]
  (
   [FinYear]
  ,[Description]
  ,[StartDate]
  ,[EndDate]
  ,[Active]
  )
  VALUES
  (
   @FinYear
  ,@Description
  ,@StartDate
  ,@EndDate
  ,@Active
  )
  SET @Return_FinYear = @FinYear
GO

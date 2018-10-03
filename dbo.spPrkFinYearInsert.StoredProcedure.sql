USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkFinYearInsert]
  @Description NVarChar(40),
  @StartDate DateTime,
  @EndDate DateTime,
  @Status NVarChar(5),
  @FinYear Int = null OUTPUT
  AS
  INSERT [PRK_FinYears]
  (
   [Description]
  ,[StartDate]
  ,[EndDate]
  ,[Status]
  )
  VALUES
  (
   @Description
  ,@StartDate
  ,@EndDate
  ,@Status
  )
  SET @FinYear = Scope_Identity()
GO

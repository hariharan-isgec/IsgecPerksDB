USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkFinYearsUpdate]
  @Original_FinYear Int, 
  @Description NVarChar(40),
  @StartDate DateTime,
  @EndDate DateTime,
  @Status NVarChar(5),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_FinYears] SET 
   [Description] = @Description
  ,[StartDate] = @StartDate
  ,[EndDate] = @EndDate
  ,[Status] = @Status
  WHERE
  [FinYear] = @Original_FinYear
  SET @RowCount = @@RowCount
GO

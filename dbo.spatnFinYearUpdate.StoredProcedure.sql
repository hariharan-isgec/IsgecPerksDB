USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnFinYearUpdate]
  @Description NVarChar(30),
  @StartDate DateTime,
  @EndDate DateTime,
  @Active Bit,
  @Original_FinYear NVarChar(4), 
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_FinYear] SET 
   [Description] = @Description
  ,[StartDate] = @StartDate
  ,[EndDate] = @EndDate
  ,[Active] = @Active
  WHERE
  [FinYear] = @Original_FinYear
  SET @RowCount = @@RowCount
GO

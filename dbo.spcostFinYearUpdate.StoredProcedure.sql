USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostFinYearUpdate]
  @Original_FinYear Int, 
  @FinYear Int,
  @Descpription NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [COST_FinYear] SET 
   [FinYear] = @FinYear
  ,[Descpription] = @Descpription
  WHERE
  [FinYear] = @Original_FinYear
  SET @RowCount = @@RowCount
GO

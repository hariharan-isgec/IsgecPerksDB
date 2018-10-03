USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFinYearUpdate]
  @Original_FinYear NVarChar(4), 
  @FinYear NVarChar(4),
  @Description NVarChar(30),
  @Active Bit,
  @PlanningOpen Bit,
  @MidTermOpen Bit,
  @FinalOpen Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [PMS_FinYear] SET 
   [FinYear] = @FinYear
  ,[Description] = @Description
  ,[Active] = @Active
  ,[PlanningOpen] = @PlanningOpen
  ,[MidTermOpen] = @MidTermOpen
  ,[FinalOpen] = @FinalOpen
  WHERE
  [FinYear] = @Original_FinYear
  SET @RowCount = @@RowCount
GO

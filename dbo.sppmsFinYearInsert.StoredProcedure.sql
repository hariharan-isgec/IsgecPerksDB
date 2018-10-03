USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFinYearInsert]
  @FinYear NVarChar(4),
  @Description NVarChar(30),
  @Active Bit,
  @PlanningOpen Bit,
  @MidTermOpen Bit,
  @FinalOpen Bit,
  @Return_FinYear NVarChar(4) = null OUTPUT 
  AS
  INSERT [PMS_FinYear]
  (
   [FinYear]
  ,[Description]
  ,[Active]
  ,[PlanningOpen]
  ,[MidTermOpen]
  ,[FinalOpen]
  )
  VALUES
  (
   UPPER(@FinYear)
  ,@Description
  ,@Active
  ,@PlanningOpen
  ,@MidTermOpen
  ,@FinalOpen
  )
  SET @Return_FinYear = @FinYear
GO

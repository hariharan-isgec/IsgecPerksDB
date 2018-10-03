USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFinYearSelectByID]
  @FinYear NVarChar(4) 
  AS
  SELECT
		[PMS_FinYear].[FinYear] ,
		[PMS_FinYear].[Description] ,
		[PMS_FinYear].[Active] ,
		[PMS_FinYear].[PlanningOpen] ,
		[PMS_FinYear].[MidTermOpen] ,
		[PMS_FinYear].[FinalOpen]  
  FROM [PMS_FinYear] 
  WHERE
  [PMS_FinYear].[FinYear] = @FinYear
GO

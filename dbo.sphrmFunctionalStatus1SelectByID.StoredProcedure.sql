USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus1SelectByID]
  @FunctionalStatusID1 Int
  AS
  SELECT
		[HRM_FunctionalStatus1].[FunctionalStatusID1],
		[HRM_FunctionalStatus1].[Description] 
  FROM [HRM_FunctionalStatus1] 
  WHERE
  [HRM_FunctionalStatus1].[FunctionalStatusID1] = @FunctionalStatusID1
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus4SelectByID]
  @FunctionalStatusID4 Int
  AS
  SELECT
		[HRM_FunctionalStatus4].[FunctionalStatusID4],
		[HRM_FunctionalStatus4].[Description] 
  FROM [HRM_FunctionalStatus4] 
  WHERE
  [HRM_FunctionalStatus4].[FunctionalStatusID4] = @FunctionalStatusID4
GO

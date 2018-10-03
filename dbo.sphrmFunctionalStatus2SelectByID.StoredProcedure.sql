USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus2SelectByID]
  @FunctionalStatusID2 Int
  AS
  SELECT
		[HRM_FunctionalStatus2].[FunctionalStatusID2],
		[HRM_FunctionalStatus2].[Description] 
  FROM [HRM_FunctionalStatus2] 
  WHERE
  [HRM_FunctionalStatus2].[FunctionalStatusID2] = @FunctionalStatusID2
GO

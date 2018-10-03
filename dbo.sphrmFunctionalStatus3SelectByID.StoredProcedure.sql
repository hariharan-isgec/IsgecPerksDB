USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus3SelectByID]
  @FunctionalStatusID3 Int
  AS
  SELECT
		[HRM_FunctionalStatus3].[FunctionalStatusID3],
		[HRM_FunctionalStatus3].[Description] 
  FROM [HRM_FunctionalStatus3] 
  WHERE
  [HRM_FunctionalStatus3].[FunctionalStatusID3] = @FunctionalStatusID3
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmDivisionsSelectByID]
  @DivisionID NVarChar(6)
  AS
  SELECT
		[HRM_Divisions].[DivisionID],
		[HRM_Divisions].[Description] 
  FROM [HRM_Divisions] 
  WHERE
  [HRM_Divisions].[DivisionID] = @DivisionID
GO

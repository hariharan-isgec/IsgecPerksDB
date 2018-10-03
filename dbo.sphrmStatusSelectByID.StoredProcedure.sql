USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmStatusSelectByID]
  @StatusID NVarChar(2)
  AS
  SELECT
		[HRM_Status].[StatusID],
		[HRM_Status].[Description],
		[HRM_Status].[Sequence] 
  FROM [HRM_Status] 
  WHERE
  [HRM_Status].[StatusID] = @StatusID
GO

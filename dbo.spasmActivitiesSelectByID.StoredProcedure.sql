USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmActivitiesSelectByID]
  @ActivityID NVarChar(20) 
  AS
  SELECT
		[ASM_Activities].[ActivityID],
		[ASM_Activities].[Description] 
  FROM [ASM_Activities] 
  WHERE
  [ASM_Activities].[ActivityID] = @ActivityID
GO

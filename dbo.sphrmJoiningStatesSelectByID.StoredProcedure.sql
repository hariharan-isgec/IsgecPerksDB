USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmJoiningStatesSelectByID]
  @JoiningStateID NVarChar(2)
  AS
  SELECT
		[HRM_JoiningStates].[JoiningStateID],
		[HRM_JoiningStates].[Description] 
  FROM [HRM_JoiningStates] 
  WHERE
  [HRM_JoiningStates].[JoiningStateID] = @JoiningStateID
GO

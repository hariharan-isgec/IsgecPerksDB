USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLStatesSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
    [ELOG_IRBLStates].*  
  FROM [ELOG_IRBLStates] 
  WHERE
  [ELOG_IRBLStates].[StatusID] = @StatusID
GO

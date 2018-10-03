USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCStatesSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
    [SPMT_DCStates].*  
  FROM [SPMT_DCStates] 
  WHERE
  [SPMT_DCStates].[StatusID] = @StatusID
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtERPStatesSelectByID]
  @LoginID NVarChar(8),
  @StateID NVarChar(2) 
  AS
  SELECT
    [SPMT_ERPStates].*  
  FROM [SPMT_ERPStates] 
  WHERE
  [SPMT_ERPStates].[StateID] = @StateID
GO

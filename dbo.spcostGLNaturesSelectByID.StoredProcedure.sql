USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLNaturesSelectByID]
  @LoginID NVarChar(8),
  @GLNatureID Int 
  AS
  SELECT
    [COST_GLNatures].*  
  FROM [COST_GLNatures] 
  WHERE
  [COST_GLNatures].[GLNatureID] = @GLNatureID
GO

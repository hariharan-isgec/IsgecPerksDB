USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakMaterialStatesSelectByID]
  @LoginID NVarChar(8),
  @MaterialStateID Int 
  AS
  SELECT
    [VR_MaterialStates].*  
  FROM [VR_MaterialStates] 
  WHERE
  [VR_MaterialStates].[MaterialStateID] = @MaterialStateID
GO

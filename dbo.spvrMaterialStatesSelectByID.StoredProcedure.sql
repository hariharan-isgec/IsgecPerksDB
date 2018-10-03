USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrMaterialStatesSelectByID]
  @LoginID NVarChar(8),
  @MaterialStateID Int 
  AS
  SELECT
		[VR_MaterialStates].[MaterialStateID] ,
		[VR_MaterialStates].[Description]  
  FROM [VR_MaterialStates] 
  WHERE
  [VR_MaterialStates].[MaterialStateID] = @MaterialStateID
GO

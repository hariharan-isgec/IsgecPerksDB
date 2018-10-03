USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlMaterialStateSelectByID]
  @LoginID NVarChar(8),
  @StateID Int 
  AS
  SELECT
		[EITL_MaterialState].[StateID] ,
		[EITL_MaterialState].[Description]  
  FROM [EITL_MaterialState] 
  WHERE
  [EITL_MaterialState].[StateID] = @StateID
GO

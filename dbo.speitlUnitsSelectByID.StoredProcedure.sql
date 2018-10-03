USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlUnitsSelectByID]
  @LoginID NVarChar(8),
  @UnitID NVarChar(3) 
  AS
  SELECT
		[EITL_Units].[UnitID] ,
		[EITL_Units].[Description]  
  FROM [EITL_Units] 
  WHERE
  [EITL_Units].[UnitID] = @UnitID
GO

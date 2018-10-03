USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUnitsSelectByID]
  @LoginID NVarChar(8),
  @UnitID Int 
  AS
  SELECT
		[VR_Units].[UnitID] ,
		[VR_Units].[Description] ,
		[VR_Units].[ConversionFactor]  
  FROM [VR_Units] 
  WHERE
  [VR_Units].[UnitID] = @UnitID
GO

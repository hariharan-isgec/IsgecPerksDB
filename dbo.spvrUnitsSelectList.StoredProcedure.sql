USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUnitsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
	IF (@OrderBy='Size')
		SELECT
			[VR_Units].[UnitID] ,
			[VR_Units].[Description] ,
			[VR_Units].[ConversionFactor]  
		FROM [VR_Units] 
		WHERE UnitSet = 0   
		ORDER BY [VR_Units].[Description]
	ELSE
		SELECT
			[VR_Units].[UnitID] ,
			[VR_Units].[Description] ,
			[VR_Units].[ConversionFactor]  
		FROM [VR_Units] 
		WHERE UnitSet = 1  
		ORDER BY [VR_Units].[Description]

  SET @RecordCount = @@RowCount
GO

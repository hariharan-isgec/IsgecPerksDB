USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaRegionTypesSelectByID]
  @LoginID NVarChar(8),
  @RegionTypeID NVarChar(10) 
  AS
  SELECT
		[TA_RegionTypes].[RegionTypeID] ,
		[TA_RegionTypes].[RegionTypeName]  
  FROM [TA_RegionTypes] 
  WHERE
  [TA_RegionTypes].[RegionTypeID] = @RegionTypeID
GO

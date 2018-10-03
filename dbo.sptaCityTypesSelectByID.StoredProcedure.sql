USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCityTypesSelectByID]
  @LoginID NVarChar(8),
  @CityTypeID NVarChar(6) 
  AS
  SELECT
		[TA_CityTypes].[CityTypeID] ,
		[TA_CityTypes].[CityTypeName]  
  FROM [TA_CityTypes] 
  WHERE
  [TA_CityTypes].[CityTypeID] = @CityTypeID
GO

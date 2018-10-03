USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaTravelTypesSelectByID]
  @LoginID NVarChar(8),
  @TravelTypeID Int 
  AS
  SELECT
		[TA_TravelTypes].[TravelTypeID] ,
		[TA_TravelTypes].[TravelTypeDescription]  
  FROM [TA_TravelTypes] 
  WHERE
  [TA_TravelTypes].[TravelTypeID] = @TravelTypeID
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRegionsSelectByID]
  @LoginID NVarChar(8),
  @RegionID Int 
  AS
  SELECT
		[QCM_Regions].[RegionID] ,
		[QCM_Regions].[RegionName]  
  FROM [QCM_Regions] 
  WHERE
  [QCM_Regions].[RegionID] = @RegionID
GO

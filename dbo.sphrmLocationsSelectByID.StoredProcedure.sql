USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmLocationsSelectByID]
  @LoginID NVarChar(8),
  @LocationID Int 
  AS
  SELECT
    [HRM_Locations].*  
  FROM [HRM_Locations] 
  WHERE
  [HRM_Locations].[LocationID] = @LocationID
GO

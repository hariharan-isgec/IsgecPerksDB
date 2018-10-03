USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmOfficeLocationSelectByID]
  @LoginID NVarChar(8),
  @LocationID Int,
  @OfficeID Int 
  AS
  SELECT
    [HRM_OfficeLocation].* ,
    [HRM_Locations1].[Description] AS HRM_Locations1_Description,
    [HRM_Offices2].[Description] AS HRM_Offices2_Description 
  FROM [HRM_OfficeLocation] 
  INNER JOIN [HRM_Locations] AS [HRM_Locations1]
    ON [HRM_OfficeLocation].[LocationID] = [HRM_Locations1].[LocationID]
  INNER JOIN [HRM_Offices] AS [HRM_Offices2]
    ON [HRM_OfficeLocation].[OfficeID] = [HRM_Offices2].[OfficeID]
  WHERE
  [HRM_OfficeLocation].[LocationID] = @LocationID
  AND [HRM_OfficeLocation].[OfficeID] = @OfficeID
GO

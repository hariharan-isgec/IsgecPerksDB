USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwOfficesSelectByID]
  @LoginID NVarChar(8),
  @OfficeID Int 
  AS
  SELECT
    [HRM_Offices].*  
  FROM [HRM_Offices] 
  WHERE
  [HRM_Offices].[OfficeID] = @OfficeID
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmOfficesSelectByID]
  @OfficeID Int
  AS
  SELECT
		[HRM_Offices].[OfficeID],
		[HRM_Offices].[Description],
		[HRM_Offices].[Address],
		[HRM_Offices].[City] 
  FROM [HRM_Offices] 
  WHERE
  [HRM_Offices].[OfficeID] = @OfficeID
GO

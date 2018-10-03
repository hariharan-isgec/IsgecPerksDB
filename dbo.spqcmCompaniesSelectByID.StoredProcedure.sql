USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmCompaniesSelectByID]
  @LoginID NVarChar(8),
  @CompanyID NVarChar(6) 
  AS
  SELECT
		[HRM_Companies].[CompanyID] ,
		[HRM_Companies].[Description] ,
		[HRM_Companies].[ShortName] ,
		[HRM_Companies].[BaaNID]  
  FROM [HRM_Companies] 
  WHERE
  [HRM_Companies].[CompanyID] = @CompanyID
GO

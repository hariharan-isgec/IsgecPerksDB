USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcomCompaniesSelectByID]
  @LoginID NVarChar(8),
  @CompanyID NVarChar(6) 
  AS
  SELECT
    [HRM_Companies].*  
  FROM [HRM_Companies] 
  WHERE
  [HRM_Companies].[CompanyID] = @CompanyID
GO

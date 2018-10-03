USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostERPGLCodesSelectByID]
  @LoginID NVarChar(8),
  @GLCode NVarChar(7) 
  AS
  SELECT
    [COST_ERPGLCodes].*  
  FROM [COST_ERPGLCodes] 
  WHERE
  [COST_ERPGLCodes].[GLCode] = @GLCode
GO

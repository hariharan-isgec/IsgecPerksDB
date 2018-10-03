USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpApplicationsSelectByID]
  @LoginID NVarChar(8),
  @ApplID Int 
  AS
  SELECT
		[ERP_Applications].[ApplID] ,
		[ERP_Applications].[ApplName]  
  FROM [ERP_Applications] 
  WHERE
  [ERP_Applications].[ApplID] = @ApplID
GO

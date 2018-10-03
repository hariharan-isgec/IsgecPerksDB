USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstSoftwaresSelectByID]
  @SoftwareID NVarChar(15) 
  AS
  SELECT
		[ASM_AstSoftwares].[SoftwareID],
		[ASM_AstSoftwares].[Description] 
  FROM [ASM_AstSoftwares] 
  WHERE
  [ASM_AstSoftwares].[SoftwareID] = @SoftwareID
GO

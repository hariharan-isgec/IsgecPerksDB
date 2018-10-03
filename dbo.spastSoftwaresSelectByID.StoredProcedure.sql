USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastSoftwaresSelectByID]
  @SoftwareID Int
  AS
  SELECT
		[AST_Softwares].[SoftwareID],
		[AST_Softwares].[Description] 
  FROM [AST_Softwares] 
  WHERE
  [AST_Softwares].[SoftwareID] = @SoftwareID
GO

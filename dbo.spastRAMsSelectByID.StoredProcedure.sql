USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastRAMsSelectByID]
  @RamID Int
  AS
  SELECT
		[AST_Rams].[RamID],
		[AST_Rams].[Description] 
  FROM [AST_Rams] 
  WHERE
  [AST_Rams].[RamID] = @RamID
GO

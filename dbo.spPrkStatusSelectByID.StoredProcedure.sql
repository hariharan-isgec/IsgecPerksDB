USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkStatusSelectByID]
  @StatusID Int
  AS
  SELECT
		[PRK_Status].[StatusID],
		[PRK_Status].[Description] 
  FROM [PRK_Status] 
  WHERE
  [PRK_Status].[StatusID] = @StatusID
GO

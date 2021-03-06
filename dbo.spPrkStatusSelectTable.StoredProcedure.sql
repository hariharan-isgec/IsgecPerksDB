USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkStatusSelectTable]
  @OrderBy NVarChar(50)
  AS
  SELECT
		[PRK_Status].[StatusID],
		[PRK_Status].[Description] 
  FROM [PRK_Status] 
  ORDER BY
     CASE @orderBy WHEN 'StatusID' THEN [PRK_Status].[StatusID] END,
     CASE @orderBy WHEN 'StatusID DESC' THEN [PRK_Status].[StatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [PRK_Status].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [PRK_Status].[Description] END DESC
GO

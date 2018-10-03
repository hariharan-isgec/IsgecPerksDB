USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfStatusSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [PSF_Status].*  
  FROM [PSF_Status] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'PSFStatus' THEN [PSF_Status].[PSFStatus] END,
     CASE @OrderBy WHEN 'PSFStatus DESC' THEN [PSF_Status].[PSFStatus] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PSF_Status].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PSF_Status].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfStatusSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,PSFStatus Int NOT NULL
  )
  INSERT INTO #PageIndex (PSFStatus)
  SELECT [PSF_Status].[PSFStatus] FROM [PSF_Status]
 WHERE  
   ( 
         STR(ISNULL([PSF_Status].[PSFStatus], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PSF_Status].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'PSFStatus' THEN [PSF_Status].[PSFStatus] END,
     CASE @OrderBy WHEN 'PSFStatus DESC' THEN [PSF_Status].[PSFStatus] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [PSF_Status].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [PSF_Status].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PSF_Status].*  
  FROM [PSF_Status] 
      INNER JOIN #PageIndex
          ON [PSF_Status].[PSFStatus] = #PageIndex.PSFStatus
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

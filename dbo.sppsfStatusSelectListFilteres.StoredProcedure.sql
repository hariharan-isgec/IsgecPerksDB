USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfStatusSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,PSFStatus Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'PSFStatus'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PSF_Status].[PSFStatus]'
  SET @LGSQL = @LGSQL + ' FROM [PSF_Status] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'PSFStatus' THEN '[PSF_Status].[PSFStatus]'
                        WHEN 'PSFStatus DESC' THEN '[PSF_Status].[PSFStatus] DESC'
                        WHEN 'Description' THEN '[PSF_Status].[Description]'
                        WHEN 'Description DESC' THEN '[PSF_Status].[Description] DESC'
                        ELSE '[PSF_Status].[PSFStatus]'
                    END
  EXEC (@LGSQL)

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

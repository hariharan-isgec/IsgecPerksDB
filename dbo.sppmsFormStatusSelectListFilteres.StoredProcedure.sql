USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormStatusSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FormStatusID NVarChar(30) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'FormStatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PMS_FormStatus].[FormStatusID]'
  SET @LGSQL = @LGSQL + ' FROM [PMS_FormStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FormStatusID' THEN '[PMS_FormStatus].[FormStatusID]'
                        WHEN 'FormStatusID DESC' THEN '[PMS_FormStatus].[FormStatusID] DESC'
                        WHEN 'Description' THEN '[PMS_FormStatus].[Description]'
                        WHEN 'Description DESC' THEN '[PMS_FormStatus].[Description] DESC'
                        ELSE '[PMS_FormStatus].[FormStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PMS_FormStatus].[FormStatusID] ,
		[PMS_FormStatus].[Description]  
  FROM [PMS_FormStatus] 
    	INNER JOIN #PageIndex
          ON [PMS_FormStatus].[FormStatusID] = #PageIndex.FormStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

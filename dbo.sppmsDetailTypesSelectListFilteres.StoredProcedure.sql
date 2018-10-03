USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsDetailTypesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,DetailTypeID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DetailTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PMS_DetailTypes].[DetailTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [PMS_DetailTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DetailTypeID' THEN '[PMS_DetailTypes].[DetailTypeID]'
                        WHEN 'DetailTypeID DESC' THEN '[PMS_DetailTypes].[DetailTypeID] DESC'
                        WHEN 'Description' THEN '[PMS_DetailTypes].[Description]'
                        WHEN 'Description DESC' THEN '[PMS_DetailTypes].[Description] DESC'
                        ELSE '[PMS_DetailTypes].[DetailTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PMS_DetailTypes].[DetailTypeID] ,
		[PMS_DetailTypes].[Description]  
  FROM [PMS_DetailTypes] 
    	INNER JOIN #PageIndex
          ON [PMS_DetailTypes].[DetailTypeID] = #PageIndex.DetailTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

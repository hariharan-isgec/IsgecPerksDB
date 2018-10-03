USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestTypesSelectListFilteres]
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
 ,RequestTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ERP_RequestTypes].[RequestTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [ERP_RequestTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestTypeID' THEN '[ERP_RequestTypes].[RequestTypeID]'
                        WHEN 'RequestTypeID DESC' THEN '[ERP_RequestTypes].[RequestTypeID] DESC'
                        WHEN 'Description' THEN '[ERP_RequestTypes].[Description]'
                        WHEN 'Description DESC' THEN '[ERP_RequestTypes].[Description] DESC'
                        ELSE '[ERP_RequestTypes].[RequestTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ERP_RequestTypes].[RequestTypeID] ,
		[ERP_RequestTypes].[Description]  
  FROM [ERP_RequestTypes] 
    	INNER JOIN #PageIndex
          ON [ERP_RequestTypes].[RequestTypeID] = #PageIndex.RequestTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestStatusSelectListFilteres]
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
 ,StatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'StatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ERP_RequestStatus].[StatusID]'
  SET @LGSQL = @LGSQL + ' FROM [ERP_RequestStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'StatusID' THEN '[ERP_RequestStatus].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[ERP_RequestStatus].[StatusID] DESC'
                        WHEN 'Description' THEN '[ERP_RequestStatus].[Description]'
                        WHEN 'Description DESC' THEN '[ERP_RequestStatus].[Description] DESC'
                        ELSE '[ERP_RequestStatus].[StatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ERP_RequestStatus].[StatusID] ,
		[ERP_RequestStatus].[Description]  
  FROM [ERP_RequestStatus] 
    	INNER JOIN #PageIndex
          ON [ERP_RequestStatus].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

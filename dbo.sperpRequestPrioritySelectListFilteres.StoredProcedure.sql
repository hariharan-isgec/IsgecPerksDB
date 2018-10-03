USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestPrioritySelectListFilteres]
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
 ,PriorityID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'PriorityID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ERP_RequestPriority].[PriorityID]'
  SET @LGSQL = @LGSQL + ' FROM [ERP_RequestPriority] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'PriorityID' THEN '[ERP_RequestPriority].[PriorityID]'
                        WHEN 'PriorityID DESC' THEN '[ERP_RequestPriority].[PriorityID] DESC'
                        WHEN 'Description' THEN '[ERP_RequestPriority].[Description]'
                        WHEN 'Description DESC' THEN '[ERP_RequestPriority].[Description] DESC'
                        ELSE '[ERP_RequestPriority].[PriorityID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ERP_RequestPriority].[PriorityID] ,
		[ERP_RequestPriority].[Description]  
  FROM [ERP_RequestPriority] 
    	INNER JOIN #PageIndex
          ON [ERP_RequestPriority].[PriorityID] = #PageIndex.PriorityID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

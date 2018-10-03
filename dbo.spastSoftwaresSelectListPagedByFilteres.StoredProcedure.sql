USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastSoftwaresSelectListPagedByFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  SoftwareID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (SoftwareID) ' + 
               'SELECT [AST_Softwares].[SoftwareID] FROM [AST_Softwares] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SoftwareID' THEN '[AST_Softwares].[SoftwareID]'
                        WHEN 'SoftwareID DESC' THEN '[AST_Softwares].[SoftwareID] DESC'
                        WHEN 'Description' THEN '[AST_Softwares].[Description]'
                        WHEN 'Description DESC' THEN '[AST_Softwares].[Description] DESC'
                        ELSE '[AST_Softwares].[SoftwareID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[AST_Softwares].[SoftwareID],
		[AST_Softwares].[Description] 
  FROM [AST_Softwares] 
    	INNER JOIN #PageIndex
          ON [AST_Softwares].[SoftwareID] = #PageIndex.SoftwareID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

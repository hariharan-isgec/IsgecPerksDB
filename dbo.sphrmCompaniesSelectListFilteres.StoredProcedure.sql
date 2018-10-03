USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmCompaniesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  CompanyID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (CompanyID) ' + 
               'SELECT [HRM_Companies].[CompanyID] FROM [HRM_Companies] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CompanyID' THEN '[HRM_Companies].[CompanyID]'
                        WHEN 'CompanyID DESC' THEN '[HRM_Companies].[CompanyID] DESC'
                        WHEN 'Description' THEN '[HRM_Companies].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_Companies].[Description] DESC'
                        WHEN 'ShortName' THEN '[HRM_Companies].[ShortName]'
                        WHEN 'ShortName DESC' THEN '[HRM_Companies].[ShortName] DESC'
                        WHEN 'BaaNID' THEN '[HRM_Companies].[BaaNID]'
                        WHEN 'BaaNID DESC' THEN '[HRM_Companies].[BaaNID] DESC'
                        ELSE '[HRM_Companies].[CompanyID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Companies].[CompanyID],
		[HRM_Companies].[Description],
		[HRM_Companies].[ShortName],
		[HRM_Companies].[BaaNID] 
  FROM [HRM_Companies] 
    	INNER JOIN #PageIndex
          ON [HRM_Companies].[CompanyID] = #PageIndex.CompanyID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

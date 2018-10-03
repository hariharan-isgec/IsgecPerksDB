USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptlwDivisionsSelectListFilteres]
  @Filter_DivisionID NVarChar(6),
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
 ,DivisionID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DivisionID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[HRM_Divisions].[DivisionID]'
  SET @LGSQL = @LGSQL + ' FROM [HRM_Divisions] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Divisions].[DivisionHead] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_DivisionID > '') 
    SET @LGSQL = @LGSQL + ' AND [HRM_Divisions].[DivisionID] = ''' + @Filter_DivisionID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DivisionID' THEN '[HRM_Divisions].[DivisionID]'
                        WHEN 'DivisionID DESC' THEN '[HRM_Divisions].[DivisionID] DESC'
                        WHEN 'Description' THEN '[HRM_Divisions].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_Divisions].[Description] DESC'
                        WHEN 'DivisionHead' THEN '[HRM_Divisions].[DivisionHead]'
                        WHEN 'DivisionHead DESC' THEN '[HRM_Divisions].[DivisionHead] DESC'
                        WHEN 'ERP_EU' THEN '[HRM_Divisions].[ERP_EU]'
                        WHEN 'ERP_EU DESC' THEN '[HRM_Divisions].[ERP_EU] DESC'
                        WHEN 'ERP_Div' THEN '[HRM_Divisions].[ERP_Div]'
                        WHEN 'ERP_Div DESC' THEN '[HRM_Divisions].[ERP_Div] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        ELSE '[HRM_Divisions].[DivisionID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [HRM_Divisions].* ,
    [HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName 
  FROM [HRM_Divisions] 
      INNER JOIN #PageIndex
          ON [HRM_Divisions].[DivisionID] = #PageIndex.DivisionID
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Divisions].[DivisionHead] = [HRM_Employees1].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

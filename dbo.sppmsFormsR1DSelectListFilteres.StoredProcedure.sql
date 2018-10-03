USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsFormsR1DSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @FinYear NVarChar(4),
  @CardNo NVarChar(8),
  @DetailTypeID NVarChar(6),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FinYear NVarChar(4) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
 ,SrNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'FinYear'
  SET @LGSQL = @LGSQL + ', CardNo'
  SET @LGSQL = @LGSQL + ', SrNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PMS_FormsD].[FinYear]'
  SET @LGSQL = @LGSQL + ', [PMS_FormsD].[CardNo]'
  SET @LGSQL = @LGSQL + ', [PMS_FormsD].[SrNo]'
  SET @LGSQL = @LGSQL + ' FROM [PMS_FormsD] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [PMS_FormsD].[CardNo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [PMS_DetailTypes] AS [PMS_DetailTypes2]'
  SET @LGSQL = @LGSQL + '    ON [PMS_FormsD].[DetailTypeID] = [PMS_DetailTypes2].[DetailTypeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PMS_FinYear] AS [PMS_FinYear3]'
  SET @LGSQL = @LGSQL + '    ON [PMS_FormsD].[FinYear] = [PMS_FinYear3].[FinYear]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PMS_FormsH] AS [PMS_FormsH4]'
  SET @LGSQL = @LGSQL + '    ON [PMS_FormsD].[FinYear] = [PMS_FormsH4].[FinYear]'
  SET @LGSQL = @LGSQL + '    AND [PMS_FormsD].[CardNo] = [PMS_FormsH4].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [PMS_FormsD].[FinYear] = (''' + @FinYear + ''')'
  SET @LGSQL = @LGSQL + ' AND [PMS_FormsD].[CardNo] = (''' + @CardNo + ''')'
  SET @LGSQL = @LGSQL + ' AND [PMS_FormsD].[DetailTypeID] = (''' + @DetailTypeID + ''')'
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FinYear' THEN '[PMS_FormsD].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[PMS_FormsD].[FinYear] DESC'
                        WHEN 'CardNo' THEN '[PMS_FormsD].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[PMS_FormsD].[CardNo] DESC'
                        WHEN 'SrNo' THEN '[PMS_FormsD].[SrNo]'
                        WHEN 'SrNo DESC' THEN '[PMS_FormsD].[SrNo] DESC'
                        WHEN 'KRA' THEN '[PMS_FormsD].[KRA]'
                        WHEN 'KRA DESC' THEN '[PMS_FormsD].[KRA] DESC'
                        WHEN 'KPI' THEN '[PMS_FormsD].[KPI]'
                        WHEN 'KPI DESC' THEN '[PMS_FormsD].[KPI] DESC'
                        WHEN 'Competancy' THEN '[PMS_FormsD].[Competancy]'
                        WHEN 'Competancy DESC' THEN '[PMS_FormsD].[Competancy] DESC'
                        WHEN 'DetailTypeID' THEN '[PMS_FormsD].[DetailTypeID]'
                        WHEN 'DetailTypeID DESC' THEN '[PMS_FormsD].[DetailTypeID] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'PMS_DetailTypes2_Description' THEN '[PMS_DetailTypes2].[Description]'
                        WHEN 'PMS_DetailTypes2_Description DESC' THEN '[PMS_DetailTypes2].[Description] DESC'
                        WHEN 'PMS_FinYear3_Description' THEN '[PMS_FinYear3].[Description]'
                        WHEN 'PMS_FinYear3_Description DESC' THEN '[PMS_FinYear3].[Description] DESC'
                        ELSE '[PMS_FormsD].[FinYear],[PMS_FormsD].[CardNo],[PMS_FormsD].[SrNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PMS_FormsD].[FinYear] ,
		[PMS_FormsD].[CardNo] ,
		[PMS_FormsD].[SrNo] ,
		[PMS_FormsD].[KRA] ,
		[PMS_FormsD].[KPI] ,
		[PMS_FormsD].[Competancy] ,
		[PMS_FormsD].[DetailTypeID] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[PMS_DetailTypes2].[Description] AS PMS_DetailTypes2_Description,
		[PMS_FinYear3].[Description] AS PMS_FinYear3_Description 
  FROM [PMS_FormsD] 
    	INNER JOIN #PageIndex
          ON [PMS_FormsD].[FinYear] = #PageIndex.FinYear
          AND [PMS_FormsD].[CardNo] = #PageIndex.CardNo
          AND [PMS_FormsD].[SrNo] = #PageIndex.SrNo
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMS_FormsD].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [PMS_DetailTypes] AS [PMS_DetailTypes2]
    ON [PMS_FormsD].[DetailTypeID] = [PMS_DetailTypes2].[DetailTypeID]
  INNER JOIN [PMS_FinYear] AS [PMS_FinYear3]
    ON [PMS_FormsD].[FinYear] = [PMS_FinYear3].[FinYear]
  INNER JOIN [PMS_FormsH] AS [PMS_FormsH4]
    ON [PMS_FormsD].[FinYear] = [PMS_FormsH4].[FinYear]
    AND [PMS_FormsD].[CardNo] = [PMS_FormsH4].[CardNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

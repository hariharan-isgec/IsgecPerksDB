USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnWebPayNewEmpSelectListFilteres]
  @Filter_CardNo VarChar(10),
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
 ,CardNo VarChar(10) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CardNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ATN_WebPayNewEmp].[CardNo]'
  SET @LGSQL = @LGSQL + ' FROM [ATN_WebPayNewEmp] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [ATN_WebPayNewEmp].[CardNo] = ''' + @Filter_CardNo + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CardNo' THEN '[ATN_WebPayNewEmp].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[ATN_WebPayNewEmp].[CardNo] DESC'
                        WHEN 'Salute' THEN '[ATN_WebPayNewEmp].[Salute]'
                        WHEN 'Salute DESC' THEN '[ATN_WebPayNewEmp].[Salute] DESC'
                        WHEN 'Gender' THEN '[ATN_WebPayNewEmp].[Gender]'
                        WHEN 'Gender DESC' THEN '[ATN_WebPayNewEmp].[Gender] DESC'
                        WHEN 'EmployeeName' THEN '[ATN_WebPayNewEmp].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[ATN_WebPayNewEmp].[EmployeeName] DESC'
                        WHEN 'FatherName' THEN '[ATN_WebPayNewEmp].[FatherName]'
                        WHEN 'FatherName DESC' THEN '[ATN_WebPayNewEmp].[FatherName] DESC'
                        WHEN 'CostCompany' THEN '[ATN_WebPayNewEmp].[CostCompany]'
                        WHEN 'CostCompany DESC' THEN '[ATN_WebPayNewEmp].[CostCompany] DESC'
                        WHEN 'Unit' THEN '[ATN_WebPayNewEmp].[Unit]'
                        WHEN 'Unit DESC' THEN '[ATN_WebPayNewEmp].[Unit] DESC'
                        WHEN 'Category' THEN '[ATN_WebPayNewEmp].[Category]'
                        WHEN 'Category DESC' THEN '[ATN_WebPayNewEmp].[Category] DESC'
                        WHEN 'DesignationCode' THEN '[ATN_WebPayNewEmp].[DesignationCode]'
                        WHEN 'DesignationCode DESC' THEN '[ATN_WebPayNewEmp].[DesignationCode] DESC'
                        WHEN 'Designation' THEN '[ATN_WebPayNewEmp].[Designation]'
                        WHEN 'Designation DESC' THEN '[ATN_WebPayNewEmp].[Designation] DESC'
                        WHEN 'DOB' THEN '[ATN_WebPayNewEmp].[DOB]'
                        WHEN 'DOB DESC' THEN '[ATN_WebPayNewEmp].[DOB] DESC'
                        WHEN 'DOJ' THEN '[ATN_WebPayNewEmp].[DOJ]'
                        WHEN 'DOJ DESC' THEN '[ATN_WebPayNewEmp].[DOJ] DESC'
                        WHEN 'DOL' THEN '[ATN_WebPayNewEmp].[DOL]'
                        WHEN 'DOL DESC' THEN '[ATN_WebPayNewEmp].[DOL] DESC'
                        WHEN 'EMail' THEN '[ATN_WebPayNewEmp].[EMail]'
                        WHEN 'EMail DESC' THEN '[ATN_WebPayNewEmp].[EMail] DESC'
                        WHEN 'PFNO' THEN '[ATN_WebPayNewEmp].[PFNO]'
                        WHEN 'PFNO DESC' THEN '[ATN_WebPayNewEmp].[PFNO] DESC'
                        WHEN 'PAN' THEN '[ATN_WebPayNewEmp].[PAN]'
                        WHEN 'PAN DESC' THEN '[ATN_WebPayNewEmp].[PAN] DESC'
                        WHEN 'Department' THEN '[ATN_WebPayNewEmp].[Department]'
                        WHEN 'Department DESC' THEN '[ATN_WebPayNewEmp].[Department] DESC'
                        WHEN 'Finalized' THEN '[ATN_WebPayNewEmp].[Finalized]'
                        WHEN 'Finalized DESC' THEN '[ATN_WebPayNewEmp].[Finalized] DESC'
                        WHEN 'PensionNo' THEN '[ATN_WebPayNewEmp].[PensionNo]'
                        WHEN 'PensionNo DESC' THEN '[ATN_WebPayNewEmp].[PensionNo] DESC'
                        WHEN 'SeatingLocation' THEN '[ATN_WebPayNewEmp].[SeatingLocation]'
                        WHEN 'SeatingLocation DESC' THEN '[ATN_WebPayNewEmp].[SeatingLocation] DESC'
                        ELSE '[ATN_WebPayNewEmp].[CardNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ATN_WebPayNewEmp].*  
  FROM [ATN_WebPayNewEmp] 
      INNER JOIN #PageIndex
          ON [ATN_WebPayNewEmp].[CardNo] = #PageIndex.CardNo
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

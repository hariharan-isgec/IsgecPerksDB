USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnWebPayNewEmpSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,CardNo VarChar(10) NOT NULL
  )
  INSERT INTO #PageIndex (CardNo)
  SELECT [ATN_WebPayNewEmp].[CardNo] FROM [ATN_WebPayNewEmp]
 WHERE  
   ( 
         LOWER(ISNULL([ATN_WebPayNewEmp].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_WebPayNewEmp].[Salute],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_WebPayNewEmp].[Gender],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_WebPayNewEmp].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_WebPayNewEmp].[FatherName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_WebPayNewEmp].[CostCompany],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_WebPayNewEmp].[Unit],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_WebPayNewEmp].[Category],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_WebPayNewEmp].[DesignationCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_WebPayNewEmp].[Designation],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_WebPayNewEmp].[EMail],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_WebPayNewEmp].[PFNO],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_WebPayNewEmp].[PAN],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_WebPayNewEmp].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_WebPayNewEmp].[Finalized],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_WebPayNewEmp].[PensionNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_WebPayNewEmp].[SeatingLocation],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CardNo' THEN [ATN_WebPayNewEmp].[CardNo] END,
     CASE @OrderBy WHEN 'CardNo DESC' THEN [ATN_WebPayNewEmp].[CardNo] END DESC,
     CASE @OrderBy WHEN 'Salute' THEN [ATN_WebPayNewEmp].[Salute] END,
     CASE @OrderBy WHEN 'Salute DESC' THEN [ATN_WebPayNewEmp].[Salute] END DESC,
     CASE @OrderBy WHEN 'Gender' THEN [ATN_WebPayNewEmp].[Gender] END,
     CASE @OrderBy WHEN 'Gender DESC' THEN [ATN_WebPayNewEmp].[Gender] END DESC,
     CASE @OrderBy WHEN 'EmployeeName' THEN [ATN_WebPayNewEmp].[EmployeeName] END,
     CASE @OrderBy WHEN 'EmployeeName DESC' THEN [ATN_WebPayNewEmp].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'FatherName' THEN [ATN_WebPayNewEmp].[FatherName] END,
     CASE @OrderBy WHEN 'FatherName DESC' THEN [ATN_WebPayNewEmp].[FatherName] END DESC,
     CASE @OrderBy WHEN 'CostCompany' THEN [ATN_WebPayNewEmp].[CostCompany] END,
     CASE @OrderBy WHEN 'CostCompany DESC' THEN [ATN_WebPayNewEmp].[CostCompany] END DESC,
     CASE @OrderBy WHEN 'Unit' THEN [ATN_WebPayNewEmp].[Unit] END,
     CASE @OrderBy WHEN 'Unit DESC' THEN [ATN_WebPayNewEmp].[Unit] END DESC,
     CASE @OrderBy WHEN 'Category' THEN [ATN_WebPayNewEmp].[Category] END,
     CASE @OrderBy WHEN 'Category DESC' THEN [ATN_WebPayNewEmp].[Category] END DESC,
     CASE @OrderBy WHEN 'DesignationCode' THEN [ATN_WebPayNewEmp].[DesignationCode] END,
     CASE @OrderBy WHEN 'DesignationCode DESC' THEN [ATN_WebPayNewEmp].[DesignationCode] END DESC,
     CASE @OrderBy WHEN 'Designation' THEN [ATN_WebPayNewEmp].[Designation] END,
     CASE @OrderBy WHEN 'Designation DESC' THEN [ATN_WebPayNewEmp].[Designation] END DESC,
     CASE @OrderBy WHEN 'DOB' THEN [ATN_WebPayNewEmp].[DOB] END,
     CASE @OrderBy WHEN 'DOB DESC' THEN [ATN_WebPayNewEmp].[DOB] END DESC,
     CASE @OrderBy WHEN 'DOJ' THEN [ATN_WebPayNewEmp].[DOJ] END,
     CASE @OrderBy WHEN 'DOJ DESC' THEN [ATN_WebPayNewEmp].[DOJ] END DESC,
     CASE @OrderBy WHEN 'DOL' THEN [ATN_WebPayNewEmp].[DOL] END,
     CASE @OrderBy WHEN 'DOL DESC' THEN [ATN_WebPayNewEmp].[DOL] END DESC,
     CASE @OrderBy WHEN 'EMail' THEN [ATN_WebPayNewEmp].[EMail] END,
     CASE @OrderBy WHEN 'EMail DESC' THEN [ATN_WebPayNewEmp].[EMail] END DESC,
     CASE @OrderBy WHEN 'PFNO' THEN [ATN_WebPayNewEmp].[PFNO] END,
     CASE @OrderBy WHEN 'PFNO DESC' THEN [ATN_WebPayNewEmp].[PFNO] END DESC,
     CASE @OrderBy WHEN 'PAN' THEN [ATN_WebPayNewEmp].[PAN] END,
     CASE @OrderBy WHEN 'PAN DESC' THEN [ATN_WebPayNewEmp].[PAN] END DESC,
     CASE @OrderBy WHEN 'Department' THEN [ATN_WebPayNewEmp].[Department] END,
     CASE @OrderBy WHEN 'Department DESC' THEN [ATN_WebPayNewEmp].[Department] END DESC,
     CASE @OrderBy WHEN 'Finalized' THEN [ATN_WebPayNewEmp].[Finalized] END,
     CASE @OrderBy WHEN 'Finalized DESC' THEN [ATN_WebPayNewEmp].[Finalized] END DESC,
     CASE @OrderBy WHEN 'PensionNo' THEN [ATN_WebPayNewEmp].[PensionNo] END,
     CASE @OrderBy WHEN 'PensionNo DESC' THEN [ATN_WebPayNewEmp].[PensionNo] END DESC,
     CASE @OrderBy WHEN 'SeatingLocation' THEN [ATN_WebPayNewEmp].[SeatingLocation] END,
     CASE @OrderBy WHEN 'SeatingLocation DESC' THEN [ATN_WebPayNewEmp].[SeatingLocation] END DESC 

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

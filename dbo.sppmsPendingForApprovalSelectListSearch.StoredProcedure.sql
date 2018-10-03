USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsPendingForApprovalSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FinYear NVarChar(4) NOT NULL
 ,Apparaiser NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (FinYear, Apparaiser)
  SELECT [PMSv_PendingForApproval].[FinYear], [PMSv_PendingForApproval].[Apparaiser] FROM [PMSv_PendingForApproval]
 WHERE  
      [PMSv_PendingForApproval].[FinYear] = (@FinYear)
   AND ( 
         LOWER(ISNULL([PMSv_PendingForApproval].[FinYear],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMSv_PendingForApproval].[Apparaiser],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PMSv_PendingForApproval].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([PMSv_PendingForApproval].[FormCount], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'FinYear' THEN [PMSv_PendingForApproval].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [PMSv_PendingForApproval].[FinYear] END DESC,
     CASE @OrderBy WHEN 'Apparaiser' THEN [PMSv_PendingForApproval].[Apparaiser] END,
     CASE @OrderBy WHEN 'Apparaiser DESC' THEN [PMSv_PendingForApproval].[Apparaiser] END DESC,
     CASE @OrderBy WHEN 'EmployeeName' THEN [PMSv_PendingForApproval].[EmployeeName] END,
     CASE @OrderBy WHEN 'EmployeeName DESC' THEN [PMSv_PendingForApproval].[EmployeeName] END DESC,
     CASE @OrderBy WHEN 'FormCount' THEN [PMSv_PendingForApproval].[FormCount] END,
     CASE @OrderBy WHEN 'FormCount DESC' THEN [PMSv_PendingForApproval].[FormCount] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[PMSv_PendingForApproval].[FinYear] ,
		[PMSv_PendingForApproval].[Apparaiser] ,
		[PMSv_PendingForApproval].[EmployeeName] ,
		[PMSv_PendingForApproval].[FormCount]  
  FROM [PMSv_PendingForApproval] 
    	INNER JOIN #PageIndex
          ON [PMSv_PendingForApproval].[FinYear] = #PageIndex.FinYear
          AND [PMSv_PendingForApproval].[Apparaiser] = #PageIndex.Apparaiser
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

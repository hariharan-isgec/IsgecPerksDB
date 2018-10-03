USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsPendingForApprovalSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FinYear NVarChar(4) NOT NULL
 ,Apparaiser NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'FinYear'
  SET @LGSQL = @LGSQL + ', Apparaiser'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PMSv_PendingForApproval].[FinYear]'
  SET @LGSQL = @LGSQL + ', [PMSv_PendingForApproval].[Apparaiser]'
  SET @LGSQL = @LGSQL + ' FROM [PMSv_PendingForApproval] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [PMSv_PendingForApproval].[FinYear] = (''' + @FinYear + ''')'
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FinYear' THEN '[PMSv_PendingForApproval].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[PMSv_PendingForApproval].[FinYear] DESC'
                        WHEN 'Apparaiser' THEN '[PMSv_PendingForApproval].[Apparaiser]'
                        WHEN 'Apparaiser DESC' THEN '[PMSv_PendingForApproval].[Apparaiser] DESC'
                        WHEN 'EmployeeName' THEN '[PMSv_PendingForApproval].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[PMSv_PendingForApproval].[EmployeeName] DESC'
                        WHEN 'FormCount' THEN '[PMSv_PendingForApproval].[FormCount]'
                        WHEN 'FormCount DESC' THEN '[PMSv_PendingForApproval].[FormCount] DESC'
                        ELSE '[PMSv_PendingForApproval].[FinYear],[PMSv_PendingForApproval].[Apparaiser]'
                    END
  EXEC (@LGSQL)

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

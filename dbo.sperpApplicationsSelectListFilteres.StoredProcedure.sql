USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpApplicationsSelectListFilteres]
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
 ,ApplID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ApplID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ERP_Applications].[ApplID]'
  SET @LGSQL = @LGSQL + ' FROM [ERP_Applications] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ApplID' THEN '[ERP_Applications].[ApplID]'
                        WHEN 'ApplID DESC' THEN '[ERP_Applications].[ApplID] DESC'
                        WHEN 'ApplName' THEN '[ERP_Applications].[ApplName]'
                        WHEN 'ApplName DESC' THEN '[ERP_Applications].[ApplName] DESC'
                        ELSE '[ERP_Applications].[ApplID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ERP_Applications].[ApplID] ,
		[ERP_Applications].[ApplName]  
  FROM [ERP_Applications] 
    	INNER JOIN #PageIndex
          ON [ERP_Applications].[ApplID] = #PageIndex.ApplID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkMobileBillPlansSelectListFilteres]
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
 ,MobileBillPlanID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'MobileBillPlanID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PRK_MobileBillPlans].[MobileBillPlanID]'
  SET @LGSQL = @LGSQL + ' FROM [PRK_MobileBillPlans] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'MobileBillPlanID' THEN '[PRK_MobileBillPlans].[MobileBillPlanID]'
                        WHEN 'MobileBillPlanID DESC' THEN '[PRK_MobileBillPlans].[MobileBillPlanID] DESC'
                        WHEN 'Description' THEN '[PRK_MobileBillPlans].[Description]'
                        WHEN 'Description DESC' THEN '[PRK_MobileBillPlans].[Description] DESC'
                        ELSE '[PRK_MobileBillPlans].[MobileBillPlanID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PRK_MobileBillPlans].*  
  FROM [PRK_MobileBillPlans] 
      INNER JOIN #PageIndex
          ON [PRK_MobileBillPlans].[MobileBillPlanID] = #PageIndex.MobileBillPlanID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

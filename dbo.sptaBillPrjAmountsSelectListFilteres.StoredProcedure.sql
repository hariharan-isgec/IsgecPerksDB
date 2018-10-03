USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillPrjAmountsSelectListFilteres]
  @Filter_TABillNo Int,
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
 ,TABillNo Int NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TABillNo'
  SET @LGSQL = @LGSQL + ', ProjectID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_BillPrjAmounts].[TABillNo]'
  SET @LGSQL = @LGSQL + ', [TA_BillPrjAmounts].[ProjectID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_BillPrjAmounts] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillPrjAmounts].[ProjectID] = [IDM_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [TA_Bills] AS [TA_Bills2]'
  SET @LGSQL = @LGSQL + '    ON [TA_BillPrjAmounts].[TABillNo] = [TA_Bills2].[TABillNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_TABillNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [TA_BillPrjAmounts].[TABillNo] = ' + STR(@Filter_TABillNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TABillNo' THEN '[TA_BillPrjAmounts].[TABillNo]'
                        WHEN 'TABillNo DESC' THEN '[TA_BillPrjAmounts].[TABillNo] DESC'
                        WHEN 'ProjectID' THEN '[TA_BillPrjAmounts].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[TA_BillPrjAmounts].[ProjectID] DESC'
                        WHEN 'Percentage' THEN '[TA_BillPrjAmounts].[Percentage]'
                        WHEN 'Percentage DESC' THEN '[TA_BillPrjAmounts].[Percentage] DESC'
                        WHEN 'TotalAmountinINR' THEN '[TA_BillPrjAmounts].[TotalAmountinINR]'
                        WHEN 'TotalAmountinINR DESC' THEN '[TA_BillPrjAmounts].[TotalAmountinINR] DESC'
                        WHEN 'IDM_Projects1_Description' THEN '[IDM_Projects1].[Description]'
                        WHEN 'IDM_Projects1_Description DESC' THEN '[IDM_Projects1].[Description] DESC'
                        WHEN 'TA_Bills2_PurposeOfJourney' THEN '[TA_Bills2].[PurposeOfJourney]'
                        WHEN 'TA_Bills2_PurposeOfJourney DESC' THEN '[TA_Bills2].[PurposeOfJourney] DESC'
                        ELSE '[TA_BillPrjAmounts].[TABillNo],[TA_BillPrjAmounts].[ProjectID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_BillPrjAmounts].[TABillNo] ,
		[TA_BillPrjAmounts].[ProjectID] ,
		[TA_BillPrjAmounts].[Percentage] ,
		[TA_BillPrjAmounts].[TotalAmountinINR] ,
		[IDM_Projects1].[Description] AS IDM_Projects1_Description,
		[TA_Bills2].[PurposeOfJourney] AS TA_Bills2_PurposeOfJourney 
  FROM [TA_BillPrjAmounts] 
      INNER JOIN #PageIndex
          ON [TA_BillPrjAmounts].[TABillNo] = #PageIndex.TABillNo
          AND [TA_BillPrjAmounts].[ProjectID] = #PageIndex.ProjectID
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [TA_BillPrjAmounts].[ProjectID] = [IDM_Projects1].[ProjectID]
  INNER JOIN [TA_Bills] AS [TA_Bills2]
    ON [TA_BillPrjAmounts].[TABillNo] = [TA_Bills2].[TABillNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

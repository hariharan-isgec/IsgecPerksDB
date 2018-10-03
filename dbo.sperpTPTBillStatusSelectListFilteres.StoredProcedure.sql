USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpTPTBillStatusSelectListFilteres]
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
 ,BillStatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'BillStatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ERP_TPTBillStatus].[BillStatusID]'
  SET @LGSQL = @LGSQL + ' FROM [ERP_TPTBillStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BillStatusID' THEN '[ERP_TPTBillStatus].[BillStatusID]'
                        WHEN 'BillStatusID DESC' THEN '[ERP_TPTBillStatus].[BillStatusID] DESC'
                        WHEN 'Description' THEN '[ERP_TPTBillStatus].[Description]'
                        WHEN 'Description DESC' THEN '[ERP_TPTBillStatus].[Description] DESC'
                        ELSE '[ERP_TPTBillStatus].[BillStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ERP_TPTBillStatus].[BillStatusID] ,
		[ERP_TPTBillStatus].[Description]  
  FROM [ERP_TPTBillStatus] 
    	INNER JOIN #PageIndex
          ON [ERP_TPTBillStatus].[BillStatusID] = #PageIndex.BillStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

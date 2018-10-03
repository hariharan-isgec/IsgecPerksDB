USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrBillStatusSelectListFilteres]
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
  SET @LGSQL = @LGSQL + '[VR_BillStatus].[BillStatusID]'
  SET @LGSQL = @LGSQL + ' FROM [VR_BillStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BillStatusID' THEN '[VR_BillStatus].[BillStatusID]'
                        WHEN 'BillStatusID DESC' THEN '[VR_BillStatus].[BillStatusID] DESC'
                        WHEN 'Description' THEN '[VR_BillStatus].[Description]'
                        WHEN 'Description DESC' THEN '[VR_BillStatus].[Description] DESC'
                        ELSE '[VR_BillStatus].[BillStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[VR_BillStatus].[BillStatusID] ,
		[VR_BillStatus].[Description]  
  FROM [VR_BillStatus] 
    	INNER JOIN #PageIndex
          ON [VR_BillStatus].[BillStatusID] = #PageIndex.BillStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

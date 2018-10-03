USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpTPTBillReasonsSelectListFilteres]
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
 ,ReasonID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ReasonID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ERP_TPTBillReasons].[ReasonID]'
  SET @LGSQL = @LGSQL + ' FROM [ERP_TPTBillReasons] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ReasonID' THEN '[ERP_TPTBillReasons].[ReasonID]'
                        WHEN 'ReasonID DESC' THEN '[ERP_TPTBillReasons].[ReasonID] DESC'
                        WHEN 'Description' THEN '[ERP_TPTBillReasons].[Description]'
                        WHEN 'Description DESC' THEN '[ERP_TPTBillReasons].[Description] DESC'
                        ELSE '[ERP_TPTBillReasons].[ReasonID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ERP_TPTBillReasons].[ReasonID] ,
		[ERP_TPTBillReasons].[Description]  
  FROM [ERP_TPTBillReasons] 
    	INNER JOIN #PageIndex
          ON [ERP_TPTBillReasons].[ReasonID] = #PageIndex.ReasonID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

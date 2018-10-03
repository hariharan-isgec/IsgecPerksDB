USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmReceivingMediumsSelectListFilteres]
  @Filter_ReceivingMediumID Int,
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
 ,ReceivingMediumID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ReceivingMediumID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QCM_ReceivingMediums].[ReceivingMediumID]'
  SET @LGSQL = @LGSQL + ' FROM [QCM_ReceivingMediums] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ReceivingMediumID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QCM_ReceivingMediums].[ReceivingMediumID] = ' + STR(@Filter_ReceivingMediumID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ReceivingMediumID' THEN '[QCM_ReceivingMediums].[ReceivingMediumID]'
                        WHEN 'ReceivingMediumID DESC' THEN '[QCM_ReceivingMediums].[ReceivingMediumID] DESC'
                        WHEN 'Description' THEN '[QCM_ReceivingMediums].[Description]'
                        WHEN 'Description DESC' THEN '[QCM_ReceivingMediums].[Description] DESC'
                        ELSE '[QCM_ReceivingMediums].[ReceivingMediumID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QCM_ReceivingMediums].[ReceivingMediumID] ,
		[QCM_ReceivingMediums].[Description]  
  FROM [QCM_ReceivingMediums] 
    	INNER JOIN #PageIndex
          ON [QCM_ReceivingMediums].[ReceivingMediumID] = #PageIndex.ReceivingMediumID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

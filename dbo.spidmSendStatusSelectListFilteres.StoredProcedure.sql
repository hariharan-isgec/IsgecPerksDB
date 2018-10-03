USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmSendStatusSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,SendStatusID NVarChar(3) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SendStatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_SendStatus].[SendStatusID]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_SendStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SendStatusID' THEN '[IDM_SendStatus].[SendStatusID]'
                        WHEN 'SendStatusID DESC' THEN '[IDM_SendStatus].[SendStatusID] DESC'
                        WHEN 'Description' THEN '[IDM_SendStatus].[Description]'
                        WHEN 'Description DESC' THEN '[IDM_SendStatus].[Description] DESC'
                        WHEN 'ReceivedBack' THEN '[IDM_SendStatus].[ReceivedBack]'
                        WHEN 'ReceivedBack DESC' THEN '[IDM_SendStatus].[ReceivedBack] DESC'
                        WHEN 'IsItForApproval' THEN '[IDM_SendStatus].[IsItForApproval]'
                        WHEN 'IsItForApproval DESC' THEN '[IDM_SendStatus].[IsItForApproval] DESC'
                        ELSE '[IDM_SendStatus].[SendStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[IDM_SendStatus].[SendStatusID] ,
		[IDM_SendStatus].[Description] ,
		[IDM_SendStatus].[ReceivedBack] ,
		[IDM_SendStatus].[IsItForApproval]  
  FROM [IDM_SendStatus] 
    	INNER JOIN #PageIndex
          ON [IDM_SendStatus].[SendStatusID] = #PageIndex.SendStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

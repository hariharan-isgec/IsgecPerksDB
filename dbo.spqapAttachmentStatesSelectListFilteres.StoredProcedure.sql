USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapAttachmentStatesSelectListFilteres]
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
 ,StatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'StatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QAP_AttachmentStates].[StatusID]'
  SET @LGSQL = @LGSQL + ' FROM [QAP_AttachmentStates] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'StatusID' THEN '[QAP_AttachmentStates].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[QAP_AttachmentStates].[StatusID] DESC'
                        WHEN 'Description' THEN '[QAP_AttachmentStates].[Description]'
                        WHEN 'Description DESC' THEN '[QAP_AttachmentStates].[Description] DESC'
                        ELSE '[QAP_AttachmentStates].[StatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QAP_AttachmentStates].[StatusID] ,
		[QAP_AttachmentStates].[Description]  
  FROM [QAP_AttachmentStates] 
    	INNER JOIN #PageIndex
          ON [QAP_AttachmentStates].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

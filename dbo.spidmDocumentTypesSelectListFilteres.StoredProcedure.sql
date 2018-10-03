USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmDocumentTypesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,DocumentTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'DocumentTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[IDM_DocumentTypes].[DocumentTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [IDM_DocumentTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'DocumentTypeID' THEN '[IDM_DocumentTypes].[DocumentTypeID]'
                        WHEN 'DocumentTypeID DESC' THEN '[IDM_DocumentTypes].[DocumentTypeID] DESC'
                        WHEN 'Description' THEN '[IDM_DocumentTypes].[Description]'
                        WHEN 'Description DESC' THEN '[IDM_DocumentTypes].[Description] DESC'
                        WHEN 'ValidateInPLM' THEN '[IDM_DocumentTypes].[ValidateInPLM]'
                        WHEN 'ValidateInPLM DESC' THEN '[IDM_DocumentTypes].[ValidateInPLM] DESC'
                        WHEN 'BlockIfNotExists' THEN '[IDM_DocumentTypes].[BlockIfNotExists]'
                        WHEN 'BlockIfNotExists DESC' THEN '[IDM_DocumentTypes].[BlockIfNotExists] DESC'
                        WHEN 'OnceForApproval' THEN '[IDM_DocumentTypes].[OnceForApproval]'
                        WHEN 'OnceForApproval DESC' THEN '[IDM_DocumentTypes].[OnceForApproval] DESC'
                        WHEN 'WarnForApproval' THEN '[IDM_DocumentTypes].[WarnForApproval]'
                        WHEN 'WarnForApproval DESC' THEN '[IDM_DocumentTypes].[WarnForApproval] DESC'
                        WHEN 'ImplementReceiptLock' THEN '[IDM_DocumentTypes].[ImplementReceiptLock]'
                        WHEN 'ImplementReceiptLock DESC' THEN '[IDM_DocumentTypes].[ImplementReceiptLock] DESC'
                        ELSE '[IDM_DocumentTypes].[DocumentTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[IDM_DocumentTypes].[DocumentTypeID] ,
		[IDM_DocumentTypes].[Description] ,
		[IDM_DocumentTypes].[ValidateInPLM] ,
		[IDM_DocumentTypes].[BlockIfNotExists] ,
		[IDM_DocumentTypes].[OnceForApproval] ,
		[IDM_DocumentTypes].[WarnForApproval] ,
		[IDM_DocumentTypes].[ImplementReceiptLock]  
  FROM [IDM_DocumentTypes] 
    	INNER JOIN #PageIndex
          ON [IDM_DocumentTypes].[DocumentTypeID] = #PageIndex.DocumentTypeID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

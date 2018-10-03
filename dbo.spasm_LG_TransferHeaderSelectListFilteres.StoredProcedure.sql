USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasm_LG_TransferHeaderSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @TransferStatusID NVarChar(30),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,TransferID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TransferID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ASM_TransferHeader].[TransferID]'  SET @LGSQL = @LGSQL + ' FROM [ASM_TransferHeader] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ASM_AstTransferStatus] AS [ASM_AstTransferStatus1]'
  SET @LGSQL = @LGSQL + '    ON [ASM_TransferHeader].[TransferStatusID] = [ASM_AstTransferStatus1].[TransferStatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Offices] AS [HRM_Offices8]'
  SET @LGSQL = @LGSQL + '    ON [ASM_TransferHeader].[TransferTo] = [HRM_Offices8].[OfficeID]'
  SET @LGSQL = @LGSQL + '  WHERE [ASM_TransferHeader].[TransferStatusID] =  ''' + @TransferStatusID + '''' 
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TransferID' THEN '[ASM_TransferHeader].[TransferID]'
                        WHEN 'TransferID DESC' THEN '[ASM_TransferHeader].[TransferID] DESC'
                        WHEN 'TransferTo' THEN '[ASM_TransferHeader].[TransferTo]'
                        WHEN 'TransferTo DESC' THEN '[ASM_TransferHeader].[TransferTo] DESC'
                        WHEN 'TransferFrom' THEN '[ASM_TransferHeader].[TransferFrom]'
                        WHEN 'TransferFrom DESC' THEN '[ASM_TransferHeader].[TransferFrom] DESC'
                        WHEN 'Returnable' THEN '[ASM_TransferHeader].[Returnable]'
                        WHEN 'Returnable DESC' THEN '[ASM_TransferHeader].[Returnable] DESC'
                        WHEN 'ExpectedDate' THEN '[ASM_TransferHeader].[ExpectedDate]'
                        WHEN 'ExpectedDate DESC' THEN '[ASM_TransferHeader].[ExpectedDate] DESC'
                        WHEN 'TransferRemarks' THEN '[ASM_TransferHeader].[TransferRemarks]'
                        WHEN 'TransferRemarks DESC' THEN '[ASM_TransferHeader].[TransferRemarks] DESC'
                        WHEN 'TransferStatusID' THEN '[ASM_TransferHeader].[TransferStatusID]'
                        WHEN 'TransferStatusID DESC' THEN '[ASM_TransferHeader].[TransferStatusID] DESC'
                        WHEN 'T_TakenBy' THEN '[ASM_TransferHeader].[T_TakenBy]'
                        WHEN 'T_TakenBy DESC' THEN '[ASM_TransferHeader].[T_TakenBy] DESC'
                        WHEN 'T_CreatedBy' THEN '[ASM_TransferHeader].[T_CreatedBy]'
                        WHEN 'T_CreatedBy DESC' THEN '[ASM_TransferHeader].[T_CreatedBy] DESC'
                        WHEN 'T_CreatedOn' THEN '[ASM_TransferHeader].[T_CreatedOn]'
                        WHEN 'T_CreatedOn DESC' THEN '[ASM_TransferHeader].[T_CreatedOn] DESC'
                        WHEN 'CancelledRemarks' THEN '[ASM_TransferHeader].[CancelledRemarks]'
                        WHEN 'CancelledRemarks DESC' THEN '[ASM_TransferHeader].[CancelledRemarks] DESC'
                        WHEN 'ASM_AstTransferStatus1_TransferStatusID' THEN '[ASM_AstTransferStatus1].[TransferStatusID]'
                        WHEN 'ASM_AstTransferStatus1_TransferStatusID DESC' THEN '[ASM_AstTransferStatus1].[TransferStatusID] DESC'
                        WHEN 'ASM_AstTransferStatus1_Description' THEN '[ASM_AstTransferStatus1].[Description]'
                        WHEN 'ASM_AstTransferStatus1_Description DESC' THEN '[ASM_AstTransferStatus1].[Description] DESC'
                        WHEN 'HRM_Offices8_OfficeID' THEN '[HRM_Offices8].[OfficeID]'
                        WHEN 'HRM_Offices8_OfficeID DESC' THEN '[HRM_Offices8].[OfficeID] DESC'
                        WHEN 'HRM_Offices8_Description' THEN '[HRM_Offices8].[Description]'
                        WHEN 'HRM_Offices8_Description DESC' THEN '[HRM_Offices8].[Description] DESC'
                        ELSE '[ASM_TransferHeader].[TransferID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ASM_TransferHeader].[TransferID],
		[ASM_TransferHeader].[TransferTo],
		[ASM_TransferHeader].[TransferFrom],
		[ASM_TransferHeader].[Returnable],
		[ASM_TransferHeader].[ExpectedDate],
		[ASM_TransferHeader].[TransferRemarks],
		[ASM_TransferHeader].[TransferStatusID],
		[ASM_TransferHeader].[T_TakenBy],
		[ASM_TransferHeader].[T_CreatedBy],
		[ASM_TransferHeader].[T_CreatedOn],
		[ASM_TransferHeader].[CancelledRemarks],
		[ASM_AstTransferStatus1].[TransferStatusID] AS ASM_AstTransferStatus1_TransferStatusID,
		[ASM_AstTransferStatus1].[Description] AS ASM_AstTransferStatus1_Description,
		[HRM_Offices8].[OfficeID] AS HRM_Offices8_OfficeID,
		[HRM_Offices8].[Description] AS HRM_Offices8_Description 
  FROM [ASM_TransferHeader] 
    	INNER JOIN #PageIndex
          ON [ASM_TransferHeader].[TransferID] = #PageIndex.TransferID
  LEFT OUTER JOIN [ASM_AstTransferStatus] AS [ASM_AstTransferStatus1]
    ON [ASM_TransferHeader].[TransferStatusID] = [ASM_AstTransferStatus1].[TransferStatusID]
  INNER JOIN [HRM_Offices] AS [HRM_Offices8]
    ON [ASM_TransferHeader].[TransferTo] = [HRM_Offices8].[OfficeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

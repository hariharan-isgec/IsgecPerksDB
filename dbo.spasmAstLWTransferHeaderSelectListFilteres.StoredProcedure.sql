USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWTransferHeaderSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
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
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
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
                        WHEN 'T_TakenBy' THEN '[ASM_TransferHeader].[T_TakenBy]'
                        WHEN 'T_TakenBy DESC' THEN '[ASM_TransferHeader].[T_TakenBy] DESC'
                        WHEN 'TransferStatusID' THEN '[ASM_TransferHeader].[TransferStatusID]'
                        WHEN 'TransferStatusID DESC' THEN '[ASM_TransferHeader].[TransferStatusID] DESC'
                        WHEN 'T_CreatedBy' THEN '[ASM_TransferHeader].[T_CreatedBy]'
                        WHEN 'T_CreatedBy DESC' THEN '[ASM_TransferHeader].[T_CreatedBy] DESC'
                        WHEN 'T_CreatedOn' THEN '[ASM_TransferHeader].[T_CreatedOn]'
                        WHEN 'T_CreatedOn DESC' THEN '[ASM_TransferHeader].[T_CreatedOn] DESC'
                        WHEN 'T_ApprovedBy' THEN '[ASM_TransferHeader].[T_ApprovedBy]'
                        WHEN 'T_ApprovedBy DESC' THEN '[ASM_TransferHeader].[T_ApprovedBy] DESC'
                        WHEN 'T_ApprovedOn' THEN '[ASM_TransferHeader].[T_ApprovedOn]'
                        WHEN 'T_ApprovedOn DESC' THEN '[ASM_TransferHeader].[T_ApprovedOn] DESC'
                        WHEN 'T_GateEntryBy' THEN '[ASM_TransferHeader].[T_GateEntryBy]'
                        WHEN 'T_GateEntryBy DESC' THEN '[ASM_TransferHeader].[T_GateEntryBy] DESC'
                        WHEN 'T_GateEntryOn' THEN '[ASM_TransferHeader].[T_GateEntryOn]'
                        WHEN 'T_GateEntryOn DESC' THEN '[ASM_TransferHeader].[T_GateEntryOn] DESC'
                        WHEN 'T_ReceiveGateEntryBy' THEN '[ASM_TransferHeader].[T_ReceiveGateEntryBy]'
                        WHEN 'T_ReceiveGateEntryBy DESC' THEN '[ASM_TransferHeader].[T_ReceiveGateEntryBy] DESC'
                        WHEN 'T_ReceiveGateEntryOn' THEN '[ASM_TransferHeader].[T_ReceiveGateEntryOn]'
                        WHEN 'T_ReceiveGateEntryOn DESC' THEN '[ASM_TransferHeader].[T_ReceiveGateEntryOn] DESC'
                        WHEN 'T_ReceivedBy' THEN '[ASM_TransferHeader].[T_ReceivedBy]'
                        WHEN 'T_ReceivedBy DESC' THEN '[ASM_TransferHeader].[T_ReceivedBy] DESC'
                        WHEN 'T_ReceivedOn' THEN '[ASM_TransferHeader].[T_ReceivedOn]'
                        WHEN 'T_ReceivedOn DESC' THEN '[ASM_TransferHeader].[T_ReceivedOn] DESC'
                        WHEN 'R_TakenBy' THEN '[ASM_TransferHeader].[R_TakenBy]'
                        WHEN 'R_TakenBy DESC' THEN '[ASM_TransferHeader].[R_TakenBy] DESC'
                        WHEN 'R_CreatedBy' THEN '[ASM_TransferHeader].[R_CreatedBy]'
                        WHEN 'R_CreatedBy DESC' THEN '[ASM_TransferHeader].[R_CreatedBy] DESC'
                        WHEN 'R_CreatedOn' THEN '[ASM_TransferHeader].[R_CreatedOn]'
                        WHEN 'R_CreatedOn DESC' THEN '[ASM_TransferHeader].[R_CreatedOn] DESC'
                        WHEN 'R_ApprovedBy' THEN '[ASM_TransferHeader].[R_ApprovedBy]'
                        WHEN 'R_ApprovedBy DESC' THEN '[ASM_TransferHeader].[R_ApprovedBy] DESC'
                        WHEN 'R_ApprovedOn' THEN '[ASM_TransferHeader].[R_ApprovedOn]'
                        WHEN 'R_ApprovedOn DESC' THEN '[ASM_TransferHeader].[R_ApprovedOn] DESC'
                        WHEN 'R_GateEntryBy' THEN '[ASM_TransferHeader].[R_GateEntryBy]'
                        WHEN 'R_GateEntryBy DESC' THEN '[ASM_TransferHeader].[R_GateEntryBy] DESC'
                        WHEN 'R_GateEntryOn' THEN '[ASM_TransferHeader].[R_GateEntryOn]'
                        WHEN 'R_GateEntryOn DESC' THEN '[ASM_TransferHeader].[R_GateEntryOn] DESC'
                        WHEN 'R_ReceiveGateEntryBy' THEN '[ASM_TransferHeader].[R_ReceiveGateEntryBy]'
                        WHEN 'R_ReceiveGateEntryBy DESC' THEN '[ASM_TransferHeader].[R_ReceiveGateEntryBy] DESC'
                        WHEN 'R_ReceiveGateEntryOn' THEN '[ASM_TransferHeader].[R_ReceiveGateEntryOn]'
                        WHEN 'R_ReceiveGateEntryOn DESC' THEN '[ASM_TransferHeader].[R_ReceiveGateEntryOn] DESC'
                        WHEN 'R_ReceivedBy' THEN '[ASM_TransferHeader].[R_ReceivedBy]'
                        WHEN 'R_ReceivedBy DESC' THEN '[ASM_TransferHeader].[R_ReceivedBy] DESC'
                        WHEN 'R_ReceivedOn' THEN '[ASM_TransferHeader].[R_ReceivedOn]'
                        WHEN 'R_ReceivedOn DESC' THEN '[ASM_TransferHeader].[R_ReceivedOn] DESC'
                        WHEN 'CancelledRemarks' THEN '[ASM_TransferHeader].[CancelledRemarks]'
                        WHEN 'CancelledRemarks DESC' THEN '[ASM_TransferHeader].[CancelledRemarks] DESC'
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
		[ASM_TransferHeader].[T_TakenBy],
		[ASM_TransferHeader].[TransferStatusID],
		[ASM_TransferHeader].[T_CreatedBy],
		[ASM_TransferHeader].[T_CreatedOn],
		[ASM_TransferHeader].[T_ApprovedBy],
		[ASM_TransferHeader].[T_ApprovedOn],
		[ASM_TransferHeader].[T_GateEntryBy],
		[ASM_TransferHeader].[T_GateEntryOn],
		[ASM_TransferHeader].[T_ReceiveGateEntryBy],
		[ASM_TransferHeader].[T_ReceiveGateEntryOn],
		[ASM_TransferHeader].[T_ReceivedBy],
		[ASM_TransferHeader].[T_ReceivedOn],
		[ASM_TransferHeader].[R_TakenBy],
		[ASM_TransferHeader].[R_CreatedBy],
		[ASM_TransferHeader].[R_CreatedOn],
		[ASM_TransferHeader].[R_ApprovedBy],
		[ASM_TransferHeader].[R_ApprovedOn],
		[ASM_TransferHeader].[R_GateEntryBy],
		[ASM_TransferHeader].[R_GateEntryOn],
		[ASM_TransferHeader].[R_ReceiveGateEntryBy],
		[ASM_TransferHeader].[R_ReceiveGateEntryOn],
		[ASM_TransferHeader].[R_ReceivedBy],
		[ASM_TransferHeader].[R_ReceivedOn],
		[ASM_TransferHeader].[CancelledRemarks] 
  FROM [ASM_TransferHeader] 
    	INNER JOIN #PageIndex
          ON [ASM_TransferHeader].[TransferID] = #PageIndex.TransferID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

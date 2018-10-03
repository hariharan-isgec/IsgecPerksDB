USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWTransferHeaderSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,TransferID Int NOT NULL
  )
  INSERT INTO #PageIndex (TransferID)
  SELECT [ASM_TransferHeader].[TransferID] FROM [ASM_TransferHeader]
 WHERE  
   ( 
         STR(ISNULL([ASM_TransferHeader].[TransferID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferHeader].[TransferTo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferHeader].[TransferFrom], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[TransferRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[T_TakenBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[TransferStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[T_CreatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[T_ApprovedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[T_GateEntryBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[T_ReceiveGateEntryBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[T_ReceivedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[R_TakenBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[R_CreatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[R_ApprovedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[R_GateEntryBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[R_ReceiveGateEntryBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[R_ReceivedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[CancelledRemarks],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'TransferID' THEN [ASM_TransferHeader].[TransferID] END,
     CASE @orderBy WHEN 'TransferID DESC' THEN [ASM_TransferHeader].[TransferID] END DESC,
     CASE @orderBy WHEN 'TransferTo' THEN [ASM_TransferHeader].[TransferTo] END,
     CASE @orderBy WHEN 'TransferTo DESC' THEN [ASM_TransferHeader].[TransferTo] END DESC,
     CASE @orderBy WHEN 'TransferFrom' THEN [ASM_TransferHeader].[TransferFrom] END,
     CASE @orderBy WHEN 'TransferFrom DESC' THEN [ASM_TransferHeader].[TransferFrom] END DESC,
     CASE @orderBy WHEN 'Returnable' THEN [ASM_TransferHeader].[Returnable] END,
     CASE @orderBy WHEN 'Returnable DESC' THEN [ASM_TransferHeader].[Returnable] END DESC,
     CASE @orderBy WHEN 'ExpectedDate' THEN [ASM_TransferHeader].[ExpectedDate] END,
     CASE @orderBy WHEN 'ExpectedDate DESC' THEN [ASM_TransferHeader].[ExpectedDate] END DESC,
     CASE @orderBy WHEN 'TransferRemarks' THEN [ASM_TransferHeader].[TransferRemarks] END,
     CASE @orderBy WHEN 'TransferRemarks DESC' THEN [ASM_TransferHeader].[TransferRemarks] END DESC,
     CASE @orderBy WHEN 'T_TakenBy' THEN [ASM_TransferHeader].[T_TakenBy] END,
     CASE @orderBy WHEN 'T_TakenBy DESC' THEN [ASM_TransferHeader].[T_TakenBy] END DESC,
     CASE @orderBy WHEN 'TransferStatusID' THEN [ASM_TransferHeader].[TransferStatusID] END,
     CASE @orderBy WHEN 'TransferStatusID DESC' THEN [ASM_TransferHeader].[TransferStatusID] END DESC,
     CASE @orderBy WHEN 'T_CreatedBy' THEN [ASM_TransferHeader].[T_CreatedBy] END,
     CASE @orderBy WHEN 'T_CreatedBy DESC' THEN [ASM_TransferHeader].[T_CreatedBy] END DESC,
     CASE @orderBy WHEN 'T_CreatedOn' THEN [ASM_TransferHeader].[T_CreatedOn] END,
     CASE @orderBy WHEN 'T_CreatedOn DESC' THEN [ASM_TransferHeader].[T_CreatedOn] END DESC,
     CASE @orderBy WHEN 'T_ApprovedBy' THEN [ASM_TransferHeader].[T_ApprovedBy] END,
     CASE @orderBy WHEN 'T_ApprovedBy DESC' THEN [ASM_TransferHeader].[T_ApprovedBy] END DESC,
     CASE @orderBy WHEN 'T_ApprovedOn' THEN [ASM_TransferHeader].[T_ApprovedOn] END,
     CASE @orderBy WHEN 'T_ApprovedOn DESC' THEN [ASM_TransferHeader].[T_ApprovedOn] END DESC,
     CASE @orderBy WHEN 'T_GateEntryBy' THEN [ASM_TransferHeader].[T_GateEntryBy] END,
     CASE @orderBy WHEN 'T_GateEntryBy DESC' THEN [ASM_TransferHeader].[T_GateEntryBy] END DESC,
     CASE @orderBy WHEN 'T_GateEntryOn' THEN [ASM_TransferHeader].[T_GateEntryOn] END,
     CASE @orderBy WHEN 'T_GateEntryOn DESC' THEN [ASM_TransferHeader].[T_GateEntryOn] END DESC,
     CASE @orderBy WHEN 'T_ReceiveGateEntryBy' THEN [ASM_TransferHeader].[T_ReceiveGateEntryBy] END,
     CASE @orderBy WHEN 'T_ReceiveGateEntryBy DESC' THEN [ASM_TransferHeader].[T_ReceiveGateEntryBy] END DESC,
     CASE @orderBy WHEN 'T_ReceiveGateEntryOn' THEN [ASM_TransferHeader].[T_ReceiveGateEntryOn] END,
     CASE @orderBy WHEN 'T_ReceiveGateEntryOn DESC' THEN [ASM_TransferHeader].[T_ReceiveGateEntryOn] END DESC,
     CASE @orderBy WHEN 'T_ReceivedBy' THEN [ASM_TransferHeader].[T_ReceivedBy] END,
     CASE @orderBy WHEN 'T_ReceivedBy DESC' THEN [ASM_TransferHeader].[T_ReceivedBy] END DESC,
     CASE @orderBy WHEN 'T_ReceivedOn' THEN [ASM_TransferHeader].[T_ReceivedOn] END,
     CASE @orderBy WHEN 'T_ReceivedOn DESC' THEN [ASM_TransferHeader].[T_ReceivedOn] END DESC,
     CASE @orderBy WHEN 'R_TakenBy' THEN [ASM_TransferHeader].[R_TakenBy] END,
     CASE @orderBy WHEN 'R_TakenBy DESC' THEN [ASM_TransferHeader].[R_TakenBy] END DESC,
     CASE @orderBy WHEN 'R_CreatedBy' THEN [ASM_TransferHeader].[R_CreatedBy] END,
     CASE @orderBy WHEN 'R_CreatedBy DESC' THEN [ASM_TransferHeader].[R_CreatedBy] END DESC,
     CASE @orderBy WHEN 'R_CreatedOn' THEN [ASM_TransferHeader].[R_CreatedOn] END,
     CASE @orderBy WHEN 'R_CreatedOn DESC' THEN [ASM_TransferHeader].[R_CreatedOn] END DESC,
     CASE @orderBy WHEN 'R_ApprovedBy' THEN [ASM_TransferHeader].[R_ApprovedBy] END,
     CASE @orderBy WHEN 'R_ApprovedBy DESC' THEN [ASM_TransferHeader].[R_ApprovedBy] END DESC,
     CASE @orderBy WHEN 'R_ApprovedOn' THEN [ASM_TransferHeader].[R_ApprovedOn] END,
     CASE @orderBy WHEN 'R_ApprovedOn DESC' THEN [ASM_TransferHeader].[R_ApprovedOn] END DESC,
     CASE @orderBy WHEN 'R_GateEntryBy' THEN [ASM_TransferHeader].[R_GateEntryBy] END,
     CASE @orderBy WHEN 'R_GateEntryBy DESC' THEN [ASM_TransferHeader].[R_GateEntryBy] END DESC,
     CASE @orderBy WHEN 'R_GateEntryOn' THEN [ASM_TransferHeader].[R_GateEntryOn] END,
     CASE @orderBy WHEN 'R_GateEntryOn DESC' THEN [ASM_TransferHeader].[R_GateEntryOn] END DESC,
     CASE @orderBy WHEN 'R_ReceiveGateEntryBy' THEN [ASM_TransferHeader].[R_ReceiveGateEntryBy] END,
     CASE @orderBy WHEN 'R_ReceiveGateEntryBy DESC' THEN [ASM_TransferHeader].[R_ReceiveGateEntryBy] END DESC,
     CASE @orderBy WHEN 'R_ReceiveGateEntryOn' THEN [ASM_TransferHeader].[R_ReceiveGateEntryOn] END,
     CASE @orderBy WHEN 'R_ReceiveGateEntryOn DESC' THEN [ASM_TransferHeader].[R_ReceiveGateEntryOn] END DESC,
     CASE @orderBy WHEN 'R_ReceivedBy' THEN [ASM_TransferHeader].[R_ReceivedBy] END,
     CASE @orderBy WHEN 'R_ReceivedBy DESC' THEN [ASM_TransferHeader].[R_ReceivedBy] END DESC,
     CASE @orderBy WHEN 'R_ReceivedOn' THEN [ASM_TransferHeader].[R_ReceivedOn] END,
     CASE @orderBy WHEN 'R_ReceivedOn DESC' THEN [ASM_TransferHeader].[R_ReceivedOn] END DESC,
     CASE @orderBy WHEN 'CancelledRemarks' THEN [ASM_TransferHeader].[CancelledRemarks] END,
     CASE @orderBy WHEN 'CancelledRemarks DESC' THEN [ASM_TransferHeader].[CancelledRemarks] END DESC 

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

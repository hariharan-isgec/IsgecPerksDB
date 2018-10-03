USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmTransferHeaderSelectListSearch]
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
  LEFT OUTER JOIN [ASM_AstTransferStatus] AS [ASM_AstTransferStatus1]
    ON [ASM_TransferHeader].[TransferStatusID] = [ASM_AstTransferStatus1].[TransferStatusID]
  INNER JOIN [HRM_Offices] AS [HRM_Offices8]
    ON [ASM_TransferHeader].[TransferTo] = [HRM_Offices8].[OfficeID]
  INNER JOIN [HRM_Offices] AS [HRM_Offices9]
    ON [ASM_TransferHeader].[TransferFrom] = [HRM_Offices9].[OfficeID]
 WHERE  
   ( 
         STR(ISNULL([ASM_TransferHeader].[TransferID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferHeader].[TransferTo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ASM_TransferHeader].[TransferFrom], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[TransferRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[T_TakenBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[TransferStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[T_CreatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_TransferHeader].[CancelledRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstTransferStatus1].[TransferStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstTransferStatus1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices8].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices8].[Address],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices8].[City],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices9].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices9].[Address],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Offices9].[City],'')) LIKE @KeyWord1
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
     CASE @orderBy WHEN 'CancelledRemarks' THEN [ASM_TransferHeader].[CancelledRemarks] END,
     CASE @orderBy WHEN 'CancelledRemarks DESC' THEN [ASM_TransferHeader].[CancelledRemarks] END DESC,
     CASE @orderBy WHEN 'ASM_AstTransferStatus1_TransferStatusID' THEN [ASM_AstTransferStatus1].[TransferStatusID] END,
     CASE @orderBy WHEN 'ASM_AstTransferStatus1_TransferStatusID DESC' THEN [ASM_AstTransferStatus1].[TransferStatusID] END DESC,
     CASE @orderBy WHEN 'ASM_AstTransferStatus1_Description' THEN [ASM_AstTransferStatus1].[Description] END,
     CASE @orderBy WHEN 'ASM_AstTransferStatus1_Description DESC' THEN [ASM_AstTransferStatus1].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices8_OfficeID' THEN [HRM_Offices8].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices8_OfficeID DESC' THEN [HRM_Offices8].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices8_Description' THEN [HRM_Offices8].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices8_Description DESC' THEN [HRM_Offices8].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Offices9_OfficeID' THEN [HRM_Offices9].[OfficeID] END,
     CASE @orderBy WHEN 'HRM_Offices9_OfficeID DESC' THEN [HRM_Offices9].[OfficeID] END DESC,
     CASE @orderBy WHEN 'HRM_Offices9_Description' THEN [HRM_Offices9].[Description] END,
     CASE @orderBy WHEN 'HRM_Offices9_Description DESC' THEN [HRM_Offices9].[Description] END DESC 

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
		[ASM_TransferHeader].[CancelledRemarks],
		[ASM_AstTransferStatus1].[TransferStatusID] AS ASM_AstTransferStatus1_TransferStatusID,
		[ASM_AstTransferStatus1].[Description] AS ASM_AstTransferStatus1_Description,
		[HRM_Offices8].[OfficeID] AS HRM_Offices8_OfficeID,
		[HRM_Offices8].[Description] AS HRM_Offices8_Description,
		[HRM_Offices9].[OfficeID] AS HRM_Offices9_OfficeID,
		[HRM_Offices9].[Description] AS HRM_Offices9_Description 
  FROM [ASM_TransferHeader] 
    	INNER JOIN #PageIndex
          ON [ASM_TransferHeader].[TransferID] = #PageIndex.TransferID
  LEFT OUTER JOIN [ASM_AstTransferStatus] AS [ASM_AstTransferStatus1]
    ON [ASM_TransferHeader].[TransferStatusID] = [ASM_AstTransferStatus1].[TransferStatusID]
  INNER JOIN [HRM_Offices] AS [HRM_Offices8]
    ON [ASM_TransferHeader].[TransferTo] = [HRM_Offices8].[OfficeID]
  INNER JOIN [HRM_Offices] AS [HRM_Offices9]
    ON [ASM_TransferHeader].[TransferFrom] = [HRM_Offices9].[OfficeID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

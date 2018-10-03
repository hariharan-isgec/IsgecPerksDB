USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmCustomerTmtlHeaderSelectListSearch]
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
 ,TmtlID Int NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,CustomerID NVarChar(6) NOT NULL
  )
  INSERT INTO #PageIndex (TmtlID, ProjectID, CustomerID)
  SELECT [DCM_CustomerTmtlHeader].[TmtlID], [DCM_CustomerTmtlHeader].[ProjectID], [DCM_CustomerTmtlHeader].[CustomerID] FROM [DCM_CustomerTmtlHeader]
  LEFT OUTER JOIN [DCM_Customers] AS [DCM_Customers1]
    ON [DCM_CustomerTmtlHeader].[CustomerID] = [DCM_Customers1].[CustomerID]
    AND [DCM_CustomerTmtlHeader].[ProjectID] = [DCM_Customers1].[ProjectID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects2]
    ON [DCM_CustomerTmtlHeader].[ProjectID] = [DCM_Projects2].[ProjectID]
  LEFT OUTER JOIN [DCM_TmtlStatus] AS [DCM_TmtlStatus3]
    ON [DCM_CustomerTmtlHeader].[TmtlStatusID] = [DCM_TmtlStatus3].[StatusID]
 WHERE  
   ( 
         STR(ISNULL([DCM_CustomerTmtlHeader].[TmtlID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlHeader].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlHeader].[CustomerID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlHeader].[TmtlReference],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlHeader].[Subject],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlHeader].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlHeader].[TmtlStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlHeader].[CreatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_CustomerTmtlHeader].[ApprovedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[CustomerID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[Address1],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[Address2],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[Address3],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[Address4],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[ToEMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Customers1].[CCEmailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects2].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects2].[ProjectCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_TmtlStatus3].[StatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_TmtlStatus3].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'TmtlID' THEN [DCM_CustomerTmtlHeader].[TmtlID] END,
     CASE @orderBy WHEN 'TmtlID DESC' THEN [DCM_CustomerTmtlHeader].[TmtlID] END DESC,
     CASE @orderBy WHEN 'ProjectID' THEN [DCM_CustomerTmtlHeader].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [DCM_CustomerTmtlHeader].[ProjectID] END DESC,
     CASE @orderBy WHEN 'CustomerID' THEN [DCM_CustomerTmtlHeader].[CustomerID] END,
     CASE @orderBy WHEN 'CustomerID DESC' THEN [DCM_CustomerTmtlHeader].[CustomerID] END DESC,
     CASE @orderBy WHEN 'TmtlReference' THEN [DCM_CustomerTmtlHeader].[TmtlReference] END,
     CASE @orderBy WHEN 'TmtlReference DESC' THEN [DCM_CustomerTmtlHeader].[TmtlReference] END DESC,
     CASE @orderBy WHEN 'Subject' THEN [DCM_CustomerTmtlHeader].[Subject] END,
     CASE @orderBy WHEN 'Subject DESC' THEN [DCM_CustomerTmtlHeader].[Subject] END DESC,
     CASE @orderBy WHEN 'Remarks' THEN [DCM_CustomerTmtlHeader].[Remarks] END,
     CASE @orderBy WHEN 'Remarks DESC' THEN [DCM_CustomerTmtlHeader].[Remarks] END DESC,
     CASE @orderBy WHEN 'TmtlStatusID' THEN [DCM_CustomerTmtlHeader].[TmtlStatusID] END,
     CASE @orderBy WHEN 'TmtlStatusID DESC' THEN [DCM_CustomerTmtlHeader].[TmtlStatusID] END DESC,
     CASE @orderBy WHEN 'CreatedOn' THEN [DCM_CustomerTmtlHeader].[CreatedOn] END,
     CASE @orderBy WHEN 'CreatedOn DESC' THEN [DCM_CustomerTmtlHeader].[CreatedOn] END DESC,
     CASE @orderBy WHEN 'CreatedBy' THEN [DCM_CustomerTmtlHeader].[CreatedBy] END,
     CASE @orderBy WHEN 'CreatedBy DESC' THEN [DCM_CustomerTmtlHeader].[CreatedBy] END DESC,
     CASE @orderBy WHEN 'ApprovedOn' THEN [DCM_CustomerTmtlHeader].[ApprovedOn] END,
     CASE @orderBy WHEN 'ApprovedOn DESC' THEN [DCM_CustomerTmtlHeader].[ApprovedOn] END DESC,
     CASE @orderBy WHEN 'ApprovedBy' THEN [DCM_CustomerTmtlHeader].[ApprovedBy] END,
     CASE @orderBy WHEN 'ApprovedBy DESC' THEN [DCM_CustomerTmtlHeader].[ApprovedBy] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_CustomerID' THEN [DCM_Customers1].[CustomerID] END,
     CASE @orderBy WHEN 'DCM_Customers1_CustomerID DESC' THEN [DCM_Customers1].[CustomerID] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_ProjectID' THEN [DCM_Customers1].[ProjectID] END,
     CASE @orderBy WHEN 'DCM_Customers1_ProjectID DESC' THEN [DCM_Customers1].[ProjectID] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_Description' THEN [DCM_Customers1].[Description] END,
     CASE @orderBy WHEN 'DCM_Customers1_Description DESC' THEN [DCM_Customers1].[Description] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_Address1' THEN [DCM_Customers1].[Address1] END,
     CASE @orderBy WHEN 'DCM_Customers1_Address1 DESC' THEN [DCM_Customers1].[Address1] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_Address2' THEN [DCM_Customers1].[Address2] END,
     CASE @orderBy WHEN 'DCM_Customers1_Address2 DESC' THEN [DCM_Customers1].[Address2] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_Address3' THEN [DCM_Customers1].[Address3] END,
     CASE @orderBy WHEN 'DCM_Customers1_Address3 DESC' THEN [DCM_Customers1].[Address3] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_Address4' THEN [DCM_Customers1].[Address4] END,
     CASE @orderBy WHEN 'DCM_Customers1_Address4 DESC' THEN [DCM_Customers1].[Address4] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_ToEMailID' THEN [DCM_Customers1].[ToEMailID] END,
     CASE @orderBy WHEN 'DCM_Customers1_ToEMailID DESC' THEN [DCM_Customers1].[ToEMailID] END DESC,
     CASE @orderBy WHEN 'DCM_Customers1_CCEmailID' THEN [DCM_Customers1].[CCEmailID] END,
     CASE @orderBy WHEN 'DCM_Customers1_CCEmailID DESC' THEN [DCM_Customers1].[CCEmailID] END DESC,
     CASE @orderBy WHEN 'DCM_Projects2_ProjectID' THEN [DCM_Projects2].[ProjectID] END,
     CASE @orderBy WHEN 'DCM_Projects2_ProjectID DESC' THEN [DCM_Projects2].[ProjectID] END DESC,
     CASE @orderBy WHEN 'DCM_Projects2_Description' THEN [DCM_Projects2].[Description] END,
     CASE @orderBy WHEN 'DCM_Projects2_Description DESC' THEN [DCM_Projects2].[Description] END DESC,
     CASE @orderBy WHEN 'DCM_Projects2_ProjectCode' THEN [DCM_Projects2].[ProjectCode] END,
     CASE @orderBy WHEN 'DCM_Projects2_ProjectCode DESC' THEN [DCM_Projects2].[ProjectCode] END DESC,
     CASE @orderBy WHEN 'DCM_TmtlStatus3_StatusID' THEN [DCM_TmtlStatus3].[StatusID] END,
     CASE @orderBy WHEN 'DCM_TmtlStatus3_StatusID DESC' THEN [DCM_TmtlStatus3].[StatusID] END DESC,
     CASE @orderBy WHEN 'DCM_TmtlStatus3_Description' THEN [DCM_TmtlStatus3].[Description] END,
     CASE @orderBy WHEN 'DCM_TmtlStatus3_Description DESC' THEN [DCM_TmtlStatus3].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[DCM_CustomerTmtlHeader].[TmtlID],
		[DCM_CustomerTmtlHeader].[ProjectID],
		[DCM_CustomerTmtlHeader].[CustomerID],
		[DCM_CustomerTmtlHeader].[TmtlReference],
		[DCM_CustomerTmtlHeader].[Subject],
		[DCM_CustomerTmtlHeader].[Remarks],
		[DCM_CustomerTmtlHeader].[TmtlStatusID],
		[DCM_CustomerTmtlHeader].[CreatedOn],
		[DCM_CustomerTmtlHeader].[CreatedBy],
		[DCM_CustomerTmtlHeader].[ApprovedOn],
		[DCM_CustomerTmtlHeader].[ApprovedBy],
		[DCM_Customers1].[CustomerID] AS DCM_Customers1_CustomerID,
		[DCM_Customers1].[ProjectID] AS DCM_Customers1_ProjectID,
		[DCM_Customers1].[Description] AS DCM_Customers1_Description,
		[DCM_Customers1].[Address1] AS DCM_Customers1_Address1,
		[DCM_Customers1].[Address2] AS DCM_Customers1_Address2,
		[DCM_Customers1].[Address3] AS DCM_Customers1_Address3,
		[DCM_Customers1].[Address4] AS DCM_Customers1_Address4,
		[DCM_Customers1].[ToEMailID] AS DCM_Customers1_ToEMailID,
		[DCM_Customers1].[CCEmailID] AS DCM_Customers1_CCEmailID,
		[DCM_Projects2].[ProjectID] AS DCM_Projects2_ProjectID,
		[DCM_Projects2].[Description] AS DCM_Projects2_Description,
		[DCM_Projects2].[ProjectCode] AS DCM_Projects2_ProjectCode,
		[DCM_TmtlStatus3].[StatusID] AS DCM_TmtlStatus3_StatusID,
		[DCM_TmtlStatus3].[Description] AS DCM_TmtlStatus3_Description 
  FROM [DCM_CustomerTmtlHeader] 
    	INNER JOIN #PageIndex
          ON [DCM_CustomerTmtlHeader].[TmtlID] = #PageIndex.TmtlID
          AND [DCM_CustomerTmtlHeader].[ProjectID] = #PageIndex.ProjectID
          AND [DCM_CustomerTmtlHeader].[CustomerID] = #PageIndex.CustomerID
  LEFT OUTER JOIN [DCM_Customers] AS [DCM_Customers1]
    ON [DCM_CustomerTmtlHeader].[CustomerID] = [DCM_Customers1].[CustomerID]
    AND [DCM_CustomerTmtlHeader].[ProjectID] = [DCM_Customers1].[ProjectID]
  LEFT OUTER JOIN [DCM_Projects] AS [DCM_Projects2]
    ON [DCM_CustomerTmtlHeader].[ProjectID] = [DCM_Projects2].[ProjectID]
  LEFT OUTER JOIN [DCM_TmtlStatus] AS [DCM_TmtlStatus3]
    ON [DCM_CustomerTmtlHeader].[TmtlStatusID] = [DCM_TmtlStatus3].[StatusID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

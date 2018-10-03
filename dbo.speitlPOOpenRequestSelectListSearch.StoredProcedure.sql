USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOOpenRequestSelectListSearch]
  @LoginID NVarChar(8),
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
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RequestNo Int NOT NULL
  )
  INSERT INTO #PageIndex (RequestNo)
  SELECT [EITL_POOpenRequest].[RequestNo] FROM [EITL_POOpenRequest]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [EITL_POOpenRequest].[ExecutedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [EITL_POList] AS [EITL_POList2]
    ON [EITL_POOpenRequest].[SerialNo] = [EITL_POList2].[SerialNo]
  LEFT OUTER JOIN [EITL_Suppliers] AS [EITL_Suppliers3]
    ON [EITL_POOpenRequest].[SupplierID] = [EITL_Suppliers3].[SupplierID]
 WHERE  
   ( 
         STR(ISNULL([EITL_POOpenRequest].[RequestNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([EITL_POOpenRequest].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POOpenRequest].[PORevision],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POOpenRequest].[SupplierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POOpenRequest].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POOpenRequest].[ExecutedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POOpenRequest].[ExecuterRemarks],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RequestNo' THEN [EITL_POOpenRequest].[RequestNo] END,
     CASE @OrderBy WHEN 'RequestNo DESC' THEN [EITL_POOpenRequest].[RequestNo] END DESC,
     CASE @OrderBy WHEN 'SerialNo' THEN [EITL_POOpenRequest].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [EITL_POOpenRequest].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'PORevision' THEN [EITL_POOpenRequest].[PORevision] END,
     CASE @OrderBy WHEN 'PORevision DESC' THEN [EITL_POOpenRequest].[PORevision] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [EITL_POOpenRequest].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [EITL_POOpenRequest].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [EITL_POOpenRequest].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [EITL_POOpenRequest].[Remarks] END DESC,
     CASE @OrderBy WHEN 'RequestedOn' THEN [EITL_POOpenRequest].[RequestedOn] END,
     CASE @OrderBy WHEN 'RequestedOn DESC' THEN [EITL_POOpenRequest].[RequestedOn] END DESC,
     CASE @OrderBy WHEN 'ExecutedBy' THEN [EITL_POOpenRequest].[ExecutedBy] END,
     CASE @OrderBy WHEN 'ExecutedBy DESC' THEN [EITL_POOpenRequest].[ExecutedBy] END DESC,
     CASE @OrderBy WHEN 'ExecutedOn' THEN [EITL_POOpenRequest].[ExecutedOn] END,
     CASE @OrderBy WHEN 'ExecutedOn DESC' THEN [EITL_POOpenRequest].[ExecutedOn] END DESC,
     CASE @OrderBy WHEN 'ExecuterRemarks' THEN [EITL_POOpenRequest].[ExecuterRemarks] END,
     CASE @OrderBy WHEN 'ExecuterRemarks DESC' THEN [EITL_POOpenRequest].[ExecuterRemarks] END DESC,
     CASE @OrderBy WHEN 'ExecutedToOpen' THEN [EITL_POOpenRequest].[ExecutedToOpen] END,
     CASE @OrderBy WHEN 'ExecutedToOpen DESC' THEN [EITL_POOpenRequest].[ExecutedToOpen] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'EITL_POList2_PONumber' THEN [EITL_POList2].[PONumber] END,
     CASE @OrderBy WHEN 'EITL_POList2_PONumber DESC' THEN [EITL_POList2].[PONumber] END DESC,
     CASE @OrderBy WHEN 'EITL_Suppliers3_SupplierName' THEN [EITL_Suppliers3].[SupplierName] END,
     CASE @OrderBy WHEN 'EITL_Suppliers3_SupplierName DESC' THEN [EITL_Suppliers3].[SupplierName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[EITL_POOpenRequest].[RequestNo] ,
		[EITL_POOpenRequest].[SerialNo] ,
		[EITL_POOpenRequest].[PORevision] ,
		[EITL_POOpenRequest].[SupplierID] ,
		[EITL_POOpenRequest].[Remarks] ,
		[EITL_POOpenRequest].[RequestedOn] ,
		[EITL_POOpenRequest].[ExecutedBy] ,
		[EITL_POOpenRequest].[ExecutedOn] ,
		[EITL_POOpenRequest].[ExecuterRemarks] ,
		[EITL_POOpenRequest].[ExecutedToOpen] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[EITL_POList2].[PONumber] AS EITL_POList2_PONumber,
		[EITL_Suppliers3].[SupplierName] AS EITL_Suppliers3_SupplierName 
  FROM [EITL_POOpenRequest] 
    	INNER JOIN #PageIndex
          ON [EITL_POOpenRequest].[RequestNo] = #PageIndex.RequestNo
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [EITL_POOpenRequest].[ExecutedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [EITL_POList] AS [EITL_POList2]
    ON [EITL_POOpenRequest].[SerialNo] = [EITL_POList2].[SerialNo]
  LEFT OUTER JOIN [EITL_Suppliers] AS [EITL_Suppliers3]
    ON [EITL_POOpenRequest].[SupplierID] = [EITL_Suppliers3].[SupplierID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

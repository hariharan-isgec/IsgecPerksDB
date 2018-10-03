USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitl_LG_ImportPOListSelectListSearch]
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
  DECLARE @UserDiv VarChar(10)
  Select @UserDiv=ERP_Div From HRM_Divisions where DivisionID = (select c_divisionID from aspnet_users where loginid=@loginid)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo)
  SELECT [EITL_POList].[SerialNo] FROM [EITL_POList]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [EITL_POList].[BuyerID] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [EITL_POList].[ClosedBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [EITL_POList].[IssuedBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [EITL_POStatus] AS [EITL_POStatus4]
    ON [EITL_POList].[POStatusID] = [EITL_POStatus4].[StatusID]
  LEFT OUTER JOIN [EITL_Suppliers] AS [EITL_Suppliers5]
    ON [EITL_POList].[SupplierID] = [EITL_Suppliers5].[SupplierID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects6]
    ON [EITL_POList].[ProjectID] = [IDM_Projects6].[ProjectID]
 WHERE  [EITL_POList].[POStatusID] = 1 
      AND   [EITL_POList].[DivisionID] = @UserDiv  
    --AND   [EITL_POList].[BuyerID] = @LoginID  
   AND ( 
         STR(ISNULL([EITL_POList].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POList].[PONumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POList].[PORevision],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POList].[SupplierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POList].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POList].[DivisionID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POList].[BuyerID],'')) LIKE @KeyWord1
     OR STR(ISNULL([EITL_POList].[POStatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POList].[IssuedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EITL_POList].[ClosedBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [EITL_POList].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [EITL_POList].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'PONumber' THEN [EITL_POList].[PONumber] END,
     CASE @OrderBy WHEN 'PONumber DESC' THEN [EITL_POList].[PONumber] END DESC,
     CASE @OrderBy WHEN 'PORevision' THEN [EITL_POList].[PORevision] END,
     CASE @OrderBy WHEN 'PORevision DESC' THEN [EITL_POList].[PORevision] END DESC,
     CASE @OrderBy WHEN 'PODate' THEN [EITL_POList].[PODate] END,
     CASE @OrderBy WHEN 'PODate DESC' THEN [EITL_POList].[PODate] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [EITL_POList].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [EITL_POList].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [EITL_POList].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [EITL_POList].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'DivisionID' THEN [EITL_POList].[DivisionID] END,
     CASE @OrderBy WHEN 'DivisionID DESC' THEN [EITL_POList].[DivisionID] END DESC,
     CASE @OrderBy WHEN 'BuyerID' THEN [EITL_POList].[BuyerID] END,
     CASE @OrderBy WHEN 'BuyerID DESC' THEN [EITL_POList].[BuyerID] END DESC,
     CASE @OrderBy WHEN 'POStatusID' THEN [EITL_POList].[POStatusID] END,
     CASE @OrderBy WHEN 'POStatusID DESC' THEN [EITL_POList].[POStatusID] END DESC,
     CASE @OrderBy WHEN 'IssuedBy' THEN [EITL_POList].[IssuedBy] END,
     CASE @OrderBy WHEN 'IssuedBy DESC' THEN [EITL_POList].[IssuedBy] END DESC,
     CASE @OrderBy WHEN 'IssuedOn' THEN [EITL_POList].[IssuedOn] END,
     CASE @OrderBy WHEN 'IssuedOn DESC' THEN [EITL_POList].[IssuedOn] END DESC,
     CASE @OrderBy WHEN 'ClosedBy' THEN [EITL_POList].[ClosedBy] END,
     CASE @OrderBy WHEN 'ClosedBy DESC' THEN [EITL_POList].[ClosedBy] END DESC,
     CASE @OrderBy WHEN 'ClosedOn' THEN [EITL_POList].[ClosedOn] END,
     CASE @OrderBy WHEN 'ClosedOn DESC' THEN [EITL_POList].[ClosedOn] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'EITL_POStatus4_Description' THEN [EITL_POStatus4].[Description] END,
     CASE @OrderBy WHEN 'EITL_POStatus4_Description DESC' THEN [EITL_POStatus4].[Description] END DESC,
     CASE @OrderBy WHEN 'EITL_Suppliers5_SupplierName' THEN [EITL_Suppliers5].[SupplierName] END,
     CASE @OrderBy WHEN 'EITL_Suppliers5_SupplierName DESC' THEN [EITL_Suppliers5].[SupplierName] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects6_Description' THEN [IDM_Projects6].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects6_Description DESC' THEN [IDM_Projects6].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[EITL_POList].[SerialNo] ,
		[EITL_POList].[PONumber] ,
		[EITL_POList].[PORevision] ,
		[EITL_POList].[PODate] ,
		[EITL_POList].[SupplierID] ,
		[EITL_POList].[ProjectID] ,
		[EITL_POList].[DivisionID] ,
		[EITL_POList].[BuyerID] ,
		[EITL_POList].[POStatusID] ,
		[EITL_POList].[IssuedBy] ,
		[EITL_POList].[IssuedOn] ,
		[EITL_POList].[ClosedBy] ,
		[EITL_POList].[ClosedOn] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[EITL_POStatus4].[Description] AS EITL_POStatus4_Description,
		[EITL_Suppliers5].[SupplierName] AS EITL_Suppliers5_SupplierName,
		[IDM_Projects6].[Description] AS IDM_Projects6_Description 
  FROM [EITL_POList] 
    	INNER JOIN #PageIndex
          ON [EITL_POList].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [EITL_POList].[BuyerID] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [EITL_POList].[ClosedBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [EITL_POList].[IssuedBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [EITL_POStatus] AS [EITL_POStatus4]
    ON [EITL_POList].[POStatusID] = [EITL_POStatus4].[StatusID]
  LEFT OUTER JOIN [EITL_Suppliers] AS [EITL_Suppliers5]
    ON [EITL_POList].[SupplierID] = [EITL_Suppliers5].[SupplierID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects6]
    ON [EITL_POList].[ProjectID] = [IDM_Projects6].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBPreOrderHistorySelectListSearch]
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
 ,WFID Int NOT NULL
  )
  INSERT INTO #PageIndex (WFID)
  SELECT [WF1_PreOrder_History].[WFID] FROM [WF1_PreOrder_History]
  INNER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [WF1_PreOrder_History].[UserId] = [aspnet_Users3].[LoginID]
  INNER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [WF1_PreOrder_History].[Buyer] = [aspnet_Users2].[LoginID]
 WHERE  
   ( 
         STR(ISNULL([WF1_PreOrder_History].[WFID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([WF1_PreOrder_History].[Project],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([WF1_PreOrder_History].[Element],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([WF1_PreOrder_History].[SpecificationNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([WF1_PreOrder_History].[Buyer],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([WF1_PreOrder_History].[SupplierName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([WF1_PreOrder_History].[Supplier],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([WF1_PreOrder_History].[Notes],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([WF1_PreOrder_History].[UserId],'')) LIKE @KeyWord1
     OR STR(ISNULL([WF1_PreOrder_History].[Parent_WFID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([WF1_PreOrder_History].[WFID_SlNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([WF1_PreOrder_History].[WF_Status],'')) LIKE @KeyWord1
     OR STR(ISNULL([WF1_PreOrder_History].[WF_HistoryID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'WFID' THEN [WF1_PreOrder_History].[WFID] END,
     CASE @OrderBy WHEN 'WFID DESC' THEN [WF1_PreOrder_History].[WFID] END DESC,
     CASE @OrderBy WHEN 'Project' THEN [WF1_PreOrder_History].[Project] END,
     CASE @OrderBy WHEN 'Project DESC' THEN [WF1_PreOrder_History].[Project] END DESC,
     CASE @OrderBy WHEN 'Element' THEN [WF1_PreOrder_History].[Element] END,
     CASE @OrderBy WHEN 'Element DESC' THEN [WF1_PreOrder_History].[Element] END DESC,
     CASE @OrderBy WHEN 'SpecificationNo' THEN [WF1_PreOrder_History].[SpecificationNo] END,
     CASE @OrderBy WHEN 'SpecificationNo DESC' THEN [WF1_PreOrder_History].[SpecificationNo] END DESC,
     CASE @OrderBy WHEN 'Buyer' THEN [WF1_PreOrder_History].[Buyer] END,
     CASE @OrderBy WHEN 'Buyer DESC' THEN [WF1_PreOrder_History].[Buyer] END DESC,
     CASE @OrderBy WHEN 'SupplierName' THEN [WF1_PreOrder_History].[SupplierName] END,
     CASE @OrderBy WHEN 'SupplierName DESC' THEN [WF1_PreOrder_History].[SupplierName] END DESC,
     CASE @OrderBy WHEN 'Supplier' THEN [WF1_PreOrder_History].[Supplier] END,
     CASE @OrderBy WHEN 'Supplier DESC' THEN [WF1_PreOrder_History].[Supplier] END DESC,
     CASE @OrderBy WHEN 'Notes' THEN [WF1_PreOrder_History].[Notes] END,
     CASE @OrderBy WHEN 'Notes DESC' THEN [WF1_PreOrder_History].[Notes] END DESC,
     CASE @OrderBy WHEN 'DateTime' THEN [WF1_PreOrder_History].[DateTime] END,
     CASE @OrderBy WHEN 'DateTime DESC' THEN [WF1_PreOrder_History].[DateTime] END DESC,
     CASE @OrderBy WHEN 'UserId' THEN [WF1_PreOrder_History].[UserId] END,
     CASE @OrderBy WHEN 'UserId DESC' THEN [WF1_PreOrder_History].[UserId] END DESC,
     CASE @OrderBy WHEN 'Parent_WFID' THEN [WF1_PreOrder_History].[Parent_WFID] END,
     CASE @OrderBy WHEN 'Parent_WFID DESC' THEN [WF1_PreOrder_History].[Parent_WFID] END DESC,
     CASE @OrderBy WHEN 'WFID_SlNo' THEN [WF1_PreOrder_History].[WFID_SlNo] END,
     CASE @OrderBy WHEN 'WFID_SlNo DESC' THEN [WF1_PreOrder_History].[WFID_SlNo] END DESC,
     CASE @OrderBy WHEN 'WF_Status' THEN [WF1_PreOrder_History].[WF_Status] END,
     CASE @OrderBy WHEN 'WF_Status DESC' THEN [WF1_PreOrder_History].[WF_Status] END DESC,
     CASE @OrderBy WHEN 'WF_HistoryID' THEN [WF1_PreOrder_History].[WF_HistoryID] END,
     CASE @OrderBy WHEN 'WF_HistoryID DESC' THEN [WF1_PreOrder_History].[WF_HistoryID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [WF1_PreOrder_History].* ,
    [aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName 
  FROM [WF1_PreOrder_History] 
      INNER JOIN #PageIndex
          ON [WF1_PreOrder_History].[WFID] = #PageIndex.WFID
  INNER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [WF1_PreOrder_History].[UserId] = [aspnet_Users3].[LoginID]
  INNER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [WF1_PreOrder_History].[Buyer] = [aspnet_Users2].[LoginID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

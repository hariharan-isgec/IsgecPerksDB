USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillSelectListSearch]
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
 ,IRNo Int NOT NULL
  )
  INSERT INTO #PageIndex (IRNo)
  SELECT [ELOG_DetentionBill].[IRNo] FROM [ELOG_DetentionBill]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [ELOG_DetentionBill].[CreatedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [ELOG_DetentionBillStatus] AS [ELOG_DetentionBillStatus2]
    ON [ELOG_DetentionBill].[StatusID] = [ELOG_DetentionBillStatus2].[StatusID]
  LEFT OUTER JOIN [ELOG_DetentionBillTypes] AS [ELOG_DetentionBillTypes3]
    ON [ELOG_DetentionBill].[BillTypeID] = [ELOG_DetentionBillTypes3].[BillTypeID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]
    ON [ELOG_DetentionBill].[ProjectID] = [IDM_Projects4].[ProjectID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner5]
    ON [ELOG_DetentionBill].[SupplierID] = [VR_BusinessPartner5].[BPID]
 WHERE  
   ( 
         STR(ISNULL([ELOG_DetentionBill].[IRNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_DetentionBill].[SupplierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_DetentionBill].[SupplierBillNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_DetentionBill].[BillAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_DetentionBill].[GRNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_DetentionBill].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_DetentionBill].[PONumber],'')) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_DetentionBill].[BillTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_DetentionBill].[OtherBillType],'')) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_DetentionBill].[VehicleExeNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_DetentionBill].[MRNNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_DetentionBill].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_DetentionBill].[CreatedBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'IRNo' THEN [ELOG_DetentionBill].[IRNo] END,
     CASE @OrderBy WHEN 'IRNo DESC' THEN [ELOG_DetentionBill].[IRNo] END DESC,
     CASE @OrderBy WHEN 'IRDate' THEN [ELOG_DetentionBill].[IRDate] END,
     CASE @OrderBy WHEN 'IRDate DESC' THEN [ELOG_DetentionBill].[IRDate] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [ELOG_DetentionBill].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [ELOG_DetentionBill].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'SupplierBillNo' THEN [ELOG_DetentionBill].[SupplierBillNo] END,
     CASE @OrderBy WHEN 'SupplierBillNo DESC' THEN [ELOG_DetentionBill].[SupplierBillNo] END DESC,
     CASE @OrderBy WHEN 'SupplierBillDate' THEN [ELOG_DetentionBill].[SupplierBillDate] END,
     CASE @OrderBy WHEN 'SupplierBillDate DESC' THEN [ELOG_DetentionBill].[SupplierBillDate] END DESC,
     CASE @OrderBy WHEN 'BillAmount' THEN [ELOG_DetentionBill].[BillAmount] END,
     CASE @OrderBy WHEN 'BillAmount DESC' THEN [ELOG_DetentionBill].[BillAmount] END DESC,
     CASE @OrderBy WHEN 'GRNo' THEN [ELOG_DetentionBill].[GRNo] END,
     CASE @OrderBy WHEN 'GRNo DESC' THEN [ELOG_DetentionBill].[GRNo] END DESC,
     CASE @OrderBy WHEN 'GRDate' THEN [ELOG_DetentionBill].[GRDate] END,
     CASE @OrderBy WHEN 'GRDate DESC' THEN [ELOG_DetentionBill].[GRDate] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [ELOG_DetentionBill].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [ELOG_DetentionBill].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'PONumber' THEN [ELOG_DetentionBill].[PONumber] END,
     CASE @OrderBy WHEN 'PONumber DESC' THEN [ELOG_DetentionBill].[PONumber] END DESC,
     CASE @OrderBy WHEN 'BillTypeID' THEN [ELOG_DetentionBill].[BillTypeID] END,
     CASE @OrderBy WHEN 'BillTypeID DESC' THEN [ELOG_DetentionBill].[BillTypeID] END DESC,
     CASE @OrderBy WHEN 'OtherBillType' THEN [ELOG_DetentionBill].[OtherBillType] END,
     CASE @OrderBy WHEN 'OtherBillType DESC' THEN [ELOG_DetentionBill].[OtherBillType] END DESC,
     CASE @OrderBy WHEN 'VehicleExeNo' THEN [ELOG_DetentionBill].[VehicleExeNo] END,
     CASE @OrderBy WHEN 'VehicleExeNo DESC' THEN [ELOG_DetentionBill].[VehicleExeNo] END DESC,
     CASE @OrderBy WHEN 'MRNNo' THEN [ELOG_DetentionBill].[MRNNo] END,
     CASE @OrderBy WHEN 'MRNNo DESC' THEN [ELOG_DetentionBill].[MRNNo] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [ELOG_DetentionBill].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [ELOG_DetentionBill].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [ELOG_DetentionBill].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [ELOG_DetentionBill].[StatusID] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [ELOG_DetentionBill].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [ELOG_DetentionBill].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'ELOG_DetentionBillStatus2_Description' THEN [ELOG_DetentionBillStatus2].[Description] END,
     CASE @OrderBy WHEN 'ELOG_DetentionBillStatus2_Description DESC' THEN [ELOG_DetentionBillStatus2].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_DetentionBillTypes3_Description' THEN [ELOG_DetentionBillTypes3].[Description] END,
     CASE @OrderBy WHEN 'ELOG_DetentionBillTypes3_Description DESC' THEN [ELOG_DetentionBillTypes3].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects4_Description' THEN [IDM_Projects4].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects4_Description DESC' THEN [IDM_Projects4].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner5_BPName' THEN [VR_BusinessPartner5].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner5_BPName DESC' THEN [VR_BusinessPartner5].[BPName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [ELOG_DetentionBill].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [ELOG_DetentionBillStatus2].[Description] AS ELOG_DetentionBillStatus2_Description,
    [ELOG_DetentionBillTypes3].[Description] AS ELOG_DetentionBillTypes3_Description,
    [IDM_Projects4].[Description] AS IDM_Projects4_Description,
    [VR_BusinessPartner5].[BPName] AS VR_BusinessPartner5_BPName 
  FROM [ELOG_DetentionBill] 
      INNER JOIN #PageIndex
          ON [ELOG_DetentionBill].[IRNo] = #PageIndex.IRNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [ELOG_DetentionBill].[CreatedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [ELOG_DetentionBillStatus] AS [ELOG_DetentionBillStatus2]
    ON [ELOG_DetentionBill].[StatusID] = [ELOG_DetentionBillStatus2].[StatusID]
  LEFT OUTER JOIN [ELOG_DetentionBillTypes] AS [ELOG_DetentionBillTypes3]
    ON [ELOG_DetentionBill].[BillTypeID] = [ELOG_DetentionBillTypes3].[BillTypeID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]
    ON [ELOG_DetentionBill].[ProjectID] = [IDM_Projects4].[ProjectID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner5]
    ON [ELOG_DetentionBill].[SupplierID] = [VR_BusinessPartner5].[BPID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

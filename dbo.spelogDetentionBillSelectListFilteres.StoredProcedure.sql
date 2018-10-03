USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogDetentionBillSelectListFilteres]
  @Filter_SupplierID NVarChar(9),
  @Filter_ProjectID NVarChar(6),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,IRNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'IRNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ELOG_DetentionBill].[IRNo]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_DetentionBill] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_DetentionBill].[CreatedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_DetentionBillStatus] AS [ELOG_DetentionBillStatus2]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_DetentionBill].[StatusID] = [ELOG_DetentionBillStatus2].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_DetentionBillTypes] AS [ELOG_DetentionBillTypes3]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_DetentionBill].[BillTypeID] = [ELOG_DetentionBillTypes3].[BillTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects4]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_DetentionBill].[ProjectID] = [IDM_Projects4].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner5]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_DetentionBill].[SupplierID] = [VR_BusinessPartner5].[BPID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SupplierID > '') 
    SET @LGSQL = @LGSQL + ' AND [ELOG_DetentionBill].[SupplierID] = ''' + @Filter_SupplierID + ''''
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [ELOG_DetentionBill].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IRNo' THEN '[ELOG_DetentionBill].[IRNo]'
                        WHEN 'IRNo DESC' THEN '[ELOG_DetentionBill].[IRNo] DESC'
                        WHEN 'IRDate' THEN '[ELOG_DetentionBill].[IRDate]'
                        WHEN 'IRDate DESC' THEN '[ELOG_DetentionBill].[IRDate] DESC'
                        WHEN 'SupplierID' THEN '[ELOG_DetentionBill].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[ELOG_DetentionBill].[SupplierID] DESC'
                        WHEN 'SupplierBillNo' THEN '[ELOG_DetentionBill].[SupplierBillNo]'
                        WHEN 'SupplierBillNo DESC' THEN '[ELOG_DetentionBill].[SupplierBillNo] DESC'
                        WHEN 'SupplierBillDate' THEN '[ELOG_DetentionBill].[SupplierBillDate]'
                        WHEN 'SupplierBillDate DESC' THEN '[ELOG_DetentionBill].[SupplierBillDate] DESC'
                        WHEN 'BillAmount' THEN '[ELOG_DetentionBill].[BillAmount]'
                        WHEN 'BillAmount DESC' THEN '[ELOG_DetentionBill].[BillAmount] DESC'
                        WHEN 'GRNo' THEN '[ELOG_DetentionBill].[GRNo]'
                        WHEN 'GRNo DESC' THEN '[ELOG_DetentionBill].[GRNo] DESC'
                        WHEN 'GRDate' THEN '[ELOG_DetentionBill].[GRDate]'
                        WHEN 'GRDate DESC' THEN '[ELOG_DetentionBill].[GRDate] DESC'
                        WHEN 'ProjectID' THEN '[ELOG_DetentionBill].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[ELOG_DetentionBill].[ProjectID] DESC'
                        WHEN 'PONumber' THEN '[ELOG_DetentionBill].[PONumber]'
                        WHEN 'PONumber DESC' THEN '[ELOG_DetentionBill].[PONumber] DESC'
                        WHEN 'BillTypeID' THEN '[ELOG_DetentionBill].[BillTypeID]'
                        WHEN 'BillTypeID DESC' THEN '[ELOG_DetentionBill].[BillTypeID] DESC'
                        WHEN 'OtherBillType' THEN '[ELOG_DetentionBill].[OtherBillType]'
                        WHEN 'OtherBillType DESC' THEN '[ELOG_DetentionBill].[OtherBillType] DESC'
                        WHEN 'VehicleExeNo' THEN '[ELOG_DetentionBill].[VehicleExeNo]'
                        WHEN 'VehicleExeNo DESC' THEN '[ELOG_DetentionBill].[VehicleExeNo] DESC'
                        WHEN 'MRNNo' THEN '[ELOG_DetentionBill].[MRNNo]'
                        WHEN 'MRNNo DESC' THEN '[ELOG_DetentionBill].[MRNNo] DESC'
                        WHEN 'CreatedOn' THEN '[ELOG_DetentionBill].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[ELOG_DetentionBill].[CreatedOn] DESC'
                        WHEN 'StatusID' THEN '[ELOG_DetentionBill].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[ELOG_DetentionBill].[StatusID] DESC'
                        WHEN 'CreatedBy' THEN '[ELOG_DetentionBill].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[ELOG_DetentionBill].[CreatedBy] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'ELOG_DetentionBillStatus2_Description' THEN '[ELOG_DetentionBillStatus2].[Description]'
                        WHEN 'ELOG_DetentionBillStatus2_Description DESC' THEN '[ELOG_DetentionBillStatus2].[Description] DESC'
                        WHEN 'ELOG_DetentionBillTypes3_Description' THEN '[ELOG_DetentionBillTypes3].[Description]'
                        WHEN 'ELOG_DetentionBillTypes3_Description DESC' THEN '[ELOG_DetentionBillTypes3].[Description] DESC'
                        WHEN 'IDM_Projects4_Description' THEN '[IDM_Projects4].[Description]'
                        WHEN 'IDM_Projects4_Description DESC' THEN '[IDM_Projects4].[Description] DESC'
                        WHEN 'VR_BusinessPartner5_BPName' THEN '[VR_BusinessPartner5].[BPName]'
                        WHEN 'VR_BusinessPartner5_BPName DESC' THEN '[VR_BusinessPartner5].[BPName] DESC'
                        ELSE '[ELOG_DetentionBill].[IRNo]'
                    END
  EXEC (@LGSQL)

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

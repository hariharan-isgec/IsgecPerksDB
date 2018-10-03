USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLSelectListFilteres]
  @Filter_SupplierID NVarChar(9),
  @Filter_ProjectID NVarChar(6),
  @Filter_BLID NVarChar(9),
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
  SET @LGSQL = @LGSQL + '[ELOG_IRBL].[IRNo]'
  SET @LGSQL = @LGSQL + ' FROM [ELOG_IRBL] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBL].[CreatedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_BLHeader] AS [ELOG_BLHeader2]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBL].[BLID] = [ELOG_BLHeader2].[BLID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_BLTypes] AS [ELOG_BLTypes3]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBL].[BLType] = [ELOG_BLTypes3].[BLTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_CargoTypes] AS [ELOG_CargoTypes4]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBL].[CargoTypeID] = [ELOG_CargoTypes4].[CargoTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_Carriers] AS [ELOG_Carriers5]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBL].[CarrierID] = [ELOG_Carriers5].[CarrierID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_LocationCountries] AS [ELOG_LocationCountries6]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBL].[LocationCountryID] = [ELOG_LocationCountries6].[LocationCountryID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_Ports] AS [ELOG_Ports7]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBL].[PortID] = [ELOG_Ports7].[PortID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_ShipmentModes] AS [ELOG_ShipmentModes8]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBL].[ShipmentModeID] = [ELOG_ShipmentModes8].[ShipmentModeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects9]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBL].[ProjectID] = [IDM_Projects9].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner10]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBL].[SupplierID] = [VR_BusinessPartner10].[BPID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [ELOG_IRBLStates] AS [ELOG_IRBLStates11]'
  SET @LGSQL = @LGSQL + '    ON [ELOG_IRBL].[StatusID] = [ELOG_IRBLStates11].[StatusID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SupplierID > '') 
    SET @LGSQL = @LGSQL + ' AND [ELOG_IRBL].[SupplierID] = ''' + @Filter_SupplierID + ''''
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [ELOG_IRBL].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_BLID > '') 
    SET @LGSQL = @LGSQL + ' AND [ELOG_IRBL].[BLID] = ''' + @Filter_BLID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'IRNo' THEN '[ELOG_IRBL].[IRNo]'
                        WHEN 'IRNo DESC' THEN '[ELOG_IRBL].[IRNo] DESC'
                        WHEN 'SupplierID' THEN '[ELOG_IRBL].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[ELOG_IRBL].[SupplierID] DESC'
                        WHEN 'ProjectID' THEN '[ELOG_IRBL].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[ELOG_IRBL].[ProjectID] DESC'
                        WHEN 'PONo' THEN '[ELOG_IRBL].[PONo]'
                        WHEN 'PONo DESC' THEN '[ELOG_IRBL].[PONo] DESC'
                        WHEN 'SupplierBillNo' THEN '[ELOG_IRBL].[SupplierBillNo]'
                        WHEN 'SupplierBillNo DESC' THEN '[ELOG_IRBL].[SupplierBillNo] DESC'
                        WHEN 'supplierBillDate' THEN '[ELOG_IRBL].[supplierBillDate]'
                        WHEN 'supplierBillDate DESC' THEN '[ELOG_IRBL].[supplierBillDate] DESC'
                        WHEN 'SupplierBillAmount' THEN '[ELOG_IRBL].[SupplierBillAmount]'
                        WHEN 'SupplierBillAmount DESC' THEN '[ELOG_IRBL].[SupplierBillAmount] DESC'
                        WHEN 'IRDate' THEN '[ELOG_IRBL].[IRDate]'
                        WHEN 'IRDate DESC' THEN '[ELOG_IRBL].[IRDate] DESC'
                        WHEN 'BLID' THEN '[ELOG_IRBL].[BLID]'
                        WHEN 'BLID DESC' THEN '[ELOG_IRBL].[BLID] DESC'
                        WHEN 'BLType' THEN '[ELOG_IRBL].[BLType]'
                        WHEN 'BLType DESC' THEN '[ELOG_IRBL].[BLType] DESC'
                        WHEN 'MBLNo' THEN '[ELOG_IRBL].[MBLNo]'
                        WHEN 'MBLNo DESC' THEN '[ELOG_IRBL].[MBLNo] DESC'
                        WHEN 'Remarks' THEN '[ELOG_IRBL].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[ELOG_IRBL].[Remarks] DESC'
                        WHEN 'ShipmentModeID' THEN '[ELOG_IRBL].[ShipmentModeID]'
                        WHEN 'ShipmentModeID DESC' THEN '[ELOG_IRBL].[ShipmentModeID] DESC'
                        WHEN 'CarrierID' THEN '[ELOG_IRBL].[CarrierID]'
                        WHEN 'CarrierID DESC' THEN '[ELOG_IRBL].[CarrierID] DESC'
                        WHEN 'OtherCarrier' THEN '[ELOG_IRBL].[OtherCarrier]'
                        WHEN 'OtherCarrier DESC' THEN '[ELOG_IRBL].[OtherCarrier] DESC'
                        WHEN 'LocationCountryID' THEN '[ELOG_IRBL].[LocationCountryID]'
                        WHEN 'LocationCountryID DESC' THEN '[ELOG_IRBL].[LocationCountryID] DESC'
                        WHEN 'OtherCountry' THEN '[ELOG_IRBL].[OtherCountry]'
                        WHEN 'OtherCountry DESC' THEN '[ELOG_IRBL].[OtherCountry] DESC'
                        WHEN 'CargoTypeID' THEN '[ELOG_IRBL].[CargoTypeID]'
                        WHEN 'CargoTypeID DESC' THEN '[ELOG_IRBL].[CargoTypeID] DESC'
                        WHEN 'PortID' THEN '[ELOG_IRBL].[PortID]'
                        WHEN 'PortID DESC' THEN '[ELOG_IRBL].[PortID] DESC'
                        WHEN 'OtherPortLoadingOrigin' THEN '[ELOG_IRBL].[OtherPortLoadingOrigin]'
                        WHEN 'OtherPortLoadingOrigin DESC' THEN '[ELOG_IRBL].[OtherPortLoadingOrigin] DESC'
                        WHEN 'StatusID' THEN '[ELOG_IRBL].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[ELOG_IRBL].[StatusID] DESC'
                        WHEN 'CreatedOn' THEN '[ELOG_IRBL].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[ELOG_IRBL].[CreatedOn] DESC'
                        WHEN 'CreatedBy' THEN '[ELOG_IRBL].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[ELOG_IRBL].[CreatedBy] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'ELOG_BLHeader2_BLNumber' THEN '[ELOG_BLHeader2].[BLNumber]'
                        WHEN 'ELOG_BLHeader2_BLNumber DESC' THEN '[ELOG_BLHeader2].[BLNumber] DESC'
                        WHEN 'ELOG_BLTypes3_Description' THEN '[ELOG_BLTypes3].[Description]'
                        WHEN 'ELOG_BLTypes3_Description DESC' THEN '[ELOG_BLTypes3].[Description] DESC'
                        WHEN 'ELOG_CargoTypes4_Description' THEN '[ELOG_CargoTypes4].[Description]'
                        WHEN 'ELOG_CargoTypes4_Description DESC' THEN '[ELOG_CargoTypes4].[Description] DESC'
                        WHEN 'ELOG_Carriers5_Description' THEN '[ELOG_Carriers5].[Description]'
                        WHEN 'ELOG_Carriers5_Description DESC' THEN '[ELOG_Carriers5].[Description] DESC'
                        WHEN 'ELOG_LocationCountries6_Description' THEN '[ELOG_LocationCountries6].[Description]'
                        WHEN 'ELOG_LocationCountries6_Description DESC' THEN '[ELOG_LocationCountries6].[Description] DESC'
                        WHEN 'ELOG_Ports7_Description' THEN '[ELOG_Ports7].[Description]'
                        WHEN 'ELOG_Ports7_Description DESC' THEN '[ELOG_Ports7].[Description] DESC'
                        WHEN 'ELOG_ShipmentModes8_Description' THEN '[ELOG_ShipmentModes8].[Description]'
                        WHEN 'ELOG_ShipmentModes8_Description DESC' THEN '[ELOG_ShipmentModes8].[Description] DESC'
                        WHEN 'IDM_Projects9_Description' THEN '[IDM_Projects9].[Description]'
                        WHEN 'IDM_Projects9_Description DESC' THEN '[IDM_Projects9].[Description] DESC'
                        WHEN 'VR_BusinessPartner10_BPName' THEN '[VR_BusinessPartner10].[BPName]'
                        WHEN 'VR_BusinessPartner10_BPName DESC' THEN '[VR_BusinessPartner10].[BPName] DESC'
                        WHEN 'ELOG_IRBLStates11_Description' THEN '[ELOG_IRBLStates11].[Description]'
                        WHEN 'ELOG_IRBLStates11_Description DESC' THEN '[ELOG_IRBLStates11].[Description] DESC'
                        ELSE '[ELOG_IRBL].[IRNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [ELOG_IRBL].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [ELOG_BLHeader2].[BLNumber] AS ELOG_BLHeader2_BLNumber,
    [ELOG_BLTypes3].[Description] AS ELOG_BLTypes3_Description,
    [ELOG_CargoTypes4].[Description] AS ELOG_CargoTypes4_Description,
    [ELOG_Carriers5].[Description] AS ELOG_Carriers5_Description,
    [ELOG_LocationCountries6].[Description] AS ELOG_LocationCountries6_Description,
    [ELOG_Ports7].[Description] AS ELOG_Ports7_Description,
    [ELOG_ShipmentModes8].[Description] AS ELOG_ShipmentModes8_Description,
    [IDM_Projects9].[Description] AS IDM_Projects9_Description,
    [VR_BusinessPartner10].[BPName] AS VR_BusinessPartner10_BPName,
    [ELOG_IRBLStates11].[Description] AS ELOG_IRBLStates11_Description 
  FROM [ELOG_IRBL] 
      INNER JOIN #PageIndex
          ON [ELOG_IRBL].[IRNo] = #PageIndex.IRNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [ELOG_IRBL].[CreatedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [ELOG_BLHeader] AS [ELOG_BLHeader2]
    ON [ELOG_IRBL].[BLID] = [ELOG_BLHeader2].[BLID]
  LEFT OUTER JOIN [ELOG_BLTypes] AS [ELOG_BLTypes3]
    ON [ELOG_IRBL].[BLType] = [ELOG_BLTypes3].[BLTypeID]
  LEFT OUTER JOIN [ELOG_CargoTypes] AS [ELOG_CargoTypes4]
    ON [ELOG_IRBL].[CargoTypeID] = [ELOG_CargoTypes4].[CargoTypeID]
  LEFT OUTER JOIN [ELOG_Carriers] AS [ELOG_Carriers5]
    ON [ELOG_IRBL].[CarrierID] = [ELOG_Carriers5].[CarrierID]
  LEFT OUTER JOIN [ELOG_LocationCountries] AS [ELOG_LocationCountries6]
    ON [ELOG_IRBL].[LocationCountryID] = [ELOG_LocationCountries6].[LocationCountryID]
  LEFT OUTER JOIN [ELOG_Ports] AS [ELOG_Ports7]
    ON [ELOG_IRBL].[PortID] = [ELOG_Ports7].[PortID]
  LEFT OUTER JOIN [ELOG_ShipmentModes] AS [ELOG_ShipmentModes8]
    ON [ELOG_IRBL].[ShipmentModeID] = [ELOG_ShipmentModes8].[ShipmentModeID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects9]
    ON [ELOG_IRBL].[ProjectID] = [IDM_Projects9].[ProjectID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner10]
    ON [ELOG_IRBL].[SupplierID] = [VR_BusinessPartner10].[BPID]
  LEFT OUTER JOIN [ELOG_IRBLStates] AS [ELOG_IRBLStates11]
    ON [ELOG_IRBL].[StatusID] = [ELOG_IRBLStates11].[StatusID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

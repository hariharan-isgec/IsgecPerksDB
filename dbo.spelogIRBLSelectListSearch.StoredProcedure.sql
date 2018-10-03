USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLSelectListSearch]
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
  SELECT [ELOG_IRBL].[IRNo] FROM [ELOG_IRBL]
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
   ( 
         STR(ISNULL([ELOG_IRBL].[IRNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_IRBL].[SupplierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_IRBL].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_IRBL].[PONo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_IRBL].[SupplierBillNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBL].[SupplierBillAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_IRBL].[BLID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBL].[BLType], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_IRBL].[MBLNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_IRBL].[Remarks],'')) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBL].[ShipmentModeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBL].[CarrierID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_IRBL].[OtherCarrier],'')) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBL].[LocationCountryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_IRBL].[OtherCountry],'')) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBL].[CargoTypeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBL].[PortID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_IRBL].[OtherPortLoadingOrigin],'')) LIKE @KeyWord1
     OR STR(ISNULL([ELOG_IRBL].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_IRBL].[CreatedBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'IRNo' THEN [ELOG_IRBL].[IRNo] END,
     CASE @OrderBy WHEN 'IRNo DESC' THEN [ELOG_IRBL].[IRNo] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [ELOG_IRBL].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [ELOG_IRBL].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [ELOG_IRBL].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [ELOG_IRBL].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'PONo' THEN [ELOG_IRBL].[PONo] END,
     CASE @OrderBy WHEN 'PONo DESC' THEN [ELOG_IRBL].[PONo] END DESC,
     CASE @OrderBy WHEN 'SupplierBillNo' THEN [ELOG_IRBL].[SupplierBillNo] END,
     CASE @OrderBy WHEN 'SupplierBillNo DESC' THEN [ELOG_IRBL].[SupplierBillNo] END DESC,
     CASE @OrderBy WHEN 'supplierBillDate' THEN [ELOG_IRBL].[supplierBillDate] END,
     CASE @OrderBy WHEN 'supplierBillDate DESC' THEN [ELOG_IRBL].[supplierBillDate] END DESC,
     CASE @OrderBy WHEN 'SupplierBillAmount' THEN [ELOG_IRBL].[SupplierBillAmount] END,
     CASE @OrderBy WHEN 'SupplierBillAmount DESC' THEN [ELOG_IRBL].[SupplierBillAmount] END DESC,
     CASE @OrderBy WHEN 'IRDate' THEN [ELOG_IRBL].[IRDate] END,
     CASE @OrderBy WHEN 'IRDate DESC' THEN [ELOG_IRBL].[IRDate] END DESC,
     CASE @OrderBy WHEN 'BLID' THEN [ELOG_IRBL].[BLID] END,
     CASE @OrderBy WHEN 'BLID DESC' THEN [ELOG_IRBL].[BLID] END DESC,
     CASE @OrderBy WHEN 'BLType' THEN [ELOG_IRBL].[BLType] END,
     CASE @OrderBy WHEN 'BLType DESC' THEN [ELOG_IRBL].[BLType] END DESC,
     CASE @OrderBy WHEN 'MBLNo' THEN [ELOG_IRBL].[MBLNo] END,
     CASE @OrderBy WHEN 'MBLNo DESC' THEN [ELOG_IRBL].[MBLNo] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [ELOG_IRBL].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [ELOG_IRBL].[Remarks] END DESC,
     CASE @OrderBy WHEN 'ShipmentModeID' THEN [ELOG_IRBL].[ShipmentModeID] END,
     CASE @OrderBy WHEN 'ShipmentModeID DESC' THEN [ELOG_IRBL].[ShipmentModeID] END DESC,
     CASE @OrderBy WHEN 'CarrierID' THEN [ELOG_IRBL].[CarrierID] END,
     CASE @OrderBy WHEN 'CarrierID DESC' THEN [ELOG_IRBL].[CarrierID] END DESC,
     CASE @OrderBy WHEN 'OtherCarrier' THEN [ELOG_IRBL].[OtherCarrier] END,
     CASE @OrderBy WHEN 'OtherCarrier DESC' THEN [ELOG_IRBL].[OtherCarrier] END DESC,
     CASE @OrderBy WHEN 'LocationCountryID' THEN [ELOG_IRBL].[LocationCountryID] END,
     CASE @OrderBy WHEN 'LocationCountryID DESC' THEN [ELOG_IRBL].[LocationCountryID] END DESC,
     CASE @OrderBy WHEN 'OtherCountry' THEN [ELOG_IRBL].[OtherCountry] END,
     CASE @OrderBy WHEN 'OtherCountry DESC' THEN [ELOG_IRBL].[OtherCountry] END DESC,
     CASE @OrderBy WHEN 'CargoTypeID' THEN [ELOG_IRBL].[CargoTypeID] END,
     CASE @OrderBy WHEN 'CargoTypeID DESC' THEN [ELOG_IRBL].[CargoTypeID] END DESC,
     CASE @OrderBy WHEN 'PortID' THEN [ELOG_IRBL].[PortID] END,
     CASE @OrderBy WHEN 'PortID DESC' THEN [ELOG_IRBL].[PortID] END DESC,
     CASE @OrderBy WHEN 'OtherPortLoadingOrigin' THEN [ELOG_IRBL].[OtherPortLoadingOrigin] END,
     CASE @OrderBy WHEN 'OtherPortLoadingOrigin DESC' THEN [ELOG_IRBL].[OtherPortLoadingOrigin] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [ELOG_IRBL].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [ELOG_IRBL].[StatusID] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [ELOG_IRBL].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [ELOG_IRBL].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [ELOG_IRBL].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [ELOG_IRBL].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'ELOG_BLHeader2_BLNumber' THEN [ELOG_BLHeader2].[BLNumber] END,
     CASE @OrderBy WHEN 'ELOG_BLHeader2_BLNumber DESC' THEN [ELOG_BLHeader2].[BLNumber] END DESC,
     CASE @OrderBy WHEN 'ELOG_BLTypes3_Description' THEN [ELOG_BLTypes3].[Description] END,
     CASE @OrderBy WHEN 'ELOG_BLTypes3_Description DESC' THEN [ELOG_BLTypes3].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_CargoTypes4_Description' THEN [ELOG_CargoTypes4].[Description] END,
     CASE @OrderBy WHEN 'ELOG_CargoTypes4_Description DESC' THEN [ELOG_CargoTypes4].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_Carriers5_Description' THEN [ELOG_Carriers5].[Description] END,
     CASE @OrderBy WHEN 'ELOG_Carriers5_Description DESC' THEN [ELOG_Carriers5].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_LocationCountries6_Description' THEN [ELOG_LocationCountries6].[Description] END,
     CASE @OrderBy WHEN 'ELOG_LocationCountries6_Description DESC' THEN [ELOG_LocationCountries6].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_Ports7_Description' THEN [ELOG_Ports7].[Description] END,
     CASE @OrderBy WHEN 'ELOG_Ports7_Description DESC' THEN [ELOG_Ports7].[Description] END DESC,
     CASE @OrderBy WHEN 'ELOG_ShipmentModes8_Description' THEN [ELOG_ShipmentModes8].[Description] END,
     CASE @OrderBy WHEN 'ELOG_ShipmentModes8_Description DESC' THEN [ELOG_ShipmentModes8].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects9_Description' THEN [IDM_Projects9].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects9_Description DESC' THEN [IDM_Projects9].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner10_BPName' THEN [VR_BusinessPartner10].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner10_BPName DESC' THEN [VR_BusinessPartner10].[BPName] END DESC,
     CASE @OrderBy WHEN 'ELOG_IRBLStates11_Description' THEN [ELOG_IRBLStates11].[Description] END,
     CASE @OrderBy WHEN 'ELOG_IRBLStates11_Description DESC' THEN [ELOG_IRBLStates11].[Description] END DESC 

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

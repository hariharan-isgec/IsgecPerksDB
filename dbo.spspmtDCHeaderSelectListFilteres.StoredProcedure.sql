USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCHeaderSelectListFilteres]
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
 ,ChallanID NVarChar(20) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ChallanID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_DCHeader].[ChallanID]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_DCHeader] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[CreatedBy] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies2]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[UnitID] = [HRM_Companies2].[CompanyID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects3]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[ProjectID] = [IDM_Projects3].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_DCStates] AS [SPMT_DCStates4]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[StatusID] = [SPMT_DCStates4].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates5]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[PlaceOfSupply] = [SPMT_ERPStates5].[StateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates6]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[PlaceOfDelivery] = [SPMT_ERPStates6].[StateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates7]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[ConsignerStateID] = [SPMT_ERPStates7].[StateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates8]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[ConsigneeStateID] = [SPMT_ERPStates8].[StateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN9]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[ConsignerIsgecID] = [SPMT_IsgecGSTIN9].[GSTID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN10]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[ConsigneeIsgecID] = [SPMT_IsgecGSTIN10].[GSTID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN11]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[IssuerID] = [SPMT_IsgecGSTIN11].[GSTID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ModeOfTransport] AS [SPMT_ModeOfTransport12]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[ModeOfTransportID] = [SPMT_ModeOfTransport12].[ModeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN13]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[ConsignerBPID] = [VR_BPGSTIN13].[BPID]'
  SET @LGSQL = @LGSQL + '    AND [SPMT_DCHeader].[ConsignerGSTIN] = [VR_BPGSTIN13].[GSTIN]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN14]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[ConsigneeBPID] = [VR_BPGSTIN14].[BPID]'
  SET @LGSQL = @LGSQL + '    AND [SPMT_DCHeader].[ConsigneeGSTIN] = [VR_BPGSTIN14].[GSTIN]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner15]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[ConsignerBPID] = [VR_BusinessPartner15].[BPID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner16]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[TransporterID] = [VR_BusinessPartner16].[BPID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner17]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[ConsigneeBPID] = [VR_BusinessPartner17].[BPID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users18]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[ReceivedBy] = [aspnet_users18].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users19]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[ClosedBy] = [aspnet_users19].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_DCHeader] AS [SPMT_DCHeader20]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[LinkedChallanID] = [SPMT_DCHeader20].[ChallanID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates21]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[DestinationStateID] = [SPMT_ERPStates21].[StateID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN22]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[DestinationIsgecID] = [SPMT_IsgecGSTIN22].[GSTID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN23]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[DestinationBPID] = [VR_BPGSTIN23].[BPID]'
  SET @LGSQL = @LGSQL + '    AND [SPMT_DCHeader].[DestinationGSTIN] = [VR_BPGSTIN23].[GSTIN]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner24]'
  SET @LGSQL = @LGSQL + '    ON [SPMT_DCHeader].[DestinationBPID] = [VR_BusinessPartner24].[BPID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ChallanID' THEN '[SPMT_DCHeader].[ChallanID]'
                        WHEN 'ChallanID DESC' THEN '[SPMT_DCHeader].[ChallanID] DESC'
                        WHEN 'LinkedChallanID' THEN '[SPMT_DCHeader].[LinkedChallanID]'
                        WHEN 'LinkedChallanID DESC' THEN '[SPMT_DCHeader].[LinkedChallanID] DESC'
                        WHEN 'DestinationIsgecID' THEN '[SPMT_DCHeader].[DestinationIsgecID]'
                        WHEN 'DestinationIsgecID DESC' THEN '[SPMT_DCHeader].[DestinationIsgecID] DESC'
                        WHEN 'DestinationBPID' THEN '[SPMT_DCHeader].[DestinationBPID]'
                        WHEN 'DestinationBPID DESC' THEN '[SPMT_DCHeader].[DestinationBPID] DESC'
                        WHEN 'DestinationGSTIN' THEN '[SPMT_DCHeader].[DestinationGSTIN]'
                        WHEN 'DestinationGSTIN DESC' THEN '[SPMT_DCHeader].[DestinationGSTIN] DESC'
                        WHEN 'DestinationName' THEN '[SPMT_DCHeader].[DestinationName]'
                        WHEN 'DestinationName DESC' THEN '[SPMT_DCHeader].[DestinationName] DESC'
                        WHEN 'DestinationGSTINNo' THEN '[SPMT_DCHeader].[DestinationGSTINNo]'
                        WHEN 'DestinationGSTINNo DESC' THEN '[SPMT_DCHeader].[DestinationGSTINNo] DESC'
                        WHEN 'DestinationAddress1Line' THEN '[SPMT_DCHeader].[DestinationAddress1Line]'
                        WHEN 'DestinationAddress1Line DESC' THEN '[SPMT_DCHeader].[DestinationAddress1Line] DESC'
                        WHEN 'DestinationAddress2Line' THEN '[SPMT_DCHeader].[DestinationAddress2Line]'
                        WHEN 'DestinationAddress2Line DESC' THEN '[SPMT_DCHeader].[DestinationAddress2Line] DESC'
                        WHEN 'DestinationAddress3Line' THEN '[SPMT_DCHeader].[DestinationAddress3Line]'
                        WHEN 'DestinationAddress3Line DESC' THEN '[SPMT_DCHeader].[DestinationAddress3Line] DESC'
                        WHEN 'DestinationStateID' THEN '[SPMT_DCHeader].[DestinationStateID]'
                        WHEN 'DestinationStateID DESC' THEN '[SPMT_DCHeader].[DestinationStateID] DESC'
                        WHEN 'ProjectID' THEN '[SPMT_DCHeader].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[SPMT_DCHeader].[ProjectID] DESC'
                        WHEN 'UnitID' THEN '[SPMT_DCHeader].[UnitID]'
                        WHEN 'UnitID DESC' THEN '[SPMT_DCHeader].[UnitID] DESC'
                        WHEN 'PONo' THEN '[SPMT_DCHeader].[PONo]'
                        WHEN 'PONo DESC' THEN '[SPMT_DCHeader].[PONo] DESC'
                        WHEN 'PlaceOfSupply' THEN '[SPMT_DCHeader].[PlaceOfSupply]'
                        WHEN 'PlaceOfSupply DESC' THEN '[SPMT_DCHeader].[PlaceOfSupply] DESC'
                        WHEN 'PlaceOfDelivery' THEN '[SPMT_DCHeader].[PlaceOfDelivery]'
                        WHEN 'PlaceOfDelivery DESC' THEN '[SPMT_DCHeader].[PlaceOfDelivery] DESC'
                        WHEN 'ConsignerIsgecID' THEN '[SPMT_DCHeader].[ConsignerIsgecID]'
                        WHEN 'ConsignerIsgecID DESC' THEN '[SPMT_DCHeader].[ConsignerIsgecID] DESC'
                        WHEN 'ConsigneeIsgecID' THEN '[SPMT_DCHeader].[ConsigneeIsgecID]'
                        WHEN 'ConsigneeIsgecID DESC' THEN '[SPMT_DCHeader].[ConsigneeIsgecID] DESC'
                        WHEN 'ConsignerBPID' THEN '[SPMT_DCHeader].[ConsignerBPID]'
                        WHEN 'ConsignerBPID DESC' THEN '[SPMT_DCHeader].[ConsignerBPID] DESC'
                        WHEN 'ConsigneeBPID' THEN '[SPMT_DCHeader].[ConsigneeBPID]'
                        WHEN 'ConsigneeBPID DESC' THEN '[SPMT_DCHeader].[ConsigneeBPID] DESC'
                        WHEN 'ConsignerGSTIN' THEN '[SPMT_DCHeader].[ConsignerGSTIN]'
                        WHEN 'ConsignerGSTIN DESC' THEN '[SPMT_DCHeader].[ConsignerGSTIN] DESC'
                        WHEN 'ConsigneeGSTIN' THEN '[SPMT_DCHeader].[ConsigneeGSTIN]'
                        WHEN 'ConsigneeGSTIN DESC' THEN '[SPMT_DCHeader].[ConsigneeGSTIN] DESC'
                        WHEN 'ConsignerName' THEN '[SPMT_DCHeader].[ConsignerName]'
                        WHEN 'ConsignerName DESC' THEN '[SPMT_DCHeader].[ConsignerName] DESC'
                        WHEN 'ConsigneeName' THEN '[SPMT_DCHeader].[ConsigneeName]'
                        WHEN 'ConsigneeName DESC' THEN '[SPMT_DCHeader].[ConsigneeName] DESC'
                        WHEN 'ConsignerGSTINNo' THEN '[SPMT_DCHeader].[ConsignerGSTINNo]'
                        WHEN 'ConsignerGSTINNo DESC' THEN '[SPMT_DCHeader].[ConsignerGSTINNo] DESC'
                        WHEN 'ConsigneeGSTINNo' THEN '[SPMT_DCHeader].[ConsigneeGSTINNo]'
                        WHEN 'ConsigneeGSTINNo DESC' THEN '[SPMT_DCHeader].[ConsigneeGSTINNo] DESC'
                        WHEN 'ConsignerAddress1Line' THEN '[SPMT_DCHeader].[ConsignerAddress1Line]'
                        WHEN 'ConsignerAddress1Line DESC' THEN '[SPMT_DCHeader].[ConsignerAddress1Line] DESC'
                        WHEN 'ConsigneeAddress1Line' THEN '[SPMT_DCHeader].[ConsigneeAddress1Line]'
                        WHEN 'ConsigneeAddress1Line DESC' THEN '[SPMT_DCHeader].[ConsigneeAddress1Line] DESC'
                        WHEN 'ConsignerAddress2Line' THEN '[SPMT_DCHeader].[ConsignerAddress2Line]'
                        WHEN 'ConsignerAddress2Line DESC' THEN '[SPMT_DCHeader].[ConsignerAddress2Line] DESC'
                        WHEN 'ConsigneeAddress2Line' THEN '[SPMT_DCHeader].[ConsigneeAddress2Line]'
                        WHEN 'ConsigneeAddress2Line DESC' THEN '[SPMT_DCHeader].[ConsigneeAddress2Line] DESC'
                        WHEN 'ConsignerAddress3Line' THEN '[SPMT_DCHeader].[ConsignerAddress3Line]'
                        WHEN 'ConsignerAddress3Line DESC' THEN '[SPMT_DCHeader].[ConsignerAddress3Line] DESC'
                        WHEN 'ConsigneeAddress3Line' THEN '[SPMT_DCHeader].[ConsigneeAddress3Line]'
                        WHEN 'ConsigneeAddress3Line DESC' THEN '[SPMT_DCHeader].[ConsigneeAddress3Line] DESC'
                        WHEN 'ConsignerStateID' THEN '[SPMT_DCHeader].[ConsignerStateID]'
                        WHEN 'ConsignerStateID DESC' THEN '[SPMT_DCHeader].[ConsignerStateID] DESC'
                        WHEN 'ConsigneeStateID' THEN '[SPMT_DCHeader].[ConsigneeStateID]'
                        WHEN 'ConsigneeStateID DESC' THEN '[SPMT_DCHeader].[ConsigneeStateID] DESC'
                        WHEN 'Purpose' THEN '[SPMT_DCHeader].[Purpose]'
                        WHEN 'Purpose DESC' THEN '[SPMT_DCHeader].[Purpose] DESC'
                        WHEN 'ExpectedReturnDate' THEN '[SPMT_DCHeader].[ExpectedReturnDate]'
                        WHEN 'ExpectedReturnDate DESC' THEN '[SPMT_DCHeader].[ExpectedReturnDate] DESC'
                        WHEN 'ModeOfTransportID' THEN '[SPMT_DCHeader].[ModeOfTransportID]'
                        WHEN 'ModeOfTransportID DESC' THEN '[SPMT_DCHeader].[ModeOfTransportID] DESC'
                        WHEN 'VehicleNo' THEN '[SPMT_DCHeader].[VehicleNo]'
                        WHEN 'VehicleNo DESC' THEN '[SPMT_DCHeader].[VehicleNo] DESC'
                        WHEN 'GRNo' THEN '[SPMT_DCHeader].[GRNo]'
                        WHEN 'GRNo DESC' THEN '[SPMT_DCHeader].[GRNo] DESC'
                        WHEN 'GRDate' THEN '[SPMT_DCHeader].[GRDate]'
                        WHEN 'GRDate DESC' THEN '[SPMT_DCHeader].[GRDate] DESC'
                        WHEN 'TransporterID' THEN '[SPMT_DCHeader].[TransporterID]'
                        WHEN 'TransporterID DESC' THEN '[SPMT_DCHeader].[TransporterID] DESC'
                        WHEN 'TransporterName' THEN '[SPMT_DCHeader].[TransporterName]'
                        WHEN 'TransporterName DESC' THEN '[SPMT_DCHeader].[TransporterName] DESC'
                        WHEN 'FromPlace' THEN '[SPMT_DCHeader].[FromPlace]'
                        WHEN 'FromPlace DESC' THEN '[SPMT_DCHeader].[FromPlace] DESC'
                        WHEN 'ToPlace' THEN '[SPMT_DCHeader].[ToPlace]'
                        WHEN 'ToPlace DESC' THEN '[SPMT_DCHeader].[ToPlace] DESC'
                        WHEN 'StatusID' THEN '[SPMT_DCHeader].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[SPMT_DCHeader].[StatusID] DESC'
                        WHEN 'CreatedBy' THEN '[SPMT_DCHeader].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[SPMT_DCHeader].[CreatedBy] DESC'
                        WHEN 'TotalAmount' THEN '[SPMT_DCHeader].[TotalAmount]'
                        WHEN 'TotalAmount DESC' THEN '[SPMT_DCHeader].[TotalAmount] DESC'
                        WHEN 'Declaration1Line' THEN '[SPMT_DCHeader].[Declaration1Line]'
                        WHEN 'Declaration1Line DESC' THEN '[SPMT_DCHeader].[Declaration1Line] DESC'
                        WHEN 'CreatedOn' THEN '[SPMT_DCHeader].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[SPMT_DCHeader].[CreatedOn] DESC'
                        WHEN 'TotalAmountInWords' THEN '[SPMT_DCHeader].[TotalAmountInWords]'
                        WHEN 'TotalAmountInWords DESC' THEN '[SPMT_DCHeader].[TotalAmountInWords] DESC'
                        WHEN 'Declaration2Line' THEN '[SPMT_DCHeader].[Declaration2Line]'
                        WHEN 'Declaration2Line DESC' THEN '[SPMT_DCHeader].[Declaration2Line] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'VR_BPGSTIN13_Description' THEN '[VR_BPGSTIN13].[Description]'
                        WHEN 'VR_BPGSTIN13_Description DESC' THEN '[VR_BPGSTIN13].[Description] DESC'
                        WHEN 'VR_BPGSTIN14_Description' THEN '[VR_BPGSTIN14].[Description]'
                        WHEN 'VR_BPGSTIN14_Description DESC' THEN '[VR_BPGSTIN14].[Description] DESC'
                        WHEN 'VR_BusinessPartner15_BPName' THEN '[VR_BusinessPartner15].[BPName]'
                        WHEN 'VR_BusinessPartner15_BPName DESC' THEN '[VR_BusinessPartner15].[BPName] DESC'
                        WHEN 'VR_BusinessPartner16_BPName' THEN '[VR_BusinessPartner16].[BPName]'
                        WHEN 'VR_BusinessPartner16_BPName DESC' THEN '[VR_BusinessPartner16].[BPName] DESC'
                        WHEN 'VR_BusinessPartner17_BPName' THEN '[VR_BusinessPartner17].[BPName]'
                        WHEN 'VR_BusinessPartner17_BPName DESC' THEN '[VR_BusinessPartner17].[BPName] DESC'
                        WHEN 'aspnet_Users18_UserFullName' THEN '[aspnet_Users18].[UserFullName]'
                        WHEN 'aspnet_Users18_UserFullName DESC' THEN '[aspnet_Users18].[UserFullName] DESC'
                        WHEN 'aspnet_Users19_UserFullName' THEN '[aspnet_Users19].[UserFullName]'
                        WHEN 'aspnet_Users19_UserFullName DESC' THEN '[aspnet_Users19].[UserFullName] DESC'
                        WHEN 'SPMT_DCHeader20_Purpose' THEN '[SPMT_DCHeader20].[Purpose]'
                        WHEN 'SPMT_DCHeader20_Purpose DESC' THEN '[SPMT_DCHeader20].[Purpose] DESC'
                        WHEN 'SPMT_ERPStates21_Description' THEN '[SPMT_ERPStates21].[Description]'
                        WHEN 'SPMT_ERPStates21_Description DESC' THEN '[SPMT_ERPStates21].[Description] DESC'
                        WHEN 'SPMT_IsgecGSTIN22_Description' THEN '[SPMT_IsgecGSTIN22].[Description]'
                        WHEN 'SPMT_IsgecGSTIN22_Description DESC' THEN '[SPMT_IsgecGSTIN22].[Description] DESC'
                        WHEN 'VR_BPGSTIN23_Description' THEN '[VR_BPGSTIN23].[Description]'
                        WHEN 'VR_BPGSTIN23_Description DESC' THEN '[VR_BPGSTIN23].[Description] DESC'
                        WHEN 'VR_BusinessPartner24_BPName' THEN '[VR_BusinessPartner24].[BPName]'
                        WHEN 'VR_BusinessPartner24_BPName DESC' THEN '[VR_BusinessPartner24].[BPName] DESC'
                        ELSE '[SPMT_DCHeader].[ChallanID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SPMT_DCHeader].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [HRM_Companies2].[Description] AS HRM_Companies2_Description,
    [IDM_Projects3].[Description] AS IDM_Projects3_Description,
    [SPMT_DCStates4].[Description] AS SPMT_DCStates4_Description,
    [SPMT_ERPStates5].[Description] AS SPMT_ERPStates5_Description,
    [SPMT_ERPStates6].[Description] AS SPMT_ERPStates6_Description,
    [SPMT_ERPStates7].[Description] AS SPMT_ERPStates7_Description,
    [SPMT_ERPStates8].[Description] AS SPMT_ERPStates8_Description,
    [SPMT_IsgecGSTIN9].[Description] AS SPMT_IsgecGSTIN9_Description,
    [SPMT_IsgecGSTIN10].[Description] AS SPMT_IsgecGSTIN10_Description,
    [SPMT_IsgecGSTIN11].[Description] AS SPMT_IsgecGSTIN11_Description,
    [SPMT_ModeOfTransport12].[Description] AS SPMT_ModeOfTransport12_Description,
    [VR_BPGSTIN13].[Description] AS VR_BPGSTIN13_Description,
    [VR_BPGSTIN14].[Description] AS VR_BPGSTIN14_Description,
    [VR_BusinessPartner15].[BPName] AS VR_BusinessPartner15_BPName,
    [VR_BusinessPartner16].[BPName] AS VR_BusinessPartner16_BPName,
    [VR_BusinessPartner17].[BPName] AS VR_BusinessPartner17_BPName,
    [aspnet_Users18].[UserFullName] AS aspnet_Users18_UserFullName,
    [aspnet_Users19].[UserFullName] AS aspnet_Users19_UserFullName,
    [SPMT_DCHeader20].[Purpose] AS SPMT_DCHeader20_Purpose,
    [SPMT_ERPStates21].[Description] AS SPMT_ERPStates21_Description,
    [SPMT_IsgecGSTIN22].[Description] AS SPMT_IsgecGSTIN22_Description,
    [VR_BPGSTIN23].[Description] AS VR_BPGSTIN23_Description,
    [VR_BusinessPartner24].[BPName] AS VR_BusinessPartner24_BPName 
  FROM [SPMT_DCHeader] 
      INNER JOIN #PageIndex
          ON [SPMT_DCHeader].[ChallanID] = #PageIndex.ChallanID
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [SPMT_DCHeader].[CreatedBy] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [HRM_Companies] AS [HRM_Companies2]
    ON [SPMT_DCHeader].[UnitID] = [HRM_Companies2].[CompanyID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects3]
    ON [SPMT_DCHeader].[ProjectID] = [IDM_Projects3].[ProjectID]
  LEFT OUTER JOIN [SPMT_DCStates] AS [SPMT_DCStates4]
    ON [SPMT_DCHeader].[StatusID] = [SPMT_DCStates4].[StatusID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates5]
    ON [SPMT_DCHeader].[PlaceOfSupply] = [SPMT_ERPStates5].[StateID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates6]
    ON [SPMT_DCHeader].[PlaceOfDelivery] = [SPMT_ERPStates6].[StateID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates7]
    ON [SPMT_DCHeader].[ConsignerStateID] = [SPMT_ERPStates7].[StateID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates8]
    ON [SPMT_DCHeader].[ConsigneeStateID] = [SPMT_ERPStates8].[StateID]
  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN9]
    ON [SPMT_DCHeader].[ConsignerIsgecID] = [SPMT_IsgecGSTIN9].[GSTID]
  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN10]
    ON [SPMT_DCHeader].[ConsigneeIsgecID] = [SPMT_IsgecGSTIN10].[GSTID]
  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN11]
    ON [SPMT_DCHeader].[IssuerID] = [SPMT_IsgecGSTIN11].[GSTID]
  LEFT OUTER JOIN [SPMT_ModeOfTransport] AS [SPMT_ModeOfTransport12]
    ON [SPMT_DCHeader].[ModeOfTransportID] = [SPMT_ModeOfTransport12].[ModeID]
  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN13]
    ON [SPMT_DCHeader].[ConsignerBPID] = [VR_BPGSTIN13].[BPID]
    AND [SPMT_DCHeader].[ConsignerGSTIN] = [VR_BPGSTIN13].[GSTIN]
  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN14]
    ON [SPMT_DCHeader].[ConsigneeBPID] = [VR_BPGSTIN14].[BPID]
    AND [SPMT_DCHeader].[ConsigneeGSTIN] = [VR_BPGSTIN14].[GSTIN]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner15]
    ON [SPMT_DCHeader].[ConsignerBPID] = [VR_BusinessPartner15].[BPID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner16]
    ON [SPMT_DCHeader].[TransporterID] = [VR_BusinessPartner16].[BPID]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner17]
    ON [SPMT_DCHeader].[ConsigneeBPID] = [VR_BusinessPartner17].[BPID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users18]
    ON [SPMT_DCHeader].[ReceivedBy] = [aspnet_users18].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users19]
    ON [SPMT_DCHeader].[ClosedBy] = [aspnet_users19].[LoginID]
  LEFT OUTER JOIN [SPMT_DCHeader] AS [SPMT_DCHeader20]
    ON [SPMT_DCHeader].[LinkedChallanID] = [SPMT_DCHeader20].[ChallanID]
  LEFT OUTER JOIN [SPMT_ERPStates] AS [SPMT_ERPStates21]
    ON [SPMT_DCHeader].[DestinationStateID] = [SPMT_ERPStates21].[StateID]
  LEFT OUTER JOIN [SPMT_IsgecGSTIN] AS [SPMT_IsgecGSTIN22]
    ON [SPMT_DCHeader].[DestinationIsgecID] = [SPMT_IsgecGSTIN22].[GSTID]
  LEFT OUTER JOIN [VR_BPGSTIN] AS [VR_BPGSTIN23]
    ON [SPMT_DCHeader].[DestinationBPID] = [VR_BPGSTIN23].[BPID]
    AND [SPMT_DCHeader].[DestinationGSTIN] = [VR_BPGSTIN23].[GSTIN]
  LEFT OUTER JOIN [VR_BusinessPartner] AS [VR_BusinessPartner24]
    ON [SPMT_DCHeader].[DestinationBPID] = [VR_BusinessPartner24].[BPID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END



                        --WHEN 'ReceivedDate' THEN '[SPMT_DCHeader].[ReceivedDate]'
                        --WHEN 'ReceivedDate DESC' THEN '[SPMT_DCHeader].[ReceivedDate] DESC'
                        --WHEN 'ReceivedRemarks' THEN '[SPMT_DCHeader].[ReceivedRemarks]'
                        --WHEN 'ReceivedRemarks DESC' THEN '[SPMT_DCHeader].[ReceivedRemarks] DESC'
                        --WHEN 'ReceivedOn' THEN '[SPMT_DCHeader].[ReceivedOn]'
                        --WHEN 'ReceivedOn DESC' THEN '[SPMT_DCHeader].[ReceivedOn] DESC'
                        --WHEN 'ReceivedBy' THEN '[SPMT_DCHeader].[ReceivedBy]'
                        --WHEN 'ReceivedBy DESC' THEN '[SPMT_DCHeader].[ReceivedBy] DESC'
                        --WHEN 'ClosureRemarks' THEN '[SPMT_DCHeader].[ClosureRemarks]'
                        --WHEN 'ClosureRemarks DESC' THEN '[SPMT_DCHeader].[ClosureRemarks] DESC'
                        --WHEN 'ClosureDate' THEN '[SPMT_DCHeader].[ClosureDate]'
                        --WHEN 'ClosureDate DESC' THEN '[SPMT_DCHeader].[ClosureDate] DESC'
                        --WHEN 'ClosedBy' THEN '[SPMT_DCHeader].[ClosedBy]'
                        --WHEN 'ClosedBy DESC' THEN '[SPMT_DCHeader].[ClosedBy] DESC'
                        --WHEN 'ClosedOn' THEN '[SPMT_DCHeader].[ClosedOn]'
                        --WHEN 'ClosedOn DESC' THEN '[SPMT_DCHeader].[ClosedOn] DESC'
                        --WHEN 'IsgecInvoiceNo' THEN '[SPMT_DCHeader].[IsgecInvoiceNo]'
                        --WHEN 'IsgecInvoiceNo DESC' THEN '[SPMT_DCHeader].[IsgecInvoiceNo] DESC'
                        --WHEN 'IsgecInvoiceDate' THEN '[SPMT_DCHeader].[IsgecInvoiceDate]'
                        --WHEN 'IsgecInvoiceDate DESC' THEN '[SPMT_DCHeader].[IsgecInvoiceDate] DESC'
                        --WHEN 'ChallanDate' THEN '[SPMT_DCHeader].[ChallanDate]'
                        --WHEN 'ChallanDate DESC' THEN '[SPMT_DCHeader].[ChallanDate] DESC'
                        --WHEN 'IssuerID' THEN '[SPMT_DCHeader].[IssuerID]'
                        --WHEN 'IssuerID DESC' THEN '[SPMT_DCHeader].[IssuerID] DESC'
                        --WHEN 'IssuerCompanyName' THEN '[SPMT_DCHeader].[IssuerCompanyName]'
                        --WHEN 'IssuerCompanyName DESC' THEN '[SPMT_DCHeader].[IssuerCompanyName] DESC'
                        --WHEN 'IssuerAddress1Line' THEN '[SPMT_DCHeader].[IssuerAddress1Line]'
                        --WHEN 'IssuerAddress1Line DESC' THEN '[SPMT_DCHeader].[IssuerAddress1Line] DESC'
                        --WHEN 'IssuerAddress2Line' THEN '[SPMT_DCHeader].[IssuerAddress2Line]'
                        --WHEN 'IssuerAddress2Line DESC' THEN '[SPMT_DCHeader].[IssuerAddress2Line] DESC'
                        --WHEN 'IssuerPAN' THEN '[SPMT_DCHeader].[IssuerPAN]'
                        --WHEN 'IssuerPAN DESC' THEN '[SPMT_DCHeader].[IssuerPAN] DESC'
                        --WHEN 'IssuerCIN' THEN '[SPMT_DCHeader].[IssuerCIN]'
                        --WHEN 'IssuerCIN DESC' THEN '[SPMT_DCHeader].[IssuerCIN] DESC'
                        --WHEN 'HRM_Companies2_Description' THEN '[HRM_Companies2].[Description]'
                        --WHEN 'HRM_Companies2_Description DESC' THEN '[HRM_Companies2].[Description] DESC'
                        --WHEN 'IDM_Projects3_Description' THEN '[IDM_Projects3].[Description]'
                        --WHEN 'IDM_Projects3_Description DESC' THEN '[IDM_Projects3].[Description] DESC'
                        --WHEN 'SPMT_DCStates4_Description' THEN '[SPMT_DCStates4].[Description]'
                        --WHEN 'SPMT_DCStates4_Description DESC' THEN '[SPMT_DCStates4].[Description] DESC'
                        --WHEN 'SPMT_ERPStates5_Description' THEN '[SPMT_ERPStates5].[Description]'
                        --WHEN 'SPMT_ERPStates5_Description DESC' THEN '[SPMT_ERPStates5].[Description] DESC'
                        --WHEN 'SPMT_ERPStates6_Description' THEN '[SPMT_ERPStates6].[Description]'
                        --WHEN 'SPMT_ERPStates6_Description DESC' THEN '[SPMT_ERPStates6].[Description] DESC'
                        --WHEN 'SPMT_ERPStates7_Description' THEN '[SPMT_ERPStates7].[Description]'
                        --WHEN 'SPMT_ERPStates7_Description DESC' THEN '[SPMT_ERPStates7].[Description] DESC'
                        --WHEN 'SPMT_ERPStates8_Description' THEN '[SPMT_ERPStates8].[Description]'
                        --WHEN 'SPMT_ERPStates8_Description DESC' THEN '[SPMT_ERPStates8].[Description] DESC'
                        --WHEN 'SPMT_IsgecGSTIN9_Description' THEN '[SPMT_IsgecGSTIN9].[Description]'
                        --WHEN 'SPMT_IsgecGSTIN9_Description DESC' THEN '[SPMT_IsgecGSTIN9].[Description] DESC'
                        --WHEN 'SPMT_IsgecGSTIN10_Description' THEN '[SPMT_IsgecGSTIN10].[Description]'
                        --WHEN 'SPMT_IsgecGSTIN10_Description DESC' THEN '[SPMT_IsgecGSTIN10].[Description] DESC'
                        --WHEN 'SPMT_IsgecGSTIN11_Description' THEN '[SPMT_IsgecGSTIN11].[Description]'
                        --WHEN 'SPMT_IsgecGSTIN11_Description DESC' THEN '[SPMT_IsgecGSTIN11].[Description] DESC'
                        --WHEN 'SPMT_ModeOfTransport12_Description' THEN '[SPMT_ModeOfTransport12].[Description]'
                        --WHEN 'SPMT_ModeOfTransport12_Description DESC' THEN '[SPMT_ModeOfTransport12].[Description] DESC'
GO

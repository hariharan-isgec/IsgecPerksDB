USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtDCHeaderSelectListSearch]
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
 ,ChallanID NVarChar(20) NOT NULL
  )
  INSERT INTO #PageIndex (ChallanID)
  SELECT [SPMT_DCHeader].[ChallanID] FROM [SPMT_DCHeader]
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
   ( 
         LOWER(ISNULL([SPMT_DCHeader].[ChallanID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[LinkedChallanID],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCHeader].[DestinationIsgecID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[DestinationBPID],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCHeader].[DestinationGSTIN], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[DestinationName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[DestinationGSTINNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[DestinationAddress1Line],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[DestinationAddress2Line],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[DestinationAddress3Line],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[DestinationStateID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ReceivedRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ReceivedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ClosureRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ClosedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[IsgecInvoiceNo],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCHeader].[IssuerID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[IssuerCompanyName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[IssuerAddress1Line],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[IssuerAddress2Line],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[IssuerPAN],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[IssuerCIN],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[UnitID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[PONo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[PlaceOfSupply],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[PlaceOfDelivery],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCHeader].[ConsignerIsgecID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCHeader].[ConsigneeIsgecID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ConsignerBPID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ConsigneeBPID],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCHeader].[ConsignerGSTIN], 0)) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCHeader].[ConsigneeGSTIN], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ConsignerName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ConsigneeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ConsignerGSTINNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ConsigneeGSTINNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ConsignerAddress1Line],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ConsigneeAddress1Line],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ConsignerAddress2Line],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ConsigneeAddress2Line],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ConsignerAddress3Line],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ConsigneeAddress3Line],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ConsignerStateID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ConsigneeStateID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[Purpose],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCHeader].[ModeOfTransportID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[VehicleNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[GRNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[TransporterID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[TransporterName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[FromPlace],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[ToPlace],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCHeader].[StatusID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[CreatedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([SPMT_DCHeader].[TotalAmount], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[Declaration1Line],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[TotalAmountInWords],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([SPMT_DCHeader].[Declaration2Line],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ChallanID' THEN [SPMT_DCHeader].[ChallanID] END,
     CASE @OrderBy WHEN 'ChallanID DESC' THEN [SPMT_DCHeader].[ChallanID] END DESC,
     CASE @OrderBy WHEN 'LinkedChallanID' THEN [SPMT_DCHeader].[LinkedChallanID] END,
     CASE @OrderBy WHEN 'LinkedChallanID DESC' THEN [SPMT_DCHeader].[LinkedChallanID] END DESC,
     CASE @OrderBy WHEN 'DestinationIsgecID' THEN [SPMT_DCHeader].[DestinationIsgecID] END,
     CASE @OrderBy WHEN 'DestinationIsgecID DESC' THEN [SPMT_DCHeader].[DestinationIsgecID] END DESC,
     CASE @OrderBy WHEN 'DestinationBPID' THEN [SPMT_DCHeader].[DestinationBPID] END,
     CASE @OrderBy WHEN 'DestinationBPID DESC' THEN [SPMT_DCHeader].[DestinationBPID] END DESC,
     CASE @OrderBy WHEN 'DestinationGSTIN' THEN [SPMT_DCHeader].[DestinationGSTIN] END,
     CASE @OrderBy WHEN 'DestinationGSTIN DESC' THEN [SPMT_DCHeader].[DestinationGSTIN] END DESC,
     CASE @OrderBy WHEN 'DestinationName' THEN [SPMT_DCHeader].[DestinationName] END,
     CASE @OrderBy WHEN 'DestinationName DESC' THEN [SPMT_DCHeader].[DestinationName] END DESC,
     CASE @OrderBy WHEN 'DestinationGSTINNo' THEN [SPMT_DCHeader].[DestinationGSTINNo] END,
     CASE @OrderBy WHEN 'DestinationGSTINNo DESC' THEN [SPMT_DCHeader].[DestinationGSTINNo] END DESC,
     CASE @OrderBy WHEN 'DestinationAddress1Line' THEN [SPMT_DCHeader].[DestinationAddress1Line] END,
     CASE @OrderBy WHEN 'DestinationAddress1Line DESC' THEN [SPMT_DCHeader].[DestinationAddress1Line] END DESC,
     CASE @OrderBy WHEN 'DestinationAddress2Line' THEN [SPMT_DCHeader].[DestinationAddress2Line] END,
     CASE @OrderBy WHEN 'DestinationAddress2Line DESC' THEN [SPMT_DCHeader].[DestinationAddress2Line] END DESC,
     CASE @OrderBy WHEN 'DestinationAddress3Line' THEN [SPMT_DCHeader].[DestinationAddress3Line] END,
     CASE @OrderBy WHEN 'DestinationAddress3Line DESC' THEN [SPMT_DCHeader].[DestinationAddress3Line] END DESC,
     CASE @OrderBy WHEN 'DestinationStateID' THEN [SPMT_DCHeader].[DestinationStateID] END,
     CASE @OrderBy WHEN 'DestinationStateID DESC' THEN [SPMT_DCHeader].[DestinationStateID] END DESC,
     CASE @OrderBy WHEN 'ReceivedDate' THEN [SPMT_DCHeader].[ReceivedDate] END,
     CASE @OrderBy WHEN 'ReceivedDate DESC' THEN [SPMT_DCHeader].[ReceivedDate] END DESC,
     CASE @OrderBy WHEN 'ReceivedRemarks' THEN [SPMT_DCHeader].[ReceivedRemarks] END,
     CASE @OrderBy WHEN 'ReceivedRemarks DESC' THEN [SPMT_DCHeader].[ReceivedRemarks] END DESC,
     CASE @OrderBy WHEN 'ReceivedOn' THEN [SPMT_DCHeader].[ReceivedOn] END,
     CASE @OrderBy WHEN 'ReceivedOn DESC' THEN [SPMT_DCHeader].[ReceivedOn] END DESC,
     CASE @OrderBy WHEN 'ReceivedBy' THEN [SPMT_DCHeader].[ReceivedBy] END,
     CASE @OrderBy WHEN 'ReceivedBy DESC' THEN [SPMT_DCHeader].[ReceivedBy] END DESC,
     CASE @OrderBy WHEN 'ClosureRemarks' THEN [SPMT_DCHeader].[ClosureRemarks] END,
     CASE @OrderBy WHEN 'ClosureRemarks DESC' THEN [SPMT_DCHeader].[ClosureRemarks] END DESC,
     CASE @OrderBy WHEN 'ClosureDate' THEN [SPMT_DCHeader].[ClosureDate] END,
     CASE @OrderBy WHEN 'ClosureDate DESC' THEN [SPMT_DCHeader].[ClosureDate] END DESC,
     CASE @OrderBy WHEN 'ClosedBy' THEN [SPMT_DCHeader].[ClosedBy] END,
     CASE @OrderBy WHEN 'ClosedBy DESC' THEN [SPMT_DCHeader].[ClosedBy] END DESC,
     CASE @OrderBy WHEN 'ClosedOn' THEN [SPMT_DCHeader].[ClosedOn] END,
     CASE @OrderBy WHEN 'ClosedOn DESC' THEN [SPMT_DCHeader].[ClosedOn] END DESC,
     CASE @OrderBy WHEN 'IsgecInvoiceNo' THEN [SPMT_DCHeader].[IsgecInvoiceNo] END,
     CASE @OrderBy WHEN 'IsgecInvoiceNo DESC' THEN [SPMT_DCHeader].[IsgecInvoiceNo] END DESC,
     CASE @OrderBy WHEN 'IsgecInvoiceDate' THEN [SPMT_DCHeader].[IsgecInvoiceDate] END,
     CASE @OrderBy WHEN 'IsgecInvoiceDate DESC' THEN [SPMT_DCHeader].[IsgecInvoiceDate] END DESC,
     CASE @OrderBy WHEN 'ChallanDate' THEN [SPMT_DCHeader].[ChallanDate] END,
     CASE @OrderBy WHEN 'ChallanDate DESC' THEN [SPMT_DCHeader].[ChallanDate] END DESC,
     CASE @OrderBy WHEN 'IssuerID' THEN [SPMT_DCHeader].[IssuerID] END,
     CASE @OrderBy WHEN 'IssuerID DESC' THEN [SPMT_DCHeader].[IssuerID] END DESC,
     CASE @OrderBy WHEN 'IssuerCompanyName' THEN [SPMT_DCHeader].[IssuerCompanyName] END,
     CASE @OrderBy WHEN 'IssuerCompanyName DESC' THEN [SPMT_DCHeader].[IssuerCompanyName] END DESC,
     CASE @OrderBy WHEN 'IssuerAddress1Line' THEN [SPMT_DCHeader].[IssuerAddress1Line] END,
     CASE @OrderBy WHEN 'IssuerAddress1Line DESC' THEN [SPMT_DCHeader].[IssuerAddress1Line] END DESC,
     CASE @OrderBy WHEN 'IssuerAddress2Line' THEN [SPMT_DCHeader].[IssuerAddress2Line] END,
     CASE @OrderBy WHEN 'IssuerAddress2Line DESC' THEN [SPMT_DCHeader].[IssuerAddress2Line] END DESC,
     CASE @OrderBy WHEN 'IssuerPAN' THEN [SPMT_DCHeader].[IssuerPAN] END,
     CASE @OrderBy WHEN 'IssuerPAN DESC' THEN [SPMT_DCHeader].[IssuerPAN] END DESC,
     CASE @OrderBy WHEN 'IssuerCIN' THEN [SPMT_DCHeader].[IssuerCIN] END,
     CASE @OrderBy WHEN 'IssuerCIN DESC' THEN [SPMT_DCHeader].[IssuerCIN] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [SPMT_DCHeader].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [SPMT_DCHeader].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'UnitID' THEN [SPMT_DCHeader].[UnitID] END,
     CASE @OrderBy WHEN 'UnitID DESC' THEN [SPMT_DCHeader].[UnitID] END DESC,
     CASE @OrderBy WHEN 'PONo' THEN [SPMT_DCHeader].[PONo] END,
     CASE @OrderBy WHEN 'PONo DESC' THEN [SPMT_DCHeader].[PONo] END DESC,
     CASE @OrderBy WHEN 'PlaceOfSupply' THEN [SPMT_DCHeader].[PlaceOfSupply] END,
     CASE @OrderBy WHEN 'PlaceOfSupply DESC' THEN [SPMT_DCHeader].[PlaceOfSupply] END DESC,
     CASE @OrderBy WHEN 'PlaceOfDelivery' THEN [SPMT_DCHeader].[PlaceOfDelivery] END,
     CASE @OrderBy WHEN 'PlaceOfDelivery DESC' THEN [SPMT_DCHeader].[PlaceOfDelivery] END DESC,
     CASE @OrderBy WHEN 'ConsignerIsgecID' THEN [SPMT_DCHeader].[ConsignerIsgecID] END,
     CASE @OrderBy WHEN 'ConsignerIsgecID DESC' THEN [SPMT_DCHeader].[ConsignerIsgecID] END DESC,
     CASE @OrderBy WHEN 'ConsigneeIsgecID' THEN [SPMT_DCHeader].[ConsigneeIsgecID] END,
     CASE @OrderBy WHEN 'ConsigneeIsgecID DESC' THEN [SPMT_DCHeader].[ConsigneeIsgecID] END DESC,
     CASE @OrderBy WHEN 'ConsignerBPID' THEN [SPMT_DCHeader].[ConsignerBPID] END,
     CASE @OrderBy WHEN 'ConsignerBPID DESC' THEN [SPMT_DCHeader].[ConsignerBPID] END DESC,
     CASE @OrderBy WHEN 'ConsigneeBPID' THEN [SPMT_DCHeader].[ConsigneeBPID] END,
     CASE @OrderBy WHEN 'ConsigneeBPID DESC' THEN [SPMT_DCHeader].[ConsigneeBPID] END DESC,
     CASE @OrderBy WHEN 'ConsignerGSTIN' THEN [SPMT_DCHeader].[ConsignerGSTIN] END,
     CASE @OrderBy WHEN 'ConsignerGSTIN DESC' THEN [SPMT_DCHeader].[ConsignerGSTIN] END DESC,
     CASE @OrderBy WHEN 'ConsigneeGSTIN' THEN [SPMT_DCHeader].[ConsigneeGSTIN] END,
     CASE @OrderBy WHEN 'ConsigneeGSTIN DESC' THEN [SPMT_DCHeader].[ConsigneeGSTIN] END DESC,
     CASE @OrderBy WHEN 'ConsignerName' THEN [SPMT_DCHeader].[ConsignerName] END,
     CASE @OrderBy WHEN 'ConsignerName DESC' THEN [SPMT_DCHeader].[ConsignerName] END DESC,
     CASE @OrderBy WHEN 'ConsigneeName' THEN [SPMT_DCHeader].[ConsigneeName] END,
     CASE @OrderBy WHEN 'ConsigneeName DESC' THEN [SPMT_DCHeader].[ConsigneeName] END DESC,
     CASE @OrderBy WHEN 'ConsignerGSTINNo' THEN [SPMT_DCHeader].[ConsignerGSTINNo] END,
     CASE @OrderBy WHEN 'ConsignerGSTINNo DESC' THEN [SPMT_DCHeader].[ConsignerGSTINNo] END DESC,
     CASE @OrderBy WHEN 'ConsigneeGSTINNo' THEN [SPMT_DCHeader].[ConsigneeGSTINNo] END,
     CASE @OrderBy WHEN 'ConsigneeGSTINNo DESC' THEN [SPMT_DCHeader].[ConsigneeGSTINNo] END DESC,
     CASE @OrderBy WHEN 'ConsignerAddress1Line' THEN [SPMT_DCHeader].[ConsignerAddress1Line] END,
     CASE @OrderBy WHEN 'ConsignerAddress1Line DESC' THEN [SPMT_DCHeader].[ConsignerAddress1Line] END DESC,
     CASE @OrderBy WHEN 'ConsigneeAddress1Line' THEN [SPMT_DCHeader].[ConsigneeAddress1Line] END,
     CASE @OrderBy WHEN 'ConsigneeAddress1Line DESC' THEN [SPMT_DCHeader].[ConsigneeAddress1Line] END DESC,
     CASE @OrderBy WHEN 'ConsignerAddress2Line' THEN [SPMT_DCHeader].[ConsignerAddress2Line] END,
     CASE @OrderBy WHEN 'ConsignerAddress2Line DESC' THEN [SPMT_DCHeader].[ConsignerAddress2Line] END DESC,
     CASE @OrderBy WHEN 'ConsigneeAddress2Line' THEN [SPMT_DCHeader].[ConsigneeAddress2Line] END,
     CASE @OrderBy WHEN 'ConsigneeAddress2Line DESC' THEN [SPMT_DCHeader].[ConsigneeAddress2Line] END DESC,
     CASE @OrderBy WHEN 'ConsignerAddress3Line' THEN [SPMT_DCHeader].[ConsignerAddress3Line] END,
     CASE @OrderBy WHEN 'ConsignerAddress3Line DESC' THEN [SPMT_DCHeader].[ConsignerAddress3Line] END DESC,
     CASE @OrderBy WHEN 'ConsigneeAddress3Line' THEN [SPMT_DCHeader].[ConsigneeAddress3Line] END,
     CASE @OrderBy WHEN 'ConsigneeAddress3Line DESC' THEN [SPMT_DCHeader].[ConsigneeAddress3Line] END DESC,
     CASE @OrderBy WHEN 'ConsignerStateID' THEN [SPMT_DCHeader].[ConsignerStateID] END,
     CASE @OrderBy WHEN 'ConsignerStateID DESC' THEN [SPMT_DCHeader].[ConsignerStateID] END DESC,
     CASE @OrderBy WHEN 'ConsigneeStateID' THEN [SPMT_DCHeader].[ConsigneeStateID] END,
     CASE @OrderBy WHEN 'ConsigneeStateID DESC' THEN [SPMT_DCHeader].[ConsigneeStateID] END DESC,
     CASE @OrderBy WHEN 'Purpose' THEN [SPMT_DCHeader].[Purpose] END,
     CASE @OrderBy WHEN 'Purpose DESC' THEN [SPMT_DCHeader].[Purpose] END DESC,
     CASE @OrderBy WHEN 'ExpectedReturnDate' THEN [SPMT_DCHeader].[ExpectedReturnDate] END,
     CASE @OrderBy WHEN 'ExpectedReturnDate DESC' THEN [SPMT_DCHeader].[ExpectedReturnDate] END DESC,
     CASE @OrderBy WHEN 'ModeOfTransportID' THEN [SPMT_DCHeader].[ModeOfTransportID] END,
     CASE @OrderBy WHEN 'ModeOfTransportID DESC' THEN [SPMT_DCHeader].[ModeOfTransportID] END DESC,
     CASE @OrderBy WHEN 'VehicleNo' THEN [SPMT_DCHeader].[VehicleNo] END,
     CASE @OrderBy WHEN 'VehicleNo DESC' THEN [SPMT_DCHeader].[VehicleNo] END DESC,
     CASE @OrderBy WHEN 'GRNo' THEN [SPMT_DCHeader].[GRNo] END,
     CASE @OrderBy WHEN 'GRNo DESC' THEN [SPMT_DCHeader].[GRNo] END DESC,
     CASE @OrderBy WHEN 'GRDate' THEN [SPMT_DCHeader].[GRDate] END,
     CASE @OrderBy WHEN 'GRDate DESC' THEN [SPMT_DCHeader].[GRDate] END DESC,
     CASE @OrderBy WHEN 'TransporterID' THEN [SPMT_DCHeader].[TransporterID] END,
     CASE @OrderBy WHEN 'TransporterID DESC' THEN [SPMT_DCHeader].[TransporterID] END DESC,
     CASE @OrderBy WHEN 'TransporterName' THEN [SPMT_DCHeader].[TransporterName] END,
     CASE @OrderBy WHEN 'TransporterName DESC' THEN [SPMT_DCHeader].[TransporterName] END DESC,
     CASE @OrderBy WHEN 'FromPlace' THEN [SPMT_DCHeader].[FromPlace] END,
     CASE @OrderBy WHEN 'FromPlace DESC' THEN [SPMT_DCHeader].[FromPlace] END DESC,
     CASE @OrderBy WHEN 'ToPlace' THEN [SPMT_DCHeader].[ToPlace] END,
     CASE @OrderBy WHEN 'ToPlace DESC' THEN [SPMT_DCHeader].[ToPlace] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [SPMT_DCHeader].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [SPMT_DCHeader].[StatusID] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [SPMT_DCHeader].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [SPMT_DCHeader].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'TotalAmount' THEN [SPMT_DCHeader].[TotalAmount] END,
     CASE @OrderBy WHEN 'TotalAmount DESC' THEN [SPMT_DCHeader].[TotalAmount] END DESC,
     CASE @OrderBy WHEN 'Declaration1Line' THEN [SPMT_DCHeader].[Declaration1Line] END,
     CASE @OrderBy WHEN 'Declaration1Line DESC' THEN [SPMT_DCHeader].[Declaration1Line] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [SPMT_DCHeader].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [SPMT_DCHeader].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'TotalAmountInWords' THEN [SPMT_DCHeader].[TotalAmountInWords] END,
     CASE @OrderBy WHEN 'TotalAmountInWords DESC' THEN [SPMT_DCHeader].[TotalAmountInWords] END DESC,
     CASE @OrderBy WHEN 'Declaration2Line' THEN [SPMT_DCHeader].[Declaration2Line] END,
     CASE @OrderBy WHEN 'Declaration2Line DESC' THEN [SPMT_DCHeader].[Declaration2Line] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Companies2_Description' THEN [HRM_Companies2].[Description] END,
     CASE @OrderBy WHEN 'HRM_Companies2_Description DESC' THEN [HRM_Companies2].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects3_Description' THEN [IDM_Projects3].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects3_Description DESC' THEN [IDM_Projects3].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_DCStates4_Description' THEN [SPMT_DCStates4].[Description] END,
     CASE @OrderBy WHEN 'SPMT_DCStates4_Description DESC' THEN [SPMT_DCStates4].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPStates5_Description' THEN [SPMT_ERPStates5].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPStates5_Description DESC' THEN [SPMT_ERPStates5].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPStates6_Description' THEN [SPMT_ERPStates6].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPStates6_Description DESC' THEN [SPMT_ERPStates6].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPStates7_Description' THEN [SPMT_ERPStates7].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPStates7_Description DESC' THEN [SPMT_ERPStates7].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPStates8_Description' THEN [SPMT_ERPStates8].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPStates8_Description DESC' THEN [SPMT_ERPStates8].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN9_Description' THEN [SPMT_IsgecGSTIN9].[Description] END,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN9_Description DESC' THEN [SPMT_IsgecGSTIN9].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN10_Description' THEN [SPMT_IsgecGSTIN10].[Description] END,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN10_Description DESC' THEN [SPMT_IsgecGSTIN10].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN11_Description' THEN [SPMT_IsgecGSTIN11].[Description] END,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN11_Description DESC' THEN [SPMT_IsgecGSTIN11].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_ModeOfTransport12_Description' THEN [SPMT_ModeOfTransport12].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ModeOfTransport12_Description DESC' THEN [SPMT_ModeOfTransport12].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BPGSTIN13_Description' THEN [VR_BPGSTIN13].[Description] END,
     CASE @OrderBy WHEN 'VR_BPGSTIN13_Description DESC' THEN [VR_BPGSTIN13].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BPGSTIN14_Description' THEN [VR_BPGSTIN14].[Description] END,
     CASE @OrderBy WHEN 'VR_BPGSTIN14_Description DESC' THEN [VR_BPGSTIN14].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner15_BPName' THEN [VR_BusinessPartner15].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner15_BPName DESC' THEN [VR_BusinessPartner15].[BPName] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner16_BPName' THEN [VR_BusinessPartner16].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner16_BPName DESC' THEN [VR_BusinessPartner16].[BPName] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner17_BPName' THEN [VR_BusinessPartner17].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner17_BPName DESC' THEN [VR_BusinessPartner17].[BPName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users18_UserFullName' THEN [aspnet_Users18].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users18_UserFullName DESC' THEN [aspnet_Users18].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users19_UserFullName' THEN [aspnet_Users19].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users19_UserFullName DESC' THEN [aspnet_Users19].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'SPMT_DCHeader20_Purpose' THEN [SPMT_DCHeader20].[Purpose] END,
     CASE @OrderBy WHEN 'SPMT_DCHeader20_Purpose DESC' THEN [SPMT_DCHeader20].[Purpose] END DESC,
     CASE @OrderBy WHEN 'SPMT_ERPStates21_Description' THEN [SPMT_ERPStates21].[Description] END,
     CASE @OrderBy WHEN 'SPMT_ERPStates21_Description DESC' THEN [SPMT_ERPStates21].[Description] END DESC,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN22_Description' THEN [SPMT_IsgecGSTIN22].[Description] END,
     CASE @OrderBy WHEN 'SPMT_IsgecGSTIN22_Description DESC' THEN [SPMT_IsgecGSTIN22].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BPGSTIN23_Description' THEN [VR_BPGSTIN23].[Description] END,
     CASE @OrderBy WHEN 'VR_BPGSTIN23_Description DESC' THEN [VR_BPGSTIN23].[Description] END DESC,
     CASE @OrderBy WHEN 'VR_BusinessPartner24_BPName' THEN [VR_BusinessPartner24].[BPName] END,
     CASE @OrderBy WHEN 'VR_BusinessPartner24_BPName DESC' THEN [VR_BusinessPartner24].[BPName] END DESC 

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
GO

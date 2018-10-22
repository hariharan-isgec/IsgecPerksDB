USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakPkgListHInsert]
  @SerialNo Int,
  @ReceivedAtPortOn DateTime,
  @ReceivedAtPortBy NVarChar(8),
  @PortID Int,
  @ProjectID NVarChar(6),
  @SupplierRefNo NVarChar(50),
  @TransporterID NVarChar(9),
  @TransporterName NVarChar(50),
  @VehicleNo NVarChar(50),
  @GRNo NVarChar(50),
  @GRDate DateTime,
  @VRExecutionNo Int,
  @Remarks NVarChar(500),
  @Additional2Info NVarChar(50),
  @TotalWeight Decimal(18,2),
  @StatusID Int,
  @Additional1Info NVarChar(50),
  @CreatedOn DateTime,
  @CreatedBy NVarChar(8),
  @UOMTotalWeight Int,
  @VRRaised Bit,
  @VRRaisedOn DateTime,
  @VRConverted Bit,
  @VRConvertedOn DateTime,
  @VRConvertedBy NVarChar(8),
  @VRRequestNo Int,
  @VRExecuted Bit,
  @Return_SerialNo Int = null OUTPUT, 
  @Return_PkgNo Int = null OUTPUT 
  AS
  INSERT [PAK_PkgListH]
  (
   [SerialNo]
  ,[ReceivedAtPortOn]
  ,[ReceivedAtPortBy]
  ,[PortID]
  ,[ProjectID]
  ,[SupplierRefNo]
  ,[TransporterID]
  ,[TransporterName]
  ,[VehicleNo]
  ,[GRNo]
  ,[GRDate]
  ,[VRExecutionNo]
  ,[Remarks]
  ,[Additional2Info]
  ,[TotalWeight]
  ,[StatusID]
  ,[Additional1Info]
  ,[CreatedOn]
  ,[CreatedBy]
  ,[UOMTotalWeight]
  ,[VRRaised]
  ,[VRRaisedOn]
  ,[VRConverted]
  ,[VRConvertedOn]
  ,[VRConvertedBy]
  ,[VRRequestNo]
  ,[VRExecuted]
  )
  VALUES
  (
   @SerialNo
  ,@ReceivedAtPortOn
  ,@ReceivedAtPortBy
  ,@PortID
  ,@ProjectID
  ,@SupplierRefNo
  ,@TransporterID
  ,@TransporterName
  ,@VehicleNo
  ,@GRNo
  ,@GRDate
  ,@VRExecutionNo
  ,@Remarks
  ,@Additional2Info
  ,@TotalWeight
  ,@StatusID
  ,@Additional1Info
  ,@CreatedOn
  ,@CreatedBy
  ,@UOMTotalWeight
  ,@VRRaised
  ,@VRRaisedOn
  ,@VRConverted
  ,@VRConvertedOn
  ,@VRConvertedBy
  ,@VRRequestNo
  ,@VRExecuted
  )
  SET @Return_SerialNo = @SerialNo
  SET @Return_PkgNo = Scope_Identity()
GO

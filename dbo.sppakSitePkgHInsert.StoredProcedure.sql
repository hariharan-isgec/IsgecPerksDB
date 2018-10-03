USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSitePkgHInsert]
  @ProjectID NVarChar(6),
  @SerialNo Int,
  @PkgNo Int,
  @MRNNo Int,
  @SupplierID NVarChar(9),
  @SupplierName NVarChar(50),
  @SupplierRefNo NVarChar(50),
  @TransporterID NVarChar(9),
  @TransporterName NVarChar(50),
  @VehicleNo NVarChar(50),
  @GRNo NVarChar(50),
  @GRDate DateTime,
  @UOMTotalWeight Int,
  @TotalWeight Decimal(18,2),
  @ODC Bit,
  @MaterialStatusID Int,
  @Remarks NVarChar(500),
  @CreatedOn DateTime,
  @CreatedBy NVarChar(8),
  @ReceiveStatusID Int,
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_RecNo Int = null OUTPUT 
  AS
  INSERT [PAK_SitePkgH]
  (
   [ProjectID]
  ,[SerialNo]
  ,[PkgNo]
  ,[MRNNo]
  ,[SupplierID]
  ,[SupplierName]
  ,[SupplierRefNo]
  ,[TransporterID]
  ,[TransporterName]
  ,[VehicleNo]
  ,[GRNo]
  ,[GRDate]
  ,[UOMTotalWeight]
  ,[TotalWeight]
  ,[ODC]
  ,[MaterialStatusID]
  ,[Remarks]
  ,[CreatedOn]
  ,[CreatedBy]
  ,[ReceiveStatusID]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,@SerialNo
  ,@PkgNo
  ,@MRNNo
  ,@SupplierID
  ,@SupplierName
  ,@SupplierRefNo
  ,@TransporterID
  ,@TransporterName
  ,@VehicleNo
  ,@GRNo
  ,@GRDate
  ,@UOMTotalWeight
  ,@TotalWeight
  ,@ODC
  ,@MaterialStatusID
  ,@Remarks
  ,@CreatedOn
  ,@CreatedBy
  ,@ReceiveStatusID
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_RecNo = Scope_Identity()
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakQCListHInsert]
  @SerialNo Int,
  @SupplierRef NVarChar(50),
  @ClearedOn DateTime,
  @ClearedBy NVarChar(8),
  @PkgNo Int,
  @Remarks NVarChar(500),
  @StatusID Int,
  @UOMTotalWeight Int,
  @TotalWeight Decimal(18,4),
  @QualityClearedWt Decimal(18,4),
  @QCRequestNo int,
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @Return_SerialNo Int = null OUTPUT, 
  @Return_QCLNo Int = null OUTPUT 
  AS
  INSERT [PAK_QCListH]
  (
   [SerialNo]
  ,[SupplierRef]
  ,[ClearedOn]
  ,[ClearedBy]
  ,[PkgNo]
  ,[Remarks]
  ,[StatusID]
  ,[UOMTotalWeight]
  ,[TotalWeight]
  ,[CreatedBy]
  ,[CreatedOn]
  ,[QualityClearedWt]
  ,[QCRequestNo]
  )
  VALUES
  (
   @SerialNo
  ,@SupplierRef
  ,@ClearedOn
  ,@ClearedBy
  ,@PkgNo
  ,@Remarks
  ,@StatusID
  ,@UOMTotalWeight
  ,@TotalWeight
  ,@CreatedBy
  ,@CreatedOn
  ,@QualityClearedWt
  ,@QCRequestNo
  )
  SET @Return_SerialNo = @SerialNo
  SET @Return_QCLNo = Scope_Identity()
GO

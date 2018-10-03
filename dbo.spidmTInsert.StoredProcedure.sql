USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTInsert]
  @TmtlTypeID NVarChar(2),
  @ProjectID NVarChar(6),
  @CustomerID NVarChar(6),
  @VendorID NVarChar(6),
  @CardNo NVarChar(8),
  @UseSpecificContact Bit,
  @SerialNo Int,
  @ProjectSerialNo Int,
  @CustomerSerialNo Int,
  @VendorSerialNo Int,
  @TmtlReference NVarChar(30),
  @Subject NVarChar(500),
  @Remarks NVarChar(1000),
  @ToEMailID NVarChar(1000),
  @CCEmailID NVarChar(1000),
  @TmtlStatusID Int,
  @CreatedOn DateTime,
  @CreatedBy NVarChar(8),
  @ModifiedOn DateTime,
  @ModifiedBy NVarChar(8),
  @ResponsibleAgencyID Int,
  @ApprovedOn DateTime,
  @ApprovedBy NVarChar(8),
  @IssuedViaID Int,
  @IssueRemarks NVarChar(1000),
  @IssuedOn DateTime,
  @IssuedBy NVarChar(8),
  @Return_TmtlID Int = null OUTPUT
  AS
  INSERT [IDM_Transmittal]
  (
   [TmtlTypeID]
  ,[ProjectID]
  ,[CustomerID]
  ,[VendorID]
  ,[CardNo]
  ,[UseSpecificContact]
  ,[SerialNo]
  ,[ProjectSerialNo]
  ,[CustomerSerialNo]
  ,[VendorSerialNo]
  ,[TmtlReference]
  ,[Subject]
  ,[Remarks]
  ,[ToEMailID]
  ,[CCEmailID]
  ,[TmtlStatusID]
  ,[CreatedOn]
  ,[CreatedBy]
  ,[ModifiedOn]
  ,[ModifiedBy]
  ,[ResponsibleAgencyID]
  ,[ApprovedOn]
  ,[ApprovedBy]
  ,[IssuedViaID]
  ,[IssueRemarks]
  ,[IssuedOn]
  ,[IssuedBy]
  )
  VALUES
  (
   @TmtlTypeID
  ,@ProjectID
  ,@CustomerID
  ,@VendorID
  ,@CardNo
  ,@UseSpecificContact
  ,@SerialNo
  ,@ProjectSerialNo
  ,@CustomerSerialNo
  ,@VendorSerialNo
  ,@TmtlReference
  ,@Subject
  ,@Remarks
  ,@ToEMailID
  ,@CCEmailID
  ,@TmtlStatusID
  ,@CreatedOn
  ,@CreatedBy
  ,@ModifiedOn
  ,@ModifiedBy
  ,@ResponsibleAgencyID
  ,@ApprovedOn
  ,@ApprovedBy
  ,@IssuedViaID
  ,@IssueRemarks
  ,@IssuedOn
  ,@IssuedBy
  )
  SET @Return_TmtlID = Scope_Identity()
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTUpdate]
  @Original_TmtlID Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [IDM_Transmittal] SET 
   [TmtlTypeID] = @TmtlTypeID
  ,[ProjectID] = @ProjectID
  ,[CustomerID] = @CustomerID
  ,[VendorID] = @VendorID
  ,[CardNo] = @CardNo
  ,[UseSpecificContact] = @UseSpecificContact
  ,[SerialNo] = @SerialNo
  ,[ProjectSerialNo] = @ProjectSerialNo
  ,[CustomerSerialNo] = @CustomerSerialNo
  ,[VendorSerialNo] = @VendorSerialNo
  ,[TmtlReference] = @TmtlReference
  ,[Subject] = @Subject
  ,[Remarks] = @Remarks
  ,[ToEMailID] = @ToEMailID
  ,[CCEmailID] = @CCEmailID
  ,[TmtlStatusID] = @TmtlStatusID
  ,[CreatedOn] = @CreatedOn
  ,[CreatedBy] = @CreatedBy
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedBy] = @ModifiedBy
  ,[ResponsibleAgencyID] = @ResponsibleAgencyID
  ,[ApprovedOn] = @ApprovedOn
  ,[ApprovedBy] = @ApprovedBy
  ,[IssuedViaID] = @IssuedViaID
  ,[IssueRemarks] = @IssueRemarks
  ,[IssuedOn] = @IssuedOn
  ,[IssuedBy] = @IssuedBy
  WHERE
  [TmtlID] = @Original_TmtlID
  SET @RowCount = @@RowCount
GO

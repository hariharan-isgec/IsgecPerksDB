USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteIssRecDInsert]
  @SiteMarkNo NVarChar(30),
  @UOMQuantity Int,
  @QuantityRequired Decimal(18,2),
  @QuantityIssued Decimal(18,2),
  @IssuerRemarks NVarChar(100),
  @IssueNo Int,
  @Remarks NVarChar(100),
  @ProjectID NVarChar(6),
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_IssueNo Int = null OUTPUT, 
  @Return_IssueSrNo Int = null OUTPUT 
  AS
  INSERT [PAK_SiteIssueD]
  (
   [SiteMarkNo]
  ,[UOMQuantity]
  ,[QuantityRequired]
  ,[QuantityIssued]
  ,[IssuerRemarks]
  ,[IssueNo]
  ,[Remarks]
  ,[ProjectID]
  )
  VALUES
  (
   @SiteMarkNo
  ,@UOMQuantity
  ,@QuantityRequired
  ,@QuantityIssued
  ,@IssuerRemarks
  ,@IssueNo
  ,@Remarks
  ,UPPER(@ProjectID)
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_IssueNo = @IssueNo
  SET @Return_IssueSrNo = Scope_Identity()
GO

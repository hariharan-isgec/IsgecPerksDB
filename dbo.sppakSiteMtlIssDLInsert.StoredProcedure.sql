USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteMtlIssDLInsert]
  @SiteMarkNo NVarChar(30),
  @LocationID Int,
  @UOMQuantity Int,
  @QuantityAvailable Decimal(18,2),
  @QuantityIssued Decimal(18,2),
  @IssueNo Int,
  @ProjectID NVarChar(6),
  @Support Bit,
  @IssueSrNo Int,
  @Remarks NVarChar(100),
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_IssueNo Int = null OUTPUT, 
  @Return_IssueSrNo Int = null OUTPUT, 
  @Return_IssueSrLNo Int = null OUTPUT 
  AS
  INSERT [PAK_SiteIssueDLocation]
  (
   [SiteMarkNo]
  ,[LocationID]
  ,[UOMQuantity]
  ,[QuantityAvailable]
  ,[QuantityIssued]
  ,[IssueNo]
  ,[ProjectID]
  ,[Support]
  ,[IssueSrNo]
  ,[Remarks]
  )
  VALUES
  (
   @SiteMarkNo
  ,@LocationID
  ,@UOMQuantity
  ,@QuantityAvailable
  ,@QuantityIssued
  ,@IssueNo
  ,UPPER(@ProjectID)
  ,@Support
  ,@IssueSrNo
  ,@Remarks
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_IssueNo = @IssueNo
  SET @Return_IssueSrNo = @IssueSrNo
  SET @Return_IssueSrLNo = Scope_Identity()
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteIssRecDUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_IssueNo Int, 
  @Original_IssueSrNo Int, 
  @SiteMarkNo NVarChar(30),
  @UOMQuantity Int,
  @QuantityRequired Decimal(18,2),
  @QuantityIssued Decimal(18,2),
  @IssuerRemarks NVarChar(100),
  @IssueNo Int,
  @Remarks NVarChar(100),
  @ProjectID NVarChar(6),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_SiteIssueD] SET 
   [SiteMarkNo] = @SiteMarkNo
  ,[UOMQuantity] = @UOMQuantity
  ,[QuantityRequired] = @QuantityRequired
  ,[QuantityIssued] = @QuantityIssued
  ,[IssuerRemarks] = @IssuerRemarks
  ,[IssueNo] = @IssueNo
  ,[Remarks] = @Remarks
  ,[ProjectID] = @ProjectID
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [IssueNo] = @Original_IssueNo
  AND [IssueSrNo] = @Original_IssueSrNo
  SET @RowCount = @@RowCount
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteMtlIssDLUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_IssueNo Int, 
  @Original_IssueSrNo Int, 
  @Original_IssueSrLNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_SiteIssueDLocation] SET 
   [SiteMarkNo] = @SiteMarkNo
  ,[LocationID] = @LocationID
  ,[UOMQuantity] = @UOMQuantity
  ,[QuantityAvailable] = @QuantityAvailable
  ,[QuantityIssued] = @QuantityIssued
  ,[IssueNo] = @IssueNo
  ,[ProjectID] = @ProjectID
  ,[Support] = @Support
  ,[IssueSrNo] = @IssueSrNo
  ,[Remarks] = @Remarks
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [IssueNo] = @Original_IssueNo
  AND [IssueSrNo] = @Original_IssueSrNo
  AND [IssueSrLNo] = @Original_IssueSrLNo
  SET @RowCount = @@RowCount
GO

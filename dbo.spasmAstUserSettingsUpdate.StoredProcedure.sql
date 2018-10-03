USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstUserSettingsUpdate]
  @Original_MrnID Int, 
  @Original_AssetID Int, 
  @Modified Bit,
  @ModifiedOn DateTime,
  @ModifiedBy NVarChar(8),
  @OtherSpecifications NVarChar(50),
  @ModificationRemarks NVarChar(50),
  @IPAddress NVarChar(50),
  @HostName NVarChar(50),
  @INDomain Bit,
  @DomainName NVarChar(50),
  @MapDrive Bit,
  @PenDriveDisable Bit,
  @CDROMDisable Bit,
  @InternetAccess Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_AstDetails] SET 
   [Modified] = @Modified
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedBy] = @ModifiedBy
  ,[OtherSpecifications] = @OtherSpecifications
  ,[ModificationRemarks] = @ModificationRemarks
  ,[IPAddress] = @IPAddress
  ,[HostName] = @HostName
  ,[INDomain] = @INDomain
  ,[DomainName] = @DomainName
  ,[MapDrive] = @MapDrive
  ,[PenDriveDisable] = @PenDriveDisable
  ,[CDROMDisable] = @CDROMDisable
  ,[InternetAccess] = @InternetAccess
  WHERE
  [MrnID] = @Original_MrnID
  AND [AssetID] = @Original_AssetID
  SET @RowCount = @@RowCount
GO

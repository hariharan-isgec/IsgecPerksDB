USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPProjectsUpdate]
  @Original_ProjectID NVarChar(6), 
  @ProjectID NVarChar(6),
  @Description NVarChar(50),
  @RootTaskID Int,
  @Active Bit,
  @engEnabled Bit,
  @engTitle NVarChar(50),
  @ordEnabled Bit,
  @ordTitle NVarChar(50),
  @desEnabled Bit,
  @desTitle NVarChar(50),
  @ereEnabled Bit,
  @ereTitle NVarChar(50),
  @ioEnabled Bit,
  @ioTitle NVarChar(50),
  @recEnabled Bit,
  @recTitle NVarChar(50),
  @ad1Enabled Bit,
  @ad1Title NVarChar(50),
  @ad2Enabled Bit,
  @ad2Title NVarChar(50),
  @ad3Enabled Bit,
  @ad3Title NVarChar(50),
  @ad4Enabled Bit,
  @ad4Title NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TOS_Projects] SET 
   [ProjectID] = @ProjectID
  ,[Description] = @Description
  ,[RootTaskID] = @RootTaskID
  ,[Active] = @Active
  ,[engEnabled] = @engEnabled
  ,[engTitle] = @engTitle
  ,[ordEnabled] = @ordEnabled
  ,[ordTitle] = @ordTitle
  ,[desEnabled] = @desEnabled
  ,[desTitle] = @desTitle
  ,[ereEnabled] = @ereEnabled
  ,[ereTitle] = @ereTitle
  ,[ioEnabled] = @ioEnabled
  ,[ioTitle] = @ioTitle
  ,[recEnabled] = @recEnabled
  ,[recTitle] = @recTitle
  ,[ad1Enabled] = @ad1Enabled
  ,[ad1Title] = @ad1Title
  ,[ad2Enabled] = @ad2Enabled
  ,[ad2Title] = @ad2Title
  ,[ad3Enabled] = @ad3Enabled
  ,[ad3Title] = @ad3Title
  ,[ad4Enabled] = @ad4Enabled
  ,[ad4Title] = @ad4Title
  WHERE
  [ProjectID] = @Original_ProjectID
  SET @RowCount = @@RowCount
GO

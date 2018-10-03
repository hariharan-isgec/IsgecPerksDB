USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOTPProjectsInsert]
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
  @Return_ProjectID NVarChar(6) = null OUTPUT 
  AS
  INSERT [TOS_Projects]
  (
   [ProjectID]
  ,[Description]
  ,[RootTaskID]
  ,[Active]
  ,[engEnabled]
  ,[engTitle]
  ,[ordEnabled]
  ,[ordTitle]
  ,[desEnabled]
  ,[desTitle]
  ,[ereEnabled]
  ,[ereTitle]
  ,[ioEnabled]
  ,[ioTitle]
  ,[recEnabled]
  ,[recTitle]
  ,[ad1Enabled]
  ,[ad1Title]
  ,[ad2Enabled]
  ,[ad2Title]
  ,[ad3Enabled]
  ,[ad3Title]
  ,[ad4Enabled]
  ,[ad4Title]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,@Description
  ,@RootTaskID
  ,@Active
  ,@engEnabled
  ,@engTitle
  ,@ordEnabled
  ,@ordTitle
  ,@desEnabled
  ,@desTitle
  ,@ereEnabled
  ,@ereTitle
  ,@ioEnabled
  ,@ioTitle
  ,@recEnabled
  ,@recTitle
  ,@ad1Enabled
  ,@ad1Title
  ,@ad2Enabled
  ,@ad2Title
  ,@ad3Enabled
  ,@ad3Title
  ,@ad4Enabled
  ,@ad4Title
  )
  SET @Return_ProjectID = @ProjectID
GO

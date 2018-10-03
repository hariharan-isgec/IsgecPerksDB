USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spolcRequestsInsert]
  @CardNo NVarChar(8),
  @Remarks NVarChar(500),
  @RequestedBy NVarChar(8),
  @RequestedOn DateTime,
  @Configured Bit,
  @OLCPassword NVarChar(50),
  @NetworkIP NVarChar(15),
  @ConfiguredBy NVarChar(8),
  @ConfiguredOn DateTime,
  @ConfigurationRemarks NVarChar(500),
  @RemoveAccess Bit,
  @RemoveRequestedBy NVarChar(8),
  @RemoveRequestedOn DateTime,
  @RemoveRemarks NVarChar(500),
  @Removed Bit,
  @RemovedBy NVarChar(8),
  @RemovedOn DateTime,
  @RemovedRemarks NVarChar(500),
  @Return_RequestID Int = null OUTPUT 
  AS
  INSERT [OLC_Requests]
  (
   [CardNo]
  ,[Remarks]
  ,[RequestedBy]
  ,[RequestedOn]
  ,[Configured]
  ,[OLCPassword]
  ,[NetworkIP]
  ,[ConfiguredBy]
  ,[ConfiguredOn]
  ,[ConfigurationRemarks]
  ,[RemoveAccess]
  ,[RemoveRequestedBy]
  ,[RemoveRequestedOn]
  ,[RemoveRemarks]
  ,[Removed]
  ,[RemovedBy]
  ,[RemovedOn]
  ,[RemovedRemarks]
  )
  VALUES
  (
   @CardNo
  ,@Remarks
  ,@RequestedBy
  ,@RequestedOn
  ,@Configured
  ,@OLCPassword
  ,@NetworkIP
  ,@ConfiguredBy
  ,@ConfiguredOn
  ,@ConfigurationRemarks
  ,@RemoveAccess
  ,@RemoveRequestedBy
  ,@RemoveRequestedOn
  ,@RemoveRemarks
  ,@Removed
  ,@RemovedBy
  ,@RemovedOn
  ,@RemovedRemarks
  )
  SET @Return_RequestID = Scope_Identity()
GO

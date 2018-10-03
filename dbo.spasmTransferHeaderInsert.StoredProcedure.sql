USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmTransferHeaderInsert]
  @TransferTo Int,
  @TransferFrom Int,
  @Returnable Bit,
  @ExpectedDate DateTime,
  @TransferRemarks NVarChar(100),
  @T_TakenBy NVarChar(30),
  @TransferStatusID NVarChar(30),
  @T_CreatedBy NVarChar(8),
  @T_CreatedOn DateTime,
  @Return_TransferID Int = null OUTPUT
  AS
  INSERT [ASM_TransferHeader]
  (
   [TransferTo]
  ,[TransferFrom]
  ,[Returnable]
  ,[ExpectedDate]
  ,[TransferRemarks]
  ,[T_TakenBy]
  ,[TransferStatusID]
  ,[T_CreatedBy]
  ,[T_CreatedOn]
  )
  VALUES
  (
   @TransferTo
  ,@TransferFrom
  ,@Returnable
  ,@ExpectedDate
  ,@TransferRemarks
  ,@T_TakenBy
  ,@TransferStatusID
  ,@T_CreatedBy
  ,@T_CreatedOn
  )
  SET @Return_TransferID = Scope_Identity()
GO

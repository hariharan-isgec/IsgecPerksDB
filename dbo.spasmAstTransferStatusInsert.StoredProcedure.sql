USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstTransferStatusInsert]
  @TransferStatusID NVarChar(30),
  @Description NVarChar(30),
  @Return_TransferStatusID NVarChar(30) = null OUTPUT
  AS
  INSERT [ASM_AstTransferStatus]
  (
   [TransferStatusID]
  ,[Description]
  )
  VALUES
  (
   @TransferStatusID
  ,@Description
  )
  SET @Return_TransferStatusID = @TransferStatusID
GO

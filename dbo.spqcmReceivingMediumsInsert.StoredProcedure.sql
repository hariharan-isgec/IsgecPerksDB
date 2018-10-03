USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmReceivingMediumsInsert]
  @Description NVarChar(50),
  @Return_ReceivingMediumID Int = null OUTPUT 
  AS
  INSERT [QCM_ReceivingMediums]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_ReceivingMediumID = Scope_Identity()
GO

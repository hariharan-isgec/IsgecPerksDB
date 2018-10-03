USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapPurposeInsert]
  @PurposeName NVarChar(50),
  @Return_PurposeID Int = null OUTPUT 
  AS
  INSERT [QAP_Purpose]
  (
   [PurposeName]
  )
  VALUES
  (
   @PurposeName
  )
  SET @Return_PurposeID = Scope_Identity()
GO

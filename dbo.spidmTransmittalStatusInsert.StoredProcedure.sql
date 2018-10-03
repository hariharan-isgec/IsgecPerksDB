USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTransmittalStatusInsert]
  @Description NVarChar(30),
  @Return_TmtlStatusID Int = null OUTPUT
  AS
  INSERT [IDM_TransmittalStatus]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_TmtlStatusID = Scope_Identity()
GO

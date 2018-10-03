USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppsfStatusInsert]
  @Description NVarChar(50),
  @Return_PSFStatus Int = null OUTPUT 
  AS
  INSERT [PSF_Status]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_PSFStatus = Scope_Identity()
GO

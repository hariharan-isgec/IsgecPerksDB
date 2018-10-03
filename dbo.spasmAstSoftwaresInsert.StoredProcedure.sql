USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstSoftwaresInsert]
  @SoftwareID NVarChar(15),
  @Description NVarChar(50),
  @Return_SoftwareID NVarChar(15) = null OUTPUT
  AS
  INSERT [ASM_AstSoftwares]
  (
   [SoftwareID]
  ,[Description]
  )
  VALUES
  (
   @SoftwareID
  ,@Description
  )
  SET @Return_SoftwareID = @SoftwareID
GO

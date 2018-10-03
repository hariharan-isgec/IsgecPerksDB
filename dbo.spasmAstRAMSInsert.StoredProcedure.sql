USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstRAMSInsert]
  @RAMID NVarChar(10),
  @Description NVarChar(50),
  @Return_RAMID NVarChar(10) = null OUTPUT
  AS
  INSERT [ASM_AstRAMS]
  (
   [RAMID]
  ,[Description]
  )
  VALUES
  (
   @RAMID
  ,@Description
  )
  SET @Return_RAMID = @RAMID
GO

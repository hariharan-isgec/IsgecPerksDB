USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostERPGLCodesInsert]
  @GLCode NVarChar(7),
  @GLDescription NVarChar(50),
  @Return_GLCode NVarChar(7) = null OUTPUT 
  AS
  INSERT [COST_ERPGLCodes]
  (
   [GLCode]
  ,[GLDescription]
  )
  VALUES
  (
   UPPER(@GLCode)
  ,@GLDescription
  )
  SET @Return_GLCode = @GLCode
GO

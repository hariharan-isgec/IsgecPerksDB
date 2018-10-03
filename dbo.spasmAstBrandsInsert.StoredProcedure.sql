USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstBrandsInsert]
  @BrandID NVarChar(15),
  @Description NVarChar(50),
  @Return_BrandID NVarChar(15) = null OUTPUT
  AS
  INSERT [ASM_AstBrands]
  (
   [BrandID]
  ,[Description]
  )
  VALUES
  (
   @BrandID
  ,@Description
  )
  SET @Return_BrandID = @BrandID
GO

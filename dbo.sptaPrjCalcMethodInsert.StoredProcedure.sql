USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaPrjCalcMethodInsert]
  @Description NVarChar(50),
  @Return_ProjectCalcID Int = null OUTPUT 
  AS
  INSERT [TA_PrjCalcMethod]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_ProjectCalcID = Scope_Identity()
GO

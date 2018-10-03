USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostGLNaturesInsert]
  @GLNatureDescription NVarChar(50),
  @Return_GLNatureID Int = null OUTPUT 
  AS
  INSERT [COST_GLNatures]
  (
   [GLNatureDescription]
  )
  VALUES
  (
   @GLNatureDescription
  )
  SET @Return_GLNatureID = Scope_Identity()
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakResponsibleAgencyInsert]
  @Description NVarChar(50),
  @Return_ResponsibleAgencyID Int = null OUTPUT 
  AS
  INSERT [IDM_ResponsibleAgency]
  (
   [Description]
  )
  VALUES
  (
   @Description
  )
  SET @Return_ResponsibleAgencyID = Scope_Identity()
GO

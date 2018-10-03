USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakResponsibleAgenciesInsert]
  @Description NVarChar(50),
  @ExternalAgency Bit,
  @Return_ResponsibleAgencyID Int = null OUTPUT 
  AS
  INSERT [PAK_ResponsibleAgencies]
  (
   [Description]
  ,[ExternalAgency]
  )
  VALUES
  (
   @Description
  ,@ExternalAgency
  )
  SET @Return_ResponsibleAgencyID = Scope_Identity()
GO

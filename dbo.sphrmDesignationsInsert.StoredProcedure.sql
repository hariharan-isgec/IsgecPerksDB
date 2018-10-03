USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmDesignationsInsert]
  @Description NVarChar(30),
  @ShortName NVarChar(30),
  @Sequence Int,
  @Return_DesignationID Int = null OUTPUT
  AS
  INSERT [HRM_Designations]
  (
   [Description]
  ,[ShortName]
  ,[Sequence]
  )
  VALUES
  (
   @Description
  ,@ShortName
  ,@Sequence
  )
  SET @Return_DesignationID = Scope_Identity()
GO

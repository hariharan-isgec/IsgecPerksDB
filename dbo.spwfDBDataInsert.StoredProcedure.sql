USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBDataInsert]
  @Description NVarChar(50),
  @IsProcedure Bit,
  @FromERP Bit,
  @IsList Bit,
  @IsErpAFSCall Bit,
  @AFSDllName NVarChar(150),
  @AFSFunctionName NVarChar(150),
  @AFSParameters NVarChar(250),
  @DataSQL NVarChar(4000),
  @Return_DBDataID Int = null OUTPUT 
  AS
  INSERT [WF_DBData]
  (
   [Description]
  ,[IsProcedure]
  ,[FromERP]
  ,[IsList]
  ,[IsErpAFSCall]
  ,[AFSDllName]
  ,[AFSFunctionName]
  ,[AFSParameters]
  ,[DataSQL]
  )
  VALUES
  (
   @Description
  ,@IsProcedure
  ,@FromERP
  ,@IsList
  ,@IsErpAFSCall
  ,@AFSDllName
  ,@AFSFunctionName
  ,@AFSParameters
  ,@DataSQL
  )
  SET @Return_DBDataID = Scope_Identity()
GO

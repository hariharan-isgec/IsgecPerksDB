USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeysInsert]
  @Description NVarChar(50),
  @AnsTag1 NVarChar(50),
  @AnsTag2 NVarChar(50),
  @AnsTag3 NVarChar(50),
  @AnsTag4 NVarChar(50),
  @AnsTag5 NVarChar(50),
  @AnsTag6 NVarChar(50),
  @AnsTag7 NVarChar(50),
  @AnsTag8 NVarChar(50),
  @AnsTag9 NVarChar(50),
  @AnsTag10 NVarChar(50),
  @Return_ServeyID Int = null OUTPUT
  AS
  INSERT [HRM_Serveys]
  (
   [Description]
  ,[AnsTag1]
  ,[AnsTag2]
  ,[AnsTag3]
  ,[AnsTag4]
  ,[AnsTag5]
  ,[AnsTag6]
  ,[AnsTag7]
  ,[AnsTag8]
  ,[AnsTag9]
  ,[AnsTag10]
  )
  VALUES
  (
   @Description
  ,@AnsTag1
  ,@AnsTag2
  ,@AnsTag3
  ,@AnsTag4
  ,@AnsTag5
  ,@AnsTag6
  ,@AnsTag7
  ,@AnsTag8
  ,@AnsTag9
  ,@AnsTag10
  )
  SET @Return_ServeyID = Scope_Identity()
GO

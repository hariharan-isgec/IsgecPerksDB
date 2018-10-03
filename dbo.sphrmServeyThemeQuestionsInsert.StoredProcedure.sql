USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyThemeQuestionsInsert]
  @ThemeID Int,
  @QuestionID Int,
  @ServeyID Int,
  @Return_SerialNo Int = null OUTPUT
  AS
  INSERT [HRM_ServeyThemeQuestions]
  (
   [ThemeID]
  ,[QuestionID]
  ,[ServeyID]
  )
  VALUES
  (
   @ThemeID
  ,@QuestionID
  ,@ServeyID
  )
  SET @Return_SerialNo = Scope_Identity()
GO

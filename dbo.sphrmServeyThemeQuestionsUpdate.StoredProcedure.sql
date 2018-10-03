USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyThemeQuestionsUpdate]
  @ThemeID Int,
  @QuestionID Int,
  @ServeyID Int,
  @Original_SerialNo Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_ServeyThemeQuestions] SET 
   [ThemeID] = @ThemeID
  ,[QuestionID] = @QuestionID
  ,[ServeyID] = @ServeyID
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO

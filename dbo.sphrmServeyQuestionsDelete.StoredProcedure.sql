USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyQuestionsDelete]
  @Original_QuestionID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_ServeyQuestions]
  WHERE
  [HRM_ServeyQuestions].[QuestionID] = @Original_QuestionID
  SET @RowCount = @@RowCount
GO

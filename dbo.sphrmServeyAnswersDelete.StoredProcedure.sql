USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyAnswersDelete]
  @Original_AnswerID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_ServeyAnswers]
  WHERE
  [HRM_ServeyAnswers].[AnswerID] = @Original_AnswerID
  SET @RowCount = @@RowCount
GO

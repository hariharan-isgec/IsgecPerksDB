USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyThemeQuestionsDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [HRM_ServeyThemeQuestions]
  WHERE
  [HRM_ServeyThemeQuestions].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO

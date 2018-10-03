USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyAnswersUpdate]
  @ServeyID Int,
  @ServeySheetID Int,
  @QuestionID Int,
  @Answer1 Bit,
  @Answer2 Bit,
  @Answer3 Bit,
  @Answer4 Bit,
  @Answer5 Bit,
  @Answer6 Bit,
  @Answer7 Bit,
  @Answer8 Bit,
  @Answer9 Bit,
  @Answer10 Bit,
  @Answer11 Bit,
  @Answer12 Bit,
  @Answer13 Bit,
  @Answer14 Bit,
  @Answer15 Bit,
  @Answer16 Bit,
  @Answer17 Bit,
  @Answer18 Bit,
  @Answer19 Bit,
  @Answer20 Bit,
  @Answer21 Bit,
  @Answer22 Bit,
  @Answer23 Bit,
  @Answer24 Bit,
  @Answer25 Bit,
  @Original_AnswerID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_ServeyAnswers] SET 
   [ServeyID] = @ServeyID
  ,[ServeySheetID] = @ServeySheetID
  ,[QuestionID] = @QuestionID
  ,[Answer1] = @Answer1
  ,[Answer2] = @Answer2
  ,[Answer3] = @Answer3
  ,[Answer4] = @Answer4
  ,[Answer5] = @Answer5
  ,[Answer6] = @Answer6
  ,[Answer7] = @Answer7
  ,[Answer8] = @Answer8
  ,[Answer9] = @Answer9
  ,[Answer10] = @Answer10
  ,[Answer11] = @Answer11
  ,[Answer12] = @Answer12
  ,[Answer13] = @Answer13
  ,[Answer14] = @Answer14
  ,[Answer15] = @Answer15
  ,[Answer16] = @Answer16
  ,[Answer17] = @Answer17
  ,[Answer18] = @Answer18
  ,[Answer19] = @Answer19
  ,[Answer20] = @Answer20
  ,[Answer21] = @Answer21
  ,[Answer22] = @Answer22
  ,[Answer23] = @Answer23
  ,[Answer24] = @Answer24
  ,[Answer25] = @Answer25
  WHERE
  [AnswerID] = @Original_AnswerID
  SET @RowCount = @@RowCount
GO

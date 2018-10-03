USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyQuestionsUpdate]
  @Description NVarChar(500),
  @ServeyID Int,
  @Demography Bit,
  @UseCaption Bit,
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
  @AnsTag11 NVarChar(50),
  @AnsTag12 NVarChar(50),
  @AnsTag13 NVarChar(50),
  @AnsTag14 NVarChar(50),
  @AnsTag15 NVarChar(50),
  @AnsTag16 NVarChar(50),
  @AnsTag17 NVarChar(50),
  @AnsTag18 NVarChar(50),
  @AnsTag19 NVarChar(50),
  @AnsTag20 NVarChar(50),
  @AnsTag21 NVarChar(50),
  @AnsTag22 NVarChar(50),
  @AnsTag23 NVarChar(50),
  @AnsTag24 NVarChar(50),
  @AnsTag25 NVarChar(50),
  @Original_QuestionID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [HRM_ServeyQuestions] SET 
   [Description] = @Description
  ,[ServeyID] = @ServeyID
  ,[Demography] = @Demography
  ,[UseCaption] = @UseCaption
  ,[AnsTag1] = @AnsTag1
  ,[AnsTag2] = @AnsTag2
  ,[AnsTag3] = @AnsTag3
  ,[AnsTag4] = @AnsTag4
  ,[AnsTag5] = @AnsTag5
  ,[AnsTag6] = @AnsTag6
  ,[AnsTag7] = @AnsTag7
  ,[AnsTag8] = @AnsTag8
  ,[AnsTag9] = @AnsTag9
  ,[AnsTag10] = @AnsTag10
  ,[AnsTag11] = @AnsTag11
  ,[AnsTag12] = @AnsTag12
  ,[AnsTag13] = @AnsTag13
  ,[AnsTag14] = @AnsTag14
  ,[AnsTag15] = @AnsTag15
  ,[AnsTag16] = @AnsTag16
  ,[AnsTag17] = @AnsTag17
  ,[AnsTag18] = @AnsTag18
  ,[AnsTag19] = @AnsTag19
  ,[AnsTag20] = @AnsTag20
  ,[AnsTag21] = @AnsTag21
  ,[AnsTag22] = @AnsTag22
  ,[AnsTag23] = @AnsTag23
  ,[AnsTag24] = @AnsTag24
  ,[AnsTag25] = @AnsTag25
  WHERE
  [QuestionID] = @Original_QuestionID
  SET @RowCount = @@RowCount
GO

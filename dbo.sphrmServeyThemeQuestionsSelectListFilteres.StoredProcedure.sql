USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyThemeQuestionsSelectListFilteres]
  @Filter_ThemeID Int,
  @Filter_ServeyID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (SerialNo) ' + 
               'SELECT [HRM_ServeyThemeQuestions].[SerialNo] FROM [HRM_ServeyThemeQuestions] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_ServeyThemes] AS [HRM_ServeyThemes1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_ServeyThemeQuestions].[ThemeID] = [HRM_ServeyThemes1].[ThemeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_ServeyQuestions] AS [HRM_ServeyQuestions2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_ServeyThemeQuestions].[QuestionID] = [HRM_ServeyQuestions2].[QuestionID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Serveys] AS [HRM_Serveys3]'
  SET @LGSQL = @LGSQL + '    ON [HRM_ServeyThemeQuestions].[ServeyID] = [HRM_Serveys3].[ServeyID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ThemeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_ServeyThemeQuestions].[ThemeID] = ' + STR(@Filter_ThemeID)
  IF (@Filter_ServeyID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_ServeyThemeQuestions].[ServeyID] = ' + STR(@Filter_ServeyID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[HRM_ServeyThemeQuestions].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[HRM_ServeyThemeQuestions].[SerialNo] DESC'
                        WHEN 'ThemeID' THEN '[HRM_ServeyThemeQuestions].[ThemeID]'
                        WHEN 'ThemeID DESC' THEN '[HRM_ServeyThemeQuestions].[ThemeID] DESC'
                        WHEN 'QuestionID' THEN '[HRM_ServeyThemeQuestions].[QuestionID]'
                        WHEN 'QuestionID DESC' THEN '[HRM_ServeyThemeQuestions].[QuestionID] DESC'
                        WHEN 'ServeyID' THEN '[HRM_ServeyThemeQuestions].[ServeyID]'
                        WHEN 'ServeyID DESC' THEN '[HRM_ServeyThemeQuestions].[ServeyID] DESC'
                        WHEN 'HRM_ServeyThemes1_ThemeID' THEN '[HRM_ServeyThemes1].[ThemeID]'
                        WHEN 'HRM_ServeyThemes1_ThemeID DESC' THEN '[HRM_ServeyThemes1].[ThemeID] DESC'
                        WHEN 'HRM_ServeyThemes1_Description' THEN '[HRM_ServeyThemes1].[Description]'
                        WHEN 'HRM_ServeyThemes1_Description DESC' THEN '[HRM_ServeyThemes1].[Description] DESC'
                        WHEN 'HRM_ServeyThemes1_Details' THEN '[HRM_ServeyThemes1].[Details]'
                        WHEN 'HRM_ServeyThemes1_Details DESC' THEN '[HRM_ServeyThemes1].[Details] DESC'
                        WHEN 'HRM_ServeyThemes1_ServeyID' THEN '[HRM_ServeyThemes1].[ServeyID]'
                        WHEN 'HRM_ServeyThemes1_ServeyID DESC' THEN '[HRM_ServeyThemes1].[ServeyID] DESC'
                        WHEN 'HRM_ServeyQuestions2_QuestionID' THEN '[HRM_ServeyQuestions2].[QuestionID]'
                        WHEN 'HRM_ServeyQuestions2_QuestionID DESC' THEN '[HRM_ServeyQuestions2].[QuestionID] DESC'
                        WHEN 'HRM_ServeyQuestions2_Description' THEN '[HRM_ServeyQuestions2].[Description]'
                        WHEN 'HRM_ServeyQuestions2_Description DESC' THEN '[HRM_ServeyQuestions2].[Description] DESC'
                        WHEN 'HRM_ServeyQuestions2_ServeyID' THEN '[HRM_ServeyQuestions2].[ServeyID]'
                        WHEN 'HRM_ServeyQuestions2_ServeyID DESC' THEN '[HRM_ServeyQuestions2].[ServeyID] DESC'
                        WHEN 'HRM_ServeyQuestions2_Demography' THEN '[HRM_ServeyQuestions2].[Demography]'
                        WHEN 'HRM_ServeyQuestions2_Demography DESC' THEN '[HRM_ServeyQuestions2].[Demography] DESC'
                        WHEN 'HRM_ServeyQuestions2_UseCaption' THEN '[HRM_ServeyQuestions2].[UseCaption]'
                        WHEN 'HRM_ServeyQuestions2_UseCaption DESC' THEN '[HRM_ServeyQuestions2].[UseCaption] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag1' THEN '[HRM_ServeyQuestions2].[AnsTag1]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag1 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag1] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag2' THEN '[HRM_ServeyQuestions2].[AnsTag2]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag2 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag2] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag3' THEN '[HRM_ServeyQuestions2].[AnsTag3]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag3 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag3] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag4' THEN '[HRM_ServeyQuestions2].[AnsTag4]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag4 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag4] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag5' THEN '[HRM_ServeyQuestions2].[AnsTag5]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag5 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag5] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag6' THEN '[HRM_ServeyQuestions2].[AnsTag6]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag6 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag6] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag7' THEN '[HRM_ServeyQuestions2].[AnsTag7]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag7 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag7] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag8' THEN '[HRM_ServeyQuestions2].[AnsTag8]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag8 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag8] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag9' THEN '[HRM_ServeyQuestions2].[AnsTag9]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag9 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag9] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag10' THEN '[HRM_ServeyQuestions2].[AnsTag10]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag10 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag10] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag11' THEN '[HRM_ServeyQuestions2].[AnsTag11]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag11 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag11] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag12' THEN '[HRM_ServeyQuestions2].[AnsTag12]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag12 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag12] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag13' THEN '[HRM_ServeyQuestions2].[AnsTag13]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag13 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag13] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag14' THEN '[HRM_ServeyQuestions2].[AnsTag14]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag14 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag14] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag15' THEN '[HRM_ServeyQuestions2].[AnsTag15]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag15 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag15] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag16' THEN '[HRM_ServeyQuestions2].[AnsTag16]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag16 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag16] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag17' THEN '[HRM_ServeyQuestions2].[AnsTag17]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag17 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag17] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag18' THEN '[HRM_ServeyQuestions2].[AnsTag18]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag18 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag18] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag19' THEN '[HRM_ServeyQuestions2].[AnsTag19]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag19 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag19] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag20' THEN '[HRM_ServeyQuestions2].[AnsTag20]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag20 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag20] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag21' THEN '[HRM_ServeyQuestions2].[AnsTag21]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag21 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag21] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag22' THEN '[HRM_ServeyQuestions2].[AnsTag22]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag22 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag22] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag23' THEN '[HRM_ServeyQuestions2].[AnsTag23]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag23 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag23] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag24' THEN '[HRM_ServeyQuestions2].[AnsTag24]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag24 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag24] DESC'
                        WHEN 'HRM_ServeyQuestions2_AnsTag25' THEN '[HRM_ServeyQuestions2].[AnsTag25]'
                        WHEN 'HRM_ServeyQuestions2_AnsTag25 DESC' THEN '[HRM_ServeyQuestions2].[AnsTag25] DESC'
                        WHEN 'HRM_Serveys3_ServeyID' THEN '[HRM_Serveys3].[ServeyID]'
                        WHEN 'HRM_Serveys3_ServeyID DESC' THEN '[HRM_Serveys3].[ServeyID] DESC'
                        WHEN 'HRM_Serveys3_Description' THEN '[HRM_Serveys3].[Description]'
                        WHEN 'HRM_Serveys3_Description DESC' THEN '[HRM_Serveys3].[Description] DESC'
                        WHEN 'HRM_Serveys3_AnsTag1' THEN '[HRM_Serveys3].[AnsTag1]'
                        WHEN 'HRM_Serveys3_AnsTag1 DESC' THEN '[HRM_Serveys3].[AnsTag1] DESC'
                        WHEN 'HRM_Serveys3_AnsTag2' THEN '[HRM_Serveys3].[AnsTag2]'
                        WHEN 'HRM_Serveys3_AnsTag2 DESC' THEN '[HRM_Serveys3].[AnsTag2] DESC'
                        WHEN 'HRM_Serveys3_AnsTag3' THEN '[HRM_Serveys3].[AnsTag3]'
                        WHEN 'HRM_Serveys3_AnsTag3 DESC' THEN '[HRM_Serveys3].[AnsTag3] DESC'
                        WHEN 'HRM_Serveys3_AnsTag4' THEN '[HRM_Serveys3].[AnsTag4]'
                        WHEN 'HRM_Serveys3_AnsTag4 DESC' THEN '[HRM_Serveys3].[AnsTag4] DESC'
                        WHEN 'HRM_Serveys3_AnsTag5' THEN '[HRM_Serveys3].[AnsTag5]'
                        WHEN 'HRM_Serveys3_AnsTag5 DESC' THEN '[HRM_Serveys3].[AnsTag5] DESC'
                        WHEN 'HRM_Serveys3_AnsTag6' THEN '[HRM_Serveys3].[AnsTag6]'
                        WHEN 'HRM_Serveys3_AnsTag6 DESC' THEN '[HRM_Serveys3].[AnsTag6] DESC'
                        WHEN 'HRM_Serveys3_AnsTag7' THEN '[HRM_Serveys3].[AnsTag7]'
                        WHEN 'HRM_Serveys3_AnsTag7 DESC' THEN '[HRM_Serveys3].[AnsTag7] DESC'
                        WHEN 'HRM_Serveys3_AnsTag8' THEN '[HRM_Serveys3].[AnsTag8]'
                        WHEN 'HRM_Serveys3_AnsTag8 DESC' THEN '[HRM_Serveys3].[AnsTag8] DESC'
                        WHEN 'HRM_Serveys3_AnsTag9' THEN '[HRM_Serveys3].[AnsTag9]'
                        WHEN 'HRM_Serveys3_AnsTag9 DESC' THEN '[HRM_Serveys3].[AnsTag9] DESC'
                        WHEN 'HRM_Serveys3_AnsTag10' THEN '[HRM_Serveys3].[AnsTag10]'
                        WHEN 'HRM_Serveys3_AnsTag10 DESC' THEN '[HRM_Serveys3].[AnsTag10] DESC'
                        ELSE '[HRM_ServeyThemeQuestions].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_ServeyThemeQuestions].[SerialNo],
		[HRM_ServeyThemeQuestions].[ThemeID],
		[HRM_ServeyThemeQuestions].[QuestionID],
		[HRM_ServeyThemeQuestions].[ServeyID],
		[HRM_ServeyThemes1].[ThemeID] AS HRM_ServeyThemes1_ThemeID,
		[HRM_ServeyThemes1].[Description] AS HRM_ServeyThemes1_Description,
		[HRM_ServeyThemes1].[Details] AS HRM_ServeyThemes1_Details,
		[HRM_ServeyThemes1].[ServeyID] AS HRM_ServeyThemes1_ServeyID,
		[HRM_ServeyQuestions2].[QuestionID] AS HRM_ServeyQuestions2_QuestionID,
		[HRM_ServeyQuestions2].[Description] AS HRM_ServeyQuestions2_Description,
		[HRM_ServeyQuestions2].[ServeyID] AS HRM_ServeyQuestions2_ServeyID,
		[HRM_ServeyQuestions2].[Demography] AS HRM_ServeyQuestions2_Demography,
		[HRM_ServeyQuestions2].[UseCaption] AS HRM_ServeyQuestions2_UseCaption,
		[HRM_ServeyQuestions2].[AnsTag1] AS HRM_ServeyQuestions2_AnsTag1,
		[HRM_ServeyQuestions2].[AnsTag2] AS HRM_ServeyQuestions2_AnsTag2,
		[HRM_ServeyQuestions2].[AnsTag3] AS HRM_ServeyQuestions2_AnsTag3,
		[HRM_ServeyQuestions2].[AnsTag4] AS HRM_ServeyQuestions2_AnsTag4,
		[HRM_ServeyQuestions2].[AnsTag5] AS HRM_ServeyQuestions2_AnsTag5,
		[HRM_ServeyQuestions2].[AnsTag6] AS HRM_ServeyQuestions2_AnsTag6,
		[HRM_ServeyQuestions2].[AnsTag7] AS HRM_ServeyQuestions2_AnsTag7,
		[HRM_ServeyQuestions2].[AnsTag8] AS HRM_ServeyQuestions2_AnsTag8,
		[HRM_ServeyQuestions2].[AnsTag9] AS HRM_ServeyQuestions2_AnsTag9,
		[HRM_ServeyQuestions2].[AnsTag10] AS HRM_ServeyQuestions2_AnsTag10,
		[HRM_ServeyQuestions2].[AnsTag11] AS HRM_ServeyQuestions2_AnsTag11,
		[HRM_ServeyQuestions2].[AnsTag12] AS HRM_ServeyQuestions2_AnsTag12,
		[HRM_ServeyQuestions2].[AnsTag13] AS HRM_ServeyQuestions2_AnsTag13,
		[HRM_ServeyQuestions2].[AnsTag14] AS HRM_ServeyQuestions2_AnsTag14,
		[HRM_ServeyQuestions2].[AnsTag15] AS HRM_ServeyQuestions2_AnsTag15,
		[HRM_ServeyQuestions2].[AnsTag16] AS HRM_ServeyQuestions2_AnsTag16,
		[HRM_ServeyQuestions2].[AnsTag17] AS HRM_ServeyQuestions2_AnsTag17,
		[HRM_ServeyQuestions2].[AnsTag18] AS HRM_ServeyQuestions2_AnsTag18,
		[HRM_ServeyQuestions2].[AnsTag19] AS HRM_ServeyQuestions2_AnsTag19,
		[HRM_ServeyQuestions2].[AnsTag20] AS HRM_ServeyQuestions2_AnsTag20,
		[HRM_ServeyQuestions2].[AnsTag21] AS HRM_ServeyQuestions2_AnsTag21,
		[HRM_ServeyQuestions2].[AnsTag22] AS HRM_ServeyQuestions2_AnsTag22,
		[HRM_ServeyQuestions2].[AnsTag23] AS HRM_ServeyQuestions2_AnsTag23,
		[HRM_ServeyQuestions2].[AnsTag24] AS HRM_ServeyQuestions2_AnsTag24,
		[HRM_ServeyQuestions2].[AnsTag25] AS HRM_ServeyQuestions2_AnsTag25,
		[HRM_Serveys3].[ServeyID] AS HRM_Serveys3_ServeyID,
		[HRM_Serveys3].[Description] AS HRM_Serveys3_Description,
		[HRM_Serveys3].[AnsTag1] AS HRM_Serveys3_AnsTag1,
		[HRM_Serveys3].[AnsTag2] AS HRM_Serveys3_AnsTag2,
		[HRM_Serveys3].[AnsTag3] AS HRM_Serveys3_AnsTag3,
		[HRM_Serveys3].[AnsTag4] AS HRM_Serveys3_AnsTag4,
		[HRM_Serveys3].[AnsTag5] AS HRM_Serveys3_AnsTag5,
		[HRM_Serveys3].[AnsTag6] AS HRM_Serveys3_AnsTag6,
		[HRM_Serveys3].[AnsTag7] AS HRM_Serveys3_AnsTag7,
		[HRM_Serveys3].[AnsTag8] AS HRM_Serveys3_AnsTag8,
		[HRM_Serveys3].[AnsTag9] AS HRM_Serveys3_AnsTag9,
		[HRM_Serveys3].[AnsTag10] AS HRM_Serveys3_AnsTag10 
  FROM [HRM_ServeyThemeQuestions] 
    	INNER JOIN #PageIndex
          ON [HRM_ServeyThemeQuestions].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [HRM_ServeyThemes] AS [HRM_ServeyThemes1]
    ON [HRM_ServeyThemeQuestions].[ThemeID] = [HRM_ServeyThemes1].[ThemeID]
  INNER JOIN [HRM_ServeyQuestions] AS [HRM_ServeyQuestions2]
    ON [HRM_ServeyThemeQuestions].[QuestionID] = [HRM_ServeyQuestions2].[QuestionID]
  INNER JOIN [HRM_Serveys] AS [HRM_Serveys3]
    ON [HRM_ServeyThemeQuestions].[ServeyID] = [HRM_Serveys3].[ServeyID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

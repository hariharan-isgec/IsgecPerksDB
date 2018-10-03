USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeyQuestionsSelectListFilteres]
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
  QuestionID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (QuestionID) ' + 
               'SELECT [HRM_ServeyQuestions].[QuestionID] FROM [HRM_ServeyQuestions] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Serveys] AS [HRM_Serveys1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_ServeyQuestions].[ServeyID] = [HRM_Serveys1].[ServeyID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ServeyID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_ServeyQuestions].[ServeyID] = ' + STR(@Filter_ServeyID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'QuestionID' THEN '[HRM_ServeyQuestions].[QuestionID]'
                        WHEN 'QuestionID DESC' THEN '[HRM_ServeyQuestions].[QuestionID] DESC'
                        WHEN 'Description' THEN '[HRM_ServeyQuestions].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_ServeyQuestions].[Description] DESC'
                        WHEN 'ServeyID' THEN '[HRM_ServeyQuestions].[ServeyID]'
                        WHEN 'ServeyID DESC' THEN '[HRM_ServeyQuestions].[ServeyID] DESC'
                        WHEN 'Demography' THEN '[HRM_ServeyQuestions].[Demography]'
                        WHEN 'Demography DESC' THEN '[HRM_ServeyQuestions].[Demography] DESC'
                        WHEN 'UseCaption' THEN '[HRM_ServeyQuestions].[UseCaption]'
                        WHEN 'UseCaption DESC' THEN '[HRM_ServeyQuestions].[UseCaption] DESC'
                        WHEN 'AnsTag1' THEN '[HRM_ServeyQuestions].[AnsTag1]'
                        WHEN 'AnsTag1 DESC' THEN '[HRM_ServeyQuestions].[AnsTag1] DESC'
                        WHEN 'AnsTag2' THEN '[HRM_ServeyQuestions].[AnsTag2]'
                        WHEN 'AnsTag2 DESC' THEN '[HRM_ServeyQuestions].[AnsTag2] DESC'
                        WHEN 'AnsTag3' THEN '[HRM_ServeyQuestions].[AnsTag3]'
                        WHEN 'AnsTag3 DESC' THEN '[HRM_ServeyQuestions].[AnsTag3] DESC'
                        WHEN 'AnsTag4' THEN '[HRM_ServeyQuestions].[AnsTag4]'
                        WHEN 'AnsTag4 DESC' THEN '[HRM_ServeyQuestions].[AnsTag4] DESC'
                        WHEN 'AnsTag5' THEN '[HRM_ServeyQuestions].[AnsTag5]'
                        WHEN 'AnsTag5 DESC' THEN '[HRM_ServeyQuestions].[AnsTag5] DESC'
                        WHEN 'AnsTag6' THEN '[HRM_ServeyQuestions].[AnsTag6]'
                        WHEN 'AnsTag6 DESC' THEN '[HRM_ServeyQuestions].[AnsTag6] DESC'
                        WHEN 'AnsTag7' THEN '[HRM_ServeyQuestions].[AnsTag7]'
                        WHEN 'AnsTag7 DESC' THEN '[HRM_ServeyQuestions].[AnsTag7] DESC'
                        WHEN 'AnsTag8' THEN '[HRM_ServeyQuestions].[AnsTag8]'
                        WHEN 'AnsTag8 DESC' THEN '[HRM_ServeyQuestions].[AnsTag8] DESC'
                        WHEN 'AnsTag9' THEN '[HRM_ServeyQuestions].[AnsTag9]'
                        WHEN 'AnsTag9 DESC' THEN '[HRM_ServeyQuestions].[AnsTag9] DESC'
                        WHEN 'AnsTag10' THEN '[HRM_ServeyQuestions].[AnsTag10]'
                        WHEN 'AnsTag10 DESC' THEN '[HRM_ServeyQuestions].[AnsTag10] DESC'
                        WHEN 'AnsTag11' THEN '[HRM_ServeyQuestions].[AnsTag11]'
                        WHEN 'AnsTag11 DESC' THEN '[HRM_ServeyQuestions].[AnsTag11] DESC'
                        WHEN 'AnsTag12' THEN '[HRM_ServeyQuestions].[AnsTag12]'
                        WHEN 'AnsTag12 DESC' THEN '[HRM_ServeyQuestions].[AnsTag12] DESC'
                        WHEN 'AnsTag13' THEN '[HRM_ServeyQuestions].[AnsTag13]'
                        WHEN 'AnsTag13 DESC' THEN '[HRM_ServeyQuestions].[AnsTag13] DESC'
                        WHEN 'AnsTag14' THEN '[HRM_ServeyQuestions].[AnsTag14]'
                        WHEN 'AnsTag14 DESC' THEN '[HRM_ServeyQuestions].[AnsTag14] DESC'
                        WHEN 'AnsTag15' THEN '[HRM_ServeyQuestions].[AnsTag15]'
                        WHEN 'AnsTag15 DESC' THEN '[HRM_ServeyQuestions].[AnsTag15] DESC'
                        WHEN 'AnsTag16' THEN '[HRM_ServeyQuestions].[AnsTag16]'
                        WHEN 'AnsTag16 DESC' THEN '[HRM_ServeyQuestions].[AnsTag16] DESC'
                        WHEN 'AnsTag17' THEN '[HRM_ServeyQuestions].[AnsTag17]'
                        WHEN 'AnsTag17 DESC' THEN '[HRM_ServeyQuestions].[AnsTag17] DESC'
                        WHEN 'AnsTag18' THEN '[HRM_ServeyQuestions].[AnsTag18]'
                        WHEN 'AnsTag18 DESC' THEN '[HRM_ServeyQuestions].[AnsTag18] DESC'
                        WHEN 'AnsTag19' THEN '[HRM_ServeyQuestions].[AnsTag19]'
                        WHEN 'AnsTag19 DESC' THEN '[HRM_ServeyQuestions].[AnsTag19] DESC'
                        WHEN 'AnsTag20' THEN '[HRM_ServeyQuestions].[AnsTag20]'
                        WHEN 'AnsTag20 DESC' THEN '[HRM_ServeyQuestions].[AnsTag20] DESC'
                        WHEN 'AnsTag21' THEN '[HRM_ServeyQuestions].[AnsTag21]'
                        WHEN 'AnsTag21 DESC' THEN '[HRM_ServeyQuestions].[AnsTag21] DESC'
                        WHEN 'AnsTag22' THEN '[HRM_ServeyQuestions].[AnsTag22]'
                        WHEN 'AnsTag22 DESC' THEN '[HRM_ServeyQuestions].[AnsTag22] DESC'
                        WHEN 'AnsTag23' THEN '[HRM_ServeyQuestions].[AnsTag23]'
                        WHEN 'AnsTag23 DESC' THEN '[HRM_ServeyQuestions].[AnsTag23] DESC'
                        WHEN 'AnsTag24' THEN '[HRM_ServeyQuestions].[AnsTag24]'
                        WHEN 'AnsTag24 DESC' THEN '[HRM_ServeyQuestions].[AnsTag24] DESC'
                        WHEN 'AnsTag25' THEN '[HRM_ServeyQuestions].[AnsTag25]'
                        WHEN 'AnsTag25 DESC' THEN '[HRM_ServeyQuestions].[AnsTag25] DESC'
                        WHEN 'HRM_Serveys1_ServeyID' THEN '[HRM_Serveys1].[ServeyID]'
                        WHEN 'HRM_Serveys1_ServeyID DESC' THEN '[HRM_Serveys1].[ServeyID] DESC'
                        WHEN 'HRM_Serveys1_Description' THEN '[HRM_Serveys1].[Description]'
                        WHEN 'HRM_Serveys1_Description DESC' THEN '[HRM_Serveys1].[Description] DESC'
                        WHEN 'HRM_Serveys1_AnsTag1' THEN '[HRM_Serveys1].[AnsTag1]'
                        WHEN 'HRM_Serveys1_AnsTag1 DESC' THEN '[HRM_Serveys1].[AnsTag1] DESC'
                        WHEN 'HRM_Serveys1_AnsTag2' THEN '[HRM_Serveys1].[AnsTag2]'
                        WHEN 'HRM_Serveys1_AnsTag2 DESC' THEN '[HRM_Serveys1].[AnsTag2] DESC'
                        WHEN 'HRM_Serveys1_AnsTag3' THEN '[HRM_Serveys1].[AnsTag3]'
                        WHEN 'HRM_Serveys1_AnsTag3 DESC' THEN '[HRM_Serveys1].[AnsTag3] DESC'
                        WHEN 'HRM_Serveys1_AnsTag4' THEN '[HRM_Serveys1].[AnsTag4]'
                        WHEN 'HRM_Serveys1_AnsTag4 DESC' THEN '[HRM_Serveys1].[AnsTag4] DESC'
                        WHEN 'HRM_Serveys1_AnsTag5' THEN '[HRM_Serveys1].[AnsTag5]'
                        WHEN 'HRM_Serveys1_AnsTag5 DESC' THEN '[HRM_Serveys1].[AnsTag5] DESC'
                        WHEN 'HRM_Serveys1_AnsTag6' THEN '[HRM_Serveys1].[AnsTag6]'
                        WHEN 'HRM_Serveys1_AnsTag6 DESC' THEN '[HRM_Serveys1].[AnsTag6] DESC'
                        WHEN 'HRM_Serveys1_AnsTag7' THEN '[HRM_Serveys1].[AnsTag7]'
                        WHEN 'HRM_Serveys1_AnsTag7 DESC' THEN '[HRM_Serveys1].[AnsTag7] DESC'
                        WHEN 'HRM_Serveys1_AnsTag8' THEN '[HRM_Serveys1].[AnsTag8]'
                        WHEN 'HRM_Serveys1_AnsTag8 DESC' THEN '[HRM_Serveys1].[AnsTag8] DESC'
                        WHEN 'HRM_Serveys1_AnsTag9' THEN '[HRM_Serveys1].[AnsTag9]'
                        WHEN 'HRM_Serveys1_AnsTag9 DESC' THEN '[HRM_Serveys1].[AnsTag9] DESC'
                        WHEN 'HRM_Serveys1_AnsTag10' THEN '[HRM_Serveys1].[AnsTag10]'
                        WHEN 'HRM_Serveys1_AnsTag10 DESC' THEN '[HRM_Serveys1].[AnsTag10] DESC'
                        ELSE '[HRM_ServeyQuestions].[QuestionID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_ServeyQuestions].[QuestionID],
		[HRM_ServeyQuestions].[Description],
		[HRM_ServeyQuestions].[ServeyID],
		[HRM_ServeyQuestions].[Demography],
		[HRM_ServeyQuestions].[UseCaption],
		[HRM_ServeyQuestions].[AnsTag1],
		[HRM_ServeyQuestions].[AnsTag2],
		[HRM_ServeyQuestions].[AnsTag3],
		[HRM_ServeyQuestions].[AnsTag4],
		[HRM_ServeyQuestions].[AnsTag5],
		[HRM_ServeyQuestions].[AnsTag6],
		[HRM_ServeyQuestions].[AnsTag7],
		[HRM_ServeyQuestions].[AnsTag8],
		[HRM_ServeyQuestions].[AnsTag9],
		[HRM_ServeyQuestions].[AnsTag10],
		[HRM_ServeyQuestions].[AnsTag11],
		[HRM_ServeyQuestions].[AnsTag12],
		[HRM_ServeyQuestions].[AnsTag13],
		[HRM_ServeyQuestions].[AnsTag14],
		[HRM_ServeyQuestions].[AnsTag15],
		[HRM_ServeyQuestions].[AnsTag16],
		[HRM_ServeyQuestions].[AnsTag17],
		[HRM_ServeyQuestions].[AnsTag18],
		[HRM_ServeyQuestions].[AnsTag19],
		[HRM_ServeyQuestions].[AnsTag20],
		[HRM_ServeyQuestions].[AnsTag21],
		[HRM_ServeyQuestions].[AnsTag22],
		[HRM_ServeyQuestions].[AnsTag23],
		[HRM_ServeyQuestions].[AnsTag24],
		[HRM_ServeyQuestions].[AnsTag25],
		[HRM_Serveys1].[ServeyID] AS HRM_Serveys1_ServeyID,
		[HRM_Serveys1].[Description] AS HRM_Serveys1_Description,
		[HRM_Serveys1].[AnsTag1] AS HRM_Serveys1_AnsTag1,
		[HRM_Serveys1].[AnsTag2] AS HRM_Serveys1_AnsTag2,
		[HRM_Serveys1].[AnsTag3] AS HRM_Serveys1_AnsTag3,
		[HRM_Serveys1].[AnsTag4] AS HRM_Serveys1_AnsTag4,
		[HRM_Serveys1].[AnsTag5] AS HRM_Serveys1_AnsTag5,
		[HRM_Serveys1].[AnsTag6] AS HRM_Serveys1_AnsTag6,
		[HRM_Serveys1].[AnsTag7] AS HRM_Serveys1_AnsTag7,
		[HRM_Serveys1].[AnsTag8] AS HRM_Serveys1_AnsTag8,
		[HRM_Serveys1].[AnsTag9] AS HRM_Serveys1_AnsTag9,
		[HRM_Serveys1].[AnsTag10] AS HRM_Serveys1_AnsTag10 
  FROM [HRM_ServeyQuestions] 
    	INNER JOIN #PageIndex
          ON [HRM_ServeyQuestions].[QuestionID] = #PageIndex.QuestionID
  INNER JOIN [HRM_Serveys] AS [HRM_Serveys1]
    ON [HRM_ServeyQuestions].[ServeyID] = [HRM_Serveys1].[ServeyID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

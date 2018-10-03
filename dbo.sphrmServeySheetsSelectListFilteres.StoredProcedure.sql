USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeySheetsSelectListFilteres]
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
  ServeySheetID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (ServeySheetID) ' + 
               'SELECT [HRM_ServeySheets].[ServeySheetID] FROM [HRM_ServeySheets] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Serveys] AS [HRM_Serveys1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_ServeySheets].[ServeyID] = [HRM_Serveys1].[ServeyID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ServeyID > 0) 
    SET @LGSQL = @LGSQL + ' AND [HRM_ServeySheets].[ServeyID] = ' + STR(@Filter_ServeyID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ServeyID' THEN '[HRM_ServeySheets].[ServeyID]'
                        WHEN 'ServeyID DESC' THEN '[HRM_ServeySheets].[ServeyID] DESC'
                        WHEN 'ServeySheetID' THEN '[HRM_ServeySheets].[ServeySheetID]'
                        WHEN 'ServeySheetID DESC' THEN '[HRM_ServeySheets].[ServeySheetID] DESC'
                        WHEN 'Description' THEN '[HRM_ServeySheets].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_ServeySheets].[Description] DESC'
                        WHEN 'CreatedOn' THEN '[HRM_ServeySheets].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[HRM_ServeySheets].[CreatedOn] DESC'
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
                        ELSE '[HRM_ServeySheets].[ServeySheetID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_ServeySheets].[ServeyID],
		[HRM_ServeySheets].[ServeySheetID],
		[HRM_ServeySheets].[Description],
		[HRM_ServeySheets].[CreatedOn],
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
  FROM [HRM_ServeySheets] 
    	INNER JOIN #PageIndex
          ON [HRM_ServeySheets].[ServeySheetID] = #PageIndex.ServeySheetID
  INNER JOIN [HRM_Serveys] AS [HRM_Serveys1]
    ON [HRM_ServeySheets].[ServeyID] = [HRM_Serveys1].[ServeyID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

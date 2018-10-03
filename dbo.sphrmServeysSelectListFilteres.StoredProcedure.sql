USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmServeysSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  ServeyID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (ServeyID) ' + 
               'SELECT [HRM_Serveys].[ServeyID] FROM [HRM_Serveys] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ServeyID' THEN '[HRM_Serveys].[ServeyID]'
                        WHEN 'ServeyID DESC' THEN '[HRM_Serveys].[ServeyID] DESC'
                        WHEN 'Description' THEN '[HRM_Serveys].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_Serveys].[Description] DESC'
                        WHEN 'AnsTag1' THEN '[HRM_Serveys].[AnsTag1]'
                        WHEN 'AnsTag1 DESC' THEN '[HRM_Serveys].[AnsTag1] DESC'
                        WHEN 'AnsTag2' THEN '[HRM_Serveys].[AnsTag2]'
                        WHEN 'AnsTag2 DESC' THEN '[HRM_Serveys].[AnsTag2] DESC'
                        WHEN 'AnsTag3' THEN '[HRM_Serveys].[AnsTag3]'
                        WHEN 'AnsTag3 DESC' THEN '[HRM_Serveys].[AnsTag3] DESC'
                        WHEN 'AnsTag4' THEN '[HRM_Serveys].[AnsTag4]'
                        WHEN 'AnsTag4 DESC' THEN '[HRM_Serveys].[AnsTag4] DESC'
                        WHEN 'AnsTag5' THEN '[HRM_Serveys].[AnsTag5]'
                        WHEN 'AnsTag5 DESC' THEN '[HRM_Serveys].[AnsTag5] DESC'
                        WHEN 'AnsTag6' THEN '[HRM_Serveys].[AnsTag6]'
                        WHEN 'AnsTag6 DESC' THEN '[HRM_Serveys].[AnsTag6] DESC'
                        WHEN 'AnsTag7' THEN '[HRM_Serveys].[AnsTag7]'
                        WHEN 'AnsTag7 DESC' THEN '[HRM_Serveys].[AnsTag7] DESC'
                        WHEN 'AnsTag8' THEN '[HRM_Serveys].[AnsTag8]'
                        WHEN 'AnsTag8 DESC' THEN '[HRM_Serveys].[AnsTag8] DESC'
                        WHEN 'AnsTag9' THEN '[HRM_Serveys].[AnsTag9]'
                        WHEN 'AnsTag9 DESC' THEN '[HRM_Serveys].[AnsTag9] DESC'
                        WHEN 'AnsTag10' THEN '[HRM_Serveys].[AnsTag10]'
                        WHEN 'AnsTag10 DESC' THEN '[HRM_Serveys].[AnsTag10] DESC'
                        ELSE '[HRM_Serveys].[ServeyID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Serveys].[ServeyID],
		[HRM_Serveys].[Description],
		[HRM_Serveys].[AnsTag1],
		[HRM_Serveys].[AnsTag2],
		[HRM_Serveys].[AnsTag3],
		[HRM_Serveys].[AnsTag4],
		[HRM_Serveys].[AnsTag5],
		[HRM_Serveys].[AnsTag6],
		[HRM_Serveys].[AnsTag7],
		[HRM_Serveys].[AnsTag8],
		[HRM_Serveys].[AnsTag9],
		[HRM_Serveys].[AnsTag10] 
  FROM [HRM_Serveys] 
    	INNER JOIN #PageIndex
          ON [HRM_Serveys].[ServeyID] = #PageIndex.ServeyID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

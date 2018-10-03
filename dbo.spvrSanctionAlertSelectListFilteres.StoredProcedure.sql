USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrSanctionAlertSelectListFilteres]
  @Filter_ProjectID NVarChar(6),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ProjectID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_SanctionAlert].[ProjectID]'
  SET @LGSQL = @LGSQL + ' FROM [VR_SanctionAlert] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [IDM_Projects] AS [IDM_Projects1]'
  SET @LGSQL = @LGSQL + '    ON [VR_SanctionAlert].[ProjectID] = [IDM_Projects1].[ProjectID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_SanctionAlert].[ProjectID] = ''' + @Filter_ProjectID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ProjectID' THEN '[VR_SanctionAlert].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[VR_SanctionAlert].[ProjectID] DESC'
                        WHEN 'At60' THEN '[VR_SanctionAlert].[At60]'
                        WHEN 'At60 DESC' THEN '[VR_SanctionAlert].[At60] DESC'
                        WHEN 'At70' THEN '[VR_SanctionAlert].[At70]'
                        WHEN 'At70 DESC' THEN '[VR_SanctionAlert].[At70] DESC'
                        WHEN 'At80' THEN '[VR_SanctionAlert].[At80]'
                        WHEN 'At80 DESC' THEN '[VR_SanctionAlert].[At80] DESC'
                        WHEN 'At90' THEN '[VR_SanctionAlert].[At90]'
                        WHEN 'At90 DESC' THEN '[VR_SanctionAlert].[At90] DESC'
                        WHEN 'At95' THEN '[VR_SanctionAlert].[At95]'
                        WHEN 'At95 DESC' THEN '[VR_SanctionAlert].[At95] DESC'
                        WHEN 'At96' THEN '[VR_SanctionAlert].[At96]'
                        WHEN 'At96 DESC' THEN '[VR_SanctionAlert].[At96] DESC'
                        WHEN 'At97' THEN '[VR_SanctionAlert].[At97]'
                        WHEN 'At97 DESC' THEN '[VR_SanctionAlert].[At97] DESC'
                        WHEN 'At98' THEN '[VR_SanctionAlert].[At98]'
                        WHEN 'At98 DESC' THEN '[VR_SanctionAlert].[At98] DESC'
                        WHEN 'At99' THEN '[VR_SanctionAlert].[At99]'
                        WHEN 'At99 DESC' THEN '[VR_SanctionAlert].[At99] DESC'
                        WHEN 'EMailIDs' THEN '[VR_SanctionAlert].[EMailIDs]'
                        WHEN 'EMailIDs DESC' THEN '[VR_SanctionAlert].[EMailIDs] DESC'
                        WHEN 'IDM_Projects1_Description' THEN '[IDM_Projects1].[Description]'
                        WHEN 'IDM_Projects1_Description DESC' THEN '[IDM_Projects1].[Description] DESC'
                        ELSE '[VR_SanctionAlert].[ProjectID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[VR_SanctionAlert].[ProjectID] ,
		[VR_SanctionAlert].[At60] ,
		[VR_SanctionAlert].[At70] ,
		[VR_SanctionAlert].[At80] ,
		[VR_SanctionAlert].[At90] ,
		[VR_SanctionAlert].[At95] ,
		[VR_SanctionAlert].[At96] ,
		[VR_SanctionAlert].[At97] ,
		[VR_SanctionAlert].[At98] ,
		[VR_SanctionAlert].[At99] ,
		[VR_SanctionAlert].[EMailIDs] ,
		[IDM_Projects1].[Description] AS IDM_Projects1_Description 
  FROM [VR_SanctionAlert] 
    	INNER JOIN #PageIndex
          ON [VR_SanctionAlert].[ProjectID] = #PageIndex.ProjectID
  INNER JOIN [IDM_Projects] AS [IDM_Projects1]
    ON [VR_SanctionAlert].[ProjectID] = [IDM_Projects1].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

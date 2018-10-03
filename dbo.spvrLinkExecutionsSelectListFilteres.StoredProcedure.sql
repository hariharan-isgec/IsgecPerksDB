USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLinkExecutionsSelectListFilteres]
  @Filter_SRNNo Int,
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
 ,LinkID Int NOT NULL
 ,SRNNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'LinkID'
  SET @LGSQL = @LGSQL + ', SRNNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_LinkExecutions].[LinkID]'
  SET @LGSQL = @LGSQL + ', [VR_LinkExecutions].[SRNNo]'
  SET @LGSQL = @LGSQL + ' FROM [VR_LinkExecutions] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [VR_LinkExecutions].[LinkedBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [VR_RequestExecution] AS [VR_RequestExecution2]'
  SET @LGSQL = @LGSQL + '    ON [VR_LinkExecutions].[SRNNo] = [VR_RequestExecution2].[SRNNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_SRNNo > 0) 
    SET @LGSQL = @LGSQL + ' AND [VR_LinkExecutions].[SRNNo] = ' + STR(@Filter_SRNNo)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LinkID' THEN '[VR_LinkExecutions].[LinkID]'
                        WHEN 'LinkID DESC' THEN '[VR_LinkExecutions].[LinkID] DESC'
                        WHEN 'SRNNo' THEN '[VR_LinkExecutions].[SRNNo]'
                        WHEN 'SRNNo DESC' THEN '[VR_LinkExecutions].[SRNNo] DESC'
                        WHEN 'LinkedBy' THEN '[VR_LinkExecutions].[LinkedBy]'
                        WHEN 'LinkedBy DESC' THEN '[VR_LinkExecutions].[LinkedBy] DESC'
                        WHEN 'LinkedOn' THEN '[VR_LinkExecutions].[LinkedOn]'
                        WHEN 'LinkedOn DESC' THEN '[VR_LinkExecutions].[LinkedOn] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'VR_RequestExecution2_ExecutionDescription' THEN '[VR_RequestExecution2].[ExecutionDescription]'
                        WHEN 'VR_RequestExecution2_ExecutionDescription DESC' THEN '[VR_RequestExecution2].[ExecutionDescription] DESC'
                        ELSE '[VR_LinkExecutions].[LinkID],[VR_LinkExecutions].[SRNNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[VR_LinkExecutions].[LinkID] ,
		[VR_LinkExecutions].[SRNNo] ,
		[VR_LinkExecutions].[LinkedBy] ,
		[VR_LinkExecutions].[LinkedOn] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[VR_RequestExecution2].[ExecutionDescription] AS VR_RequestExecution2_ExecutionDescription 
  FROM [VR_LinkExecutions] 
    	INNER JOIN #PageIndex
          ON [VR_LinkExecutions].[LinkID] = #PageIndex.LinkID
          AND [VR_LinkExecutions].[SRNNo] = #PageIndex.SRNNo
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_LinkExecutions].[LinkedBy] = [aspnet_Users1].[LoginID]
  INNER JOIN [VR_RequestExecution] AS [VR_RequestExecution2]
    ON [VR_LinkExecutions].[SRNNo] = [VR_RequestExecution2].[SRNNo]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

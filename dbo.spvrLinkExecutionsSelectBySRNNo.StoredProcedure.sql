USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLinkExecutionsSelectBySRNNo]
  @SRNNo Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[VR_LinkExecutions].[LinkID] ,
		[VR_LinkExecutions].[SRNNo] ,
		[VR_LinkExecutions].[LinkedBy] ,
		[VR_LinkExecutions].[LinkedOn] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[VR_RequestExecution2].[ExecutionDescription] AS VR_RequestExecution2_ExecutionDescription 
  FROM [VR_LinkExecutions] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_LinkExecutions].[LinkedBy] = [aspnet_Users1].[LoginID]
  INNER JOIN [VR_RequestExecution] AS [VR_RequestExecution2]
    ON [VR_LinkExecutions].[SRNNo] = [VR_RequestExecution2].[SRNNo]
  WHERE
  [VR_LinkExecutions].[SRNNo] = @SRNNo
  ORDER BY
     CASE @OrderBy WHEN 'LinkID' THEN [VR_LinkExecutions].[LinkID] END,
     CASE @OrderBy WHEN 'LinkID DESC' THEN [VR_LinkExecutions].[LinkID] END DESC,
     CASE @OrderBy WHEN 'SRNNo' THEN [VR_LinkExecutions].[SRNNo] END,
     CASE @OrderBy WHEN 'SRNNo DESC' THEN [VR_LinkExecutions].[SRNNo] END DESC,
     CASE @OrderBy WHEN 'LinkedBy' THEN [VR_LinkExecutions].[LinkedBy] END,
     CASE @OrderBy WHEN 'LinkedBy DESC' THEN [VR_LinkExecutions].[LinkedBy] END DESC,
     CASE @OrderBy WHEN 'LinkedOn' THEN [VR_LinkExecutions].[LinkedOn] END,
     CASE @OrderBy WHEN 'LinkedOn DESC' THEN [VR_LinkExecutions].[LinkedOn] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'VR_RequestExecution2_ExecutionDescription' THEN [VR_RequestExecution2].[ExecutionDescription] END,
     CASE @OrderBy WHEN 'VR_RequestExecution2_ExecutionDescription DESC' THEN [VR_RequestExecution2].[ExecutionDescription] END DESC 
  SET @RecordCount = @@RowCount
GO

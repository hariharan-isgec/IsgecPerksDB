USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLinkExecutionsSelectByID]
  @LoginID NVarChar(8),
  @LinkID Int,
  @SRNNo Int 
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
  [VR_LinkExecutions].[LinkID] = @LinkID
  AND [VR_LinkExecutions].[SRNNo] = @SRNNo
GO

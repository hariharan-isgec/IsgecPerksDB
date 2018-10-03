USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestStatesSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
		[VR_RequestStates].[StatusID] ,
		[VR_RequestStates].[Description]  
  FROM [VR_RequestStates] 
  WHERE
  [VR_RequestStates].[StatusID] = @StatusID
GO

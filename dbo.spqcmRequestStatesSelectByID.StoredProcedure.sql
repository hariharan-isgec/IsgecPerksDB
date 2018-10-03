USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRequestStatesSelectByID]
  @LoginID NVarChar(8),
  @StateID NVarChar(10) 
  AS
  SELECT
		[QCM_RequestStates].[StateID] ,
		[QCM_RequestStates].[Description]  
  FROM [QCM_RequestStates] 
  WHERE
  [QCM_RequestStates].[StateID] = @StateID
GO

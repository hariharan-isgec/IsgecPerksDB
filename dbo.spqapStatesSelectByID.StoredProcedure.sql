USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapStatesSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
		[QAP_States].[StatusID] ,
		[QAP_States].[QAPStatus]  
  FROM [QAP_States] 
  WHERE
  [QAP_States].[StatusID] = @StatusID
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOStatusSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
		[EITL_POStatus].[StatusID] ,
		[EITL_POStatus].[Description]  
  FROM [EITL_POStatus] 
  WHERE
  [EITL_POStatus].[StatusID] = @StatusID
GO

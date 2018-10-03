USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[speitlPOItemStatusSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
		[EITL_POItemStatus].[StatusID] ,
		[EITL_POItemStatus].[Description]  
  FROM [EITL_POItemStatus] 
  WHERE
  [EITL_POItemStatus].[StatusID] = @StatusID
GO

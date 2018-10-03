USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestStatusSelectByID]
  @LoginID NVarChar(8),
  @StatusID Int 
  AS
  SELECT
		[ERP_RequestStatus].[StatusID] ,
		[ERP_RequestStatus].[Description]  
  FROM [ERP_RequestStatus] 
  WHERE
  [ERP_RequestStatus].[StatusID] = @StatusID
GO

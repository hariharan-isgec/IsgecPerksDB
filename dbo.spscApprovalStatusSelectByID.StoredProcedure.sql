USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscApprovalStatusSelectByID]
  @LoginID NVarChar(8),
  @StatusID NVarChar(2) 
  AS
  SELECT
    [SC_ApprovalStatus].*  
  FROM [SC_ApprovalStatus] 
  WHERE
  [SC_ApprovalStatus].[StatusID] = @StatusID
GO

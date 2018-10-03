USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakIssueStatusSelectByID]
  @LoginID NVarChar(8),
  @IssueStatusID Int 
  AS
  SELECT
    [PAK_IssueStatus].*  
  FROM [PAK_IssueStatus] 
  WHERE
  [PAK_IssueStatus].[IssueStatusID] = @IssueStatusID
GO

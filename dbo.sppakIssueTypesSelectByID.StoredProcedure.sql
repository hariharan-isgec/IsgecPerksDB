USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakIssueTypesSelectByID]
  @LoginID NVarChar(8),
  @IssueTypeID Int 
  AS
  SELECT
    [PAK_IssueTypes].*  
  FROM [PAK_IssueTypes] 
  WHERE
  [PAK_IssueTypes].[IssueTypeID] = @IssueTypeID
GO

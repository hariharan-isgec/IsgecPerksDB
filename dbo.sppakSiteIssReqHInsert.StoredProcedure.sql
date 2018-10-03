USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteIssReqHInsert]
  @ProjectID NVarChar(6),
  @IssueToName NVarChar(50),
  @RequesterRemarks NVarChar(100),
  @IssuedOn DateTime,
  @RequestedBy NVarChar(8),
  @IssuedBy NVarChar(8),
  @IssueStatusID Int,
  @IssueToCardNo NVarChar(8),
  @IssueTypeID Int,
  @RequestedOn DateTime,
  @IssueRemarks NVarChar(100),
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_IssueNo Int = null OUTPUT 
  AS
  INSERT [PAK_SiteIssueH]
  (
   [ProjectID]
  ,[IssueToName]
  ,[RequesterRemarks]
  ,[IssuedOn]
  ,[RequestedBy]
  ,[IssuedBy]
  ,[IssueStatusID]
  ,[IssueToCardNo]
  ,[IssueTypeID]
  ,[RequestedOn]
  ,[IssueRemarks]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,@IssueToName
  ,@RequesterRemarks
  ,@IssuedOn
  ,@RequestedBy
  ,@IssuedBy
  ,@IssueStatusID
  ,@IssueToCardNo
  ,@IssueTypeID
  ,@RequestedOn
  ,@IssueRemarks
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_IssueNo = Scope_Identity()
GO

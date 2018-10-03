USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakSiteIssReqHUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_IssueNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [PAK_SiteIssueH] SET 
   [ProjectID] = @ProjectID
  ,[IssueToName] = @IssueToName
  ,[RequesterRemarks] = @RequesterRemarks
  ,[IssuedOn] = @IssuedOn
  ,[RequestedBy] = @RequestedBy
  ,[IssuedBy] = @IssuedBy
  ,[IssueStatusID] = @IssueStatusID
  ,[IssueToCardNo] = @IssueToCardNo
  ,[IssueTypeID] = @IssueTypeID
  ,[RequestedOn] = @RequestedOn
  ,[IssueRemarks] = @IssueRemarks
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [IssueNo] = @Original_IssueNo
  SET @RowCount = @@RowCount
GO

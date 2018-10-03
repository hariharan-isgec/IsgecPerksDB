USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_SiteIssueH](
	[ProjectID] [nvarchar](6) NOT NULL,
	[IssueNo] [int] IDENTITY(1,1) NOT NULL,
	[IssueToCardNo] [nvarchar](8) NULL,
	[IssueToName] [nvarchar](50) NULL,
	[IssueTypeID] [int] NULL,
	[IssuedOn] [datetime] NULL,
	[IssuedBy] [nvarchar](8) NULL,
	[IssueRemarks] [nvarchar](100) NULL,
	[IssueStatusID] [int] NULL,
	[RequestedBy] [nvarchar](8) NULL,
	[RequestedOn] [datetime] NULL,
	[RequesterRemarks] [nvarchar](100) NULL,
 CONSTRAINT [PK_PAK_SiteIssueH] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[IssueNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_SiteIssueH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteIssueH_IssuedBy] FOREIGN KEY([IssuedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_SiteIssueH] CHECK CONSTRAINT [FK_PAK_SiteIssueH_IssuedBy]
GO
ALTER TABLE [dbo].[PAK_SiteIssueH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteIssueH_IssueStatusID] FOREIGN KEY([IssueStatusID])
REFERENCES [dbo].[PAK_IssueStatus] ([IssueStatusID])
GO
ALTER TABLE [dbo].[PAK_SiteIssueH] CHECK CONSTRAINT [FK_PAK_SiteIssueH_IssueStatusID]
GO
ALTER TABLE [dbo].[PAK_SiteIssueH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteIssueH_IssueToCardNo] FOREIGN KEY([IssueToCardNo])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_SiteIssueH] CHECK CONSTRAINT [FK_PAK_SiteIssueH_IssueToCardNo]
GO
ALTER TABLE [dbo].[PAK_SiteIssueH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteIssueH_IssueTypeID] FOREIGN KEY([IssueTypeID])
REFERENCES [dbo].[PAK_IssueTypes] ([IssueTypeID])
GO
ALTER TABLE [dbo].[PAK_SiteIssueH] CHECK CONSTRAINT [FK_PAK_SiteIssueH_IssueTypeID]
GO
ALTER TABLE [dbo].[PAK_SiteIssueH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteIssueH_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[PAK_SiteIssueH] CHECK CONSTRAINT [FK_PAK_SiteIssueH_ProjectID]
GO
ALTER TABLE [dbo].[PAK_SiteIssueH]  WITH CHECK ADD  CONSTRAINT [FK_PAK_SiteIssueH_RequestedBy] FOREIGN KEY([RequestedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[PAK_SiteIssueH] CHECK CONSTRAINT [FK_PAK_SiteIssueH_RequestedBy]
GO

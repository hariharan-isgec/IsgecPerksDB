USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC_Request](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[RequestRefNo] [nvarchar](50) NULL,
	[Remarks] [nvarchar](500) NULL,
	[FileName] [nvarchar](250) NULL,
	[DiskFileName] [nvarchar](250) NULL,
	[SubmittedBy] [nvarchar](8) NULL,
	[SubmittedOn] [datetime] NULL,
	[StatusID] [nvarchar](2) NULL,
	[MDApprovalRequired] [bit] NOT NULL,
	[MDApprovalOn] [datetime] NULL,
	[MDApprovalBy] [nvarchar](8) NULL,
	[MDRemarks] [nvarchar](500) NULL,
	[AuditedBy] [nvarchar](8) NULL,
	[AuditedOn] [datetime] NULL,
	[AuditorRemarks] [nvarchar](500) NULL,
	[MDFileName] [nvarchar](250) NULL,
	[MDDiskFileName] [nvarchar](250) NULL,
	[CommitteeApprovalRequired] [bit] NOT NULL,
	[AuditApprovalRequired] [bit] NOT NULL,
	[PHApprovalRequired] [bit] NOT NULL,
	[PHApprovalOn] [datetime] NULL,
	[PHApprovalBy] [nvarchar](8) NULL,
	[PHRemarks] [nvarchar](500) NULL,
	[BHApprovalRequired] [bit] NOT NULL,
	[BHApprovalOn] [datetime] NULL,
	[BHApprovalBy] [nvarchar](8) NULL,
	[BHRemarks] [nvarchar](500) NULL,
	[UnitLevelCommittee] [bit] NOT NULL,
	[DivisionLevelCommittee] [bit] NOT NULL,
	[MannualCommittee] [bit] NOT NULL,
 CONSTRAINT [PK_SC_Request] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SC_Request]  WITH CHECK ADD  CONSTRAINT [FK_SC_Request_AuditedBy] FOREIGN KEY([AuditedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SC_Request] CHECK CONSTRAINT [FK_SC_Request_AuditedBy]
GO
ALTER TABLE [dbo].[SC_Request]  WITH CHECK ADD  CONSTRAINT [FK_SC_Request_BHApprovedBy] FOREIGN KEY([BHApprovalBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SC_Request] CHECK CONSTRAINT [FK_SC_Request_BHApprovedBy]
GO
ALTER TABLE [dbo].[SC_Request]  WITH CHECK ADD  CONSTRAINT [FK_SC_Request_MDApprovalBy] FOREIGN KEY([MDApprovalBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SC_Request] CHECK CONSTRAINT [FK_SC_Request_MDApprovalBy]
GO
ALTER TABLE [dbo].[SC_Request]  WITH CHECK ADD  CONSTRAINT [FK_SC_Request_PHApprovedBy] FOREIGN KEY([PHApprovalBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SC_Request] CHECK CONSTRAINT [FK_SC_Request_PHApprovedBy]
GO
ALTER TABLE [dbo].[SC_Request]  WITH CHECK ADD  CONSTRAINT [FK_SC_Request_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[SC_Status] ([StatusID])
GO
ALTER TABLE [dbo].[SC_Request] CHECK CONSTRAINT [FK_SC_Request_StatusID]
GO
ALTER TABLE [dbo].[SC_Request]  WITH CHECK ADD  CONSTRAINT [FK_SC_Request_SubmittedBy] FOREIGN KEY([SubmittedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SC_Request] CHECK CONSTRAINT [FK_SC_Request_SubmittedBy]
GO
ALTER TABLE [dbo].[SC_Request] ADD  CONSTRAINT [DF_SC_Request_MDApprovalRequired]  DEFAULT ((0)) FOR [MDApprovalRequired]
GO
ALTER TABLE [dbo].[SC_Request] ADD  CONSTRAINT [DF_SC_Request_MDApprovalRequired1]  DEFAULT ((0)) FOR [CommitteeApprovalRequired]
GO
ALTER TABLE [dbo].[SC_Request] ADD  CONSTRAINT [DF_SC_Request_CommitteeApprovalRequired1]  DEFAULT ((0)) FOR [AuditApprovalRequired]
GO
ALTER TABLE [dbo].[SC_Request] ADD  CONSTRAINT [DF_SC_Request_MDApprovalRequired1_1]  DEFAULT ((0)) FOR [PHApprovalRequired]
GO
ALTER TABLE [dbo].[SC_Request] ADD  CONSTRAINT [DF_SC_Request_PHApprovalRequired1]  DEFAULT ((0)) FOR [BHApprovalRequired]
GO
ALTER TABLE [dbo].[SC_Request] ADD  CONSTRAINT [DF_SC_Request_CommitteeApprovalRequired1_1]  DEFAULT ((0)) FOR [UnitLevelCommittee]
GO
ALTER TABLE [dbo].[SC_Request] ADD  CONSTRAINT [DF_SC_Request_DivisionLevelCommittee]  DEFAULT ((0)) FOR [DivisionLevelCommittee]
GO
ALTER TABLE [dbo].[SC_Request] ADD  CONSTRAINT [DF_SC_Request_MannualCommittee]  DEFAULT ((0)) FOR [MannualCommittee]
GO

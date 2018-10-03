USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATN_ApproverChangeRequest](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](8) NULL,
	[VerificationRequired] [bit] NOT NULL,
	[VerifierID] [nvarchar](8) NULL,
	[ApprovalRequired] [bit] NOT NULL,
	[ApproverID] [nvarchar](8) NULL,
	[Requested] [bit] NOT NULL,
	[RequestedOn] [datetime] NULL,
	[Executed] [bit] NOT NULL,
	[ExecutedOn] [datetime] NULL,
 CONSTRAINT [PK_ATN_ApproverChangeRequest] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ATN_ApproverChangeRequest] ON [dbo].[ATN_ApproverChangeRequest] 
(
	[Executed] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ATN_ApproverChangeRequest_1] ON [dbo].[ATN_ApproverChangeRequest] 
(
	[RequestedOn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATN_ApproverChangeRequest]  WITH CHECK ADD  CONSTRAINT [FK_ATN_ApproverChangeRequest_HRM_Employees] FOREIGN KEY([UserID])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_ApproverChangeRequest] CHECK CONSTRAINT [FK_ATN_ApproverChangeRequest_HRM_Employees]
GO
ALTER TABLE [dbo].[ATN_ApproverChangeRequest]  WITH CHECK ADD  CONSTRAINT [FK_ATN_ApproverChangeRequest_HRM_Employees1] FOREIGN KEY([VerifierID])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_ApproverChangeRequest] CHECK CONSTRAINT [FK_ATN_ApproverChangeRequest_HRM_Employees1]
GO
ALTER TABLE [dbo].[ATN_ApproverChangeRequest]  WITH CHECK ADD  CONSTRAINT [FK_ATN_ApproverChangeRequest_HRM_Employees2] FOREIGN KEY([ApproverID])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_ApproverChangeRequest] CHECK CONSTRAINT [FK_ATN_ApproverChangeRequest_HRM_Employees2]
GO
ALTER TABLE [dbo].[ATN_ApproverChangeRequest] ADD  CONSTRAINT [DF_ATN_ApproverChangeRequest_VerificationRequired]  DEFAULT ((0)) FOR [VerificationRequired]
GO
ALTER TABLE [dbo].[ATN_ApproverChangeRequest] ADD  CONSTRAINT [DF_ATN_ApproverChangeRequest_ApprovalRequired]  DEFAULT ((0)) FOR [ApprovalRequired]
GO
ALTER TABLE [dbo].[ATN_ApproverChangeRequest] ADD  CONSTRAINT [DF_ATN_ApproverChangeRequest_Requested]  DEFAULT ((0)) FOR [Requested]
GO
ALTER TABLE [dbo].[ATN_ApproverChangeRequest] ADD  CONSTRAINT [DF_ATN_ApproverChangeRequest_Executed]  DEFAULT ((0)) FOR [Executed]
GO

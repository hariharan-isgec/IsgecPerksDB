USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATN_ApplHeader](
	[LeaveApplID] [int] IDENTITY(1,1) NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[Remarks] [nvarchar](250) NULL,
	[FinYear] [nvarchar](4) NOT NULL,
	[ApplStatusID] [int] NOT NULL,
	[AppliedOn] [datetime] NULL,
	[VerificationOn] [datetime] NULL,
	[ApprovalOn] [datetime] NULL,
	[SanctionOn] [datetime] NULL,
	[PostedOn] [datetime] NULL,
	[VerificationRequired] [bit] NOT NULL,
	[ApprovalRequired] [bit] NOT NULL,
	[SanctionRequired] [bit] NOT NULL,
	[VerifiedBy] [nvarchar](8) NULL,
	[ApprovedBy] [nvarchar](8) NULL,
	[SanctionedBy] [nvarchar](8) NULL,
	[PostedBy] [nvarchar](8) NULL,
	[VerificationRemark] [nvarchar](100) NULL,
	[ApprovalRemark] [nvarchar](100) NULL,
	[SanctionRemark] [nvarchar](100) NULL,
	[PostingRemark] [nvarchar](100) NULL,
	[AdvanceApplication] [bit] NOT NULL,
	[ExecutionState] [int] NULL,
	[Approved] [nvarchar](50) NULL,
	[Rejected] [nvarchar](50) NULL,
	[Application] [nvarchar](50) NULL,
 CONSTRAINT [PK_ATN_ApplHeader] PRIMARY KEY CLUSTERED 
(
	[LeaveApplID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ATN_ApplHeader] ON [dbo].[ATN_ApplHeader] 
(
	[Application] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ATN_ApplHeader_1] ON [dbo].[ATN_ApplHeader] 
(
	[Approved] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ATN_ApplHeader_2] ON [dbo].[ATN_ApplHeader] 
(
	[Rejected] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATN_ApplHeader]  WITH CHECK ADD  CONSTRAINT [FK_ATN_ApplHeader_ATN_ApplicationStatus] FOREIGN KEY([ApplStatusID])
REFERENCES [dbo].[ATN_ApplicationStatus] ([ApplStatusID])
GO
ALTER TABLE [dbo].[ATN_ApplHeader] CHECK CONSTRAINT [FK_ATN_ApplHeader_ATN_ApplicationStatus]
GO
ALTER TABLE [dbo].[ATN_ApplHeader]  WITH CHECK ADD  CONSTRAINT [FK_ATN_ApplHeader_ATN_ExecutionStates] FOREIGN KEY([ExecutionState])
REFERENCES [dbo].[ATN_ExecutionStates] ([ExecutionState])
GO
ALTER TABLE [dbo].[ATN_ApplHeader] CHECK CONSTRAINT [FK_ATN_ApplHeader_ATN_ExecutionStates]
GO
ALTER TABLE [dbo].[ATN_ApplHeader]  WITH CHECK ADD  CONSTRAINT [FK_ATN_ApplHeader_HRM_Employees] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_ApplHeader] CHECK CONSTRAINT [FK_ATN_ApplHeader_HRM_Employees]
GO
ALTER TABLE [dbo].[ATN_ApplHeader]  WITH CHECK ADD  CONSTRAINT [FK_ATN_ApplHeader_HRM_Employees1] FOREIGN KEY([VerifiedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_ApplHeader] CHECK CONSTRAINT [FK_ATN_ApplHeader_HRM_Employees1]
GO
ALTER TABLE [dbo].[ATN_ApplHeader]  WITH CHECK ADD  CONSTRAINT [FK_ATN_ApplHeader_HRM_Employees2] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_ApplHeader] CHECK CONSTRAINT [FK_ATN_ApplHeader_HRM_Employees2]
GO
ALTER TABLE [dbo].[ATN_ApplHeader]  WITH CHECK ADD  CONSTRAINT [FK_ATN_ApplHeader_HRM_Employees3] FOREIGN KEY([SanctionedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_ApplHeader] CHECK CONSTRAINT [FK_ATN_ApplHeader_HRM_Employees3]
GO
ALTER TABLE [dbo].[ATN_ApplHeader]  WITH CHECK ADD  CONSTRAINT [FK_ATN_ApplHeader_HRM_Employees4] FOREIGN KEY([PostedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_ApplHeader] CHECK CONSTRAINT [FK_ATN_ApplHeader_HRM_Employees4]
GO
ALTER TABLE [dbo].[ATN_ApplHeader] ADD  CONSTRAINT [DF_ATN_ApplHeader_ApplStatusID]  DEFAULT ((1)) FOR [ApplStatusID]
GO
ALTER TABLE [dbo].[ATN_ApplHeader] ADD  CONSTRAINT [DF_ATN_ApplHeader_VerificationRequired]  DEFAULT ((0)) FOR [VerificationRequired]
GO
ALTER TABLE [dbo].[ATN_ApplHeader] ADD  CONSTRAINT [DF_ATN_ApplHeader_ApprovalRequired]  DEFAULT ((0)) FOR [ApprovalRequired]
GO
ALTER TABLE [dbo].[ATN_ApplHeader] ADD  CONSTRAINT [DF_ATN_ApplHeader_SanctionRequired]  DEFAULT ((0)) FOR [SanctionRequired]
GO
ALTER TABLE [dbo].[ATN_ApplHeader] ADD  CONSTRAINT [DF_ATN_ApplHeader_SanctionRequired1]  DEFAULT ((0)) FOR [AdvanceApplication]
GO

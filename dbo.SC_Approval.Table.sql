USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC_Approval](
	[RequestID] [int] NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[ApproverID] [nvarchar](8) NULL,
	[StatusID] [nvarchar](2) NULL,
	[ApproverRemarks] [nvarchar](500) NULL,
	[ApprovedOn] [datetime] NULL,
 CONSTRAINT [PK_SC_Approval] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SC_Approval]  WITH CHECK ADD  CONSTRAINT [FK_SC_Approval_ApproverID] FOREIGN KEY([ApproverID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[SC_Approval] CHECK CONSTRAINT [FK_SC_Approval_ApproverID]
GO
ALTER TABLE [dbo].[SC_Approval]  WITH CHECK ADD  CONSTRAINT [FK_SC_Approval_RequestID] FOREIGN KEY([RequestID])
REFERENCES [dbo].[SC_Request] ([RequestID])
GO
ALTER TABLE [dbo].[SC_Approval] CHECK CONSTRAINT [FK_SC_Approval_RequestID]
GO
ALTER TABLE [dbo].[SC_Approval]  WITH CHECK ADD  CONSTRAINT [FK_SC_Approval_StatusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[SC_ApprovalStatus] ([StatusID])
GO
ALTER TABLE [dbo].[SC_Approval] CHECK CONSTRAINT [FK_SC_Approval_StatusID]
GO

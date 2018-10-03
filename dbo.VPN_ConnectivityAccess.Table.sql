USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VPN_ConnectivityAccess](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[C_OfficeID] [int] NULL,
	[Remarks] [nvarchar](500) NULL,
	[RequestedBy] [nvarchar](8) NULL,
	[RequestedOn] [datetime] NULL,
	[Configured] [bit] NOT NULL,
	[VPNIP] [nvarchar](15) NULL,
	[VPNPassword] [nvarchar](50) NULL,
	[NetworkIP] [nvarchar](15) NULL,
	[ConfiguredBy] [nvarchar](8) NULL,
	[ConfiguredOn] [datetime] NULL,
	[ConfigurationRemarks] [nvarchar](500) NULL,
	[RemoveAccess] [bit] NOT NULL,
	[RemoveRequestedBy] [nvarchar](8) NULL,
	[RemoveRequestedOn] [datetime] NULL,
	[RemoveRemarks] [nvarchar](500) NULL,
	[Removed] [bit] NOT NULL,
	[RemovedBy] [nvarchar](8) NULL,
	[RemovedOn] [datetime] NULL,
	[RemovedRemarks] [nvarchar](500) NULL,
	[BaaNPW] [nvarchar](50) NULL,
	[PLMpw] [nvarchar](50) NULL,
	[EMailPW] [nvarchar](50) NULL,
	[IsLaptop] [bit] NOT NULL,
	[ConfidentialData] [bit] NOT NULL,
	[SensitiveData] [bit] NOT NULL,
	[InternetAccess] [bit] NOT NULL,
	[ExternalEMail] [bit] NOT NULL,
 CONSTRAINT [PK_VPN_ConnectivityAccess] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess]  WITH CHECK ADD  CONSTRAINT [FK_VPN_CardNo] FOREIGN KEY([CardNo])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess] CHECK CONSTRAINT [FK_VPN_CardNo]
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess]  WITH CHECK ADD  CONSTRAINT [FK_VPN_ConfiguredBy] FOREIGN KEY([ConfiguredBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess] CHECK CONSTRAINT [FK_VPN_ConfiguredBy]
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess]  WITH CHECK ADD  CONSTRAINT [FK_VPN_OfficeID] FOREIGN KEY([C_OfficeID])
REFERENCES [dbo].[HRM_Offices] ([OfficeID])
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess] CHECK CONSTRAINT [FK_VPN_OfficeID]
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess]  WITH CHECK ADD  CONSTRAINT [FK_VPN_RemovalRequestedBy] FOREIGN KEY([RemoveRequestedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess] CHECK CONSTRAINT [FK_VPN_RemovalRequestedBy]
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess]  WITH CHECK ADD  CONSTRAINT [FK_VPN_RemovedBy] FOREIGN KEY([RemovedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess] CHECK CONSTRAINT [FK_VPN_RemovedBy]
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess]  WITH CHECK ADD  CONSTRAINT [FK_VPN_RequestedBy] FOREIGN KEY([RequestedBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess] CHECK CONSTRAINT [FK_VPN_RequestedBy]
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess] ADD  CONSTRAINT [DF_VPN_ConnectivityAccess_Configured]  DEFAULT ((0)) FOR [Configured]
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess] ADD  CONSTRAINT [DF_VPN_ConnectivityAccess_RemoveAccess]  DEFAULT ((0)) FOR [RemoveAccess]
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess] ADD  CONSTRAINT [DF_VPN_ConnectivityAccess_Removed]  DEFAULT ((0)) FOR [Removed]
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess] ADD  CONSTRAINT [DF_VPN_ConnectivityAccess_IsLaptop_1]  DEFAULT ((0)) FOR [IsLaptop]
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess] ADD  CONSTRAINT [DF_VPN_ConnectivityAccess_ConfidentialData_1]  DEFAULT ((0)) FOR [ConfidentialData]
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess] ADD  CONSTRAINT [DF_VPN_ConnectivityAccess_SensitiveData_1]  DEFAULT ((0)) FOR [SensitiveData]
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess] ADD  CONSTRAINT [DF_VPN_ConnectivityAccess_InternetAccess_1]  DEFAULT ((0)) FOR [InternetAccess]
GO
ALTER TABLE [dbo].[VPN_ConnectivityAccess] ADD  CONSTRAINT [DF_VPN_ConnectivityAccess_ExternalEMail_1]  DEFAULT ((0)) FOR [ExternalEMail]
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAPP_RegisteredDevices](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[DeviceID] [nvarchar](50) NULL,
	[UserID] [nvarchar](8) NULL,
	[UserName] [nvarchar](50) NULL,
	[MobileNo] [nvarchar](15) NULL,
	[RequestedOn] [datetime] NULL,
	[IsRegistered] [bit] NOT NULL,
	[RegisteredOn] [datetime] NULL,
	[RegisteredBy] [nvarchar](8) NULL,
	[IsExpired] [bit] NOT NULL,
	[ExpiredOn] [datetime] NULL,
 CONSTRAINT [PK_MAPP_RegisteredDevices] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MAPP_RegisteredDevices]  WITH CHECK ADD  CONSTRAINT [FK_MAPP_RegisteredDevices_RegisteredBy] FOREIGN KEY([RegisteredBy])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[MAPP_RegisteredDevices] CHECK CONSTRAINT [FK_MAPP_RegisteredDevices_RegisteredBy]
GO
ALTER TABLE [dbo].[MAPP_RegisteredDevices]  WITH CHECK ADD  CONSTRAINT [FK_MAPP_RegisteredDevices_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[MAPP_RegisteredDevices] CHECK CONSTRAINT [FK_MAPP_RegisteredDevices_UserID]
GO
ALTER TABLE [dbo].[MAPP_RegisteredDevices] ADD  CONSTRAINT [DF_MAPP_RegisteredDevices_IsRegistered]  DEFAULT ((0)) FOR [IsRegistered]
GO
ALTER TABLE [dbo].[MAPP_RegisteredDevices] ADD  CONSTRAINT [DF_MAPP_RegisteredDevices_IsExpired]  DEFAULT ((0)) FOR [IsExpired]
GO

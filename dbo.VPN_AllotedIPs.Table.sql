USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VPN_AllotedIPs](
	[VLanIP] [nvarchar](15) NOT NULL,
	[VpnIP] [nvarchar](15) NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[AllotedIP] [nvarchar](15) NOT NULL,
	[AllotedPW] [nvarchar](50) NULL,
 CONSTRAINT [PK_VPN_AllotedIPs] PRIMARY KEY CLUSTERED 
(
	[VLanIP] ASC,
	[VpnIP] ASC,
	[CardNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VPN_AllotedIPs]  WITH CHECK ADD  CONSTRAINT [FK_VPN_AllotedIPs_CardNo] FOREIGN KEY([CardNo])
REFERENCES [dbo].[aspnet_users] ([LoginID])
GO
ALTER TABLE [dbo].[VPN_AllotedIPs] CHECK CONSTRAINT [FK_VPN_AllotedIPs_CardNo]
GO
ALTER TABLE [dbo].[VPN_AllotedIPs]  WITH CHECK ADD  CONSTRAINT [FK_VPN_AllotedIPs_VLanIP] FOREIGN KEY([VLanIP])
REFERENCES [dbo].[VPN_VLans] ([VLanIP])
GO
ALTER TABLE [dbo].[VPN_AllotedIPs] CHECK CONSTRAINT [FK_VPN_AllotedIPs_VLanIP]
GO
ALTER TABLE [dbo].[VPN_AllotedIPs]  WITH CHECK ADD  CONSTRAINT [FK_VPN_AllotedIPs_VpnIP] FOREIGN KEY([VLanIP], [VpnIP])
REFERENCES [dbo].[VPN_VLanVPNs] ([VLanIP], [VPNIP])
GO
ALTER TABLE [dbo].[VPN_AllotedIPs] CHECK CONSTRAINT [FK_VPN_AllotedIPs_VpnIP]
GO
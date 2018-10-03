USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VPN_CON_ACCESS_BKP](
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
	[ExternalEMail] [bit] NOT NULL
) ON [PRIMARY]
GO

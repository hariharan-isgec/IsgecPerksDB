USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYS_VRSessionByEmployee_Backup](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[VRSessionID] [int] NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[MaintainGrid] [bit] NOT NULL,
	[InsertForm] [bit] NOT NULL,
	[UpdateForm] [bit] NOT NULL,
	[DisplayGrid] [bit] NOT NULL,
	[DisplayForm] [bit] NOT NULL,
	[DeleteOption] [bit] NOT NULL
) ON [PRIMARY]
GO

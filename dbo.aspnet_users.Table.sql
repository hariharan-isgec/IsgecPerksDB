USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
	[UserFullName] [nvarchar](50) NOT NULL,
	[LocationID] [int] NULL,
	[ExtnNo] [nvarchar](50) NULL,
	[MobileNo] [nvarchar](50) NULL,
	[EMailID] [nvarchar](50) NULL,
	[C_DateOfJoining] [datetime] NULL,
	[C_CompanyID] [nvarchar](6) NULL,
	[C_DivisionID] [nvarchar](6) NULL,
	[C_OfficeID] [int] NULL,
	[C_DepartmentID] [nvarchar](6) NULL,
	[C_ProjectSiteID] [nvarchar](6) NULL,
	[C_DesignationID] [int] NULL,
	[ActiveState] [bit] NULL,
	[VPN_IP] [nvarchar](15) NULL,
	[NetworkIP] [nvarchar](15) NULL,
	[VPN_Password] [nvarchar](50) NULL,
	[VPN_Expires] [datetime] NULL,
	[LoginID] [nvarchar](8) NULL,
	[Contractual] [bit] NOT NULL,
	[MD5Password] [nvarchar](50) NULL,
	[wp_user] [nvarchar](50) NULL,
	[pw] [nvarchar](50) NULL,
 CONSTRAINT [PK__aspnet_Users__03317E3D] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_aspnet_Users] UNIQUE NONCLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_users] 
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_users] 
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_users]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Us__Appli__0425A276] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_users] CHECK CONSTRAINT [FK__aspnet_Us__Appli__0425A276]
GO
ALTER TABLE [dbo].[aspnet_users] ADD  CONSTRAINT [DF__aspnet_Us__UserI__0519C6AF]  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[aspnet_users] ADD  CONSTRAINT [DF__aspnet_Us__Mobil__060DEAE8]  DEFAULT (NULL) FOR [MobileAlias]
GO
ALTER TABLE [dbo].[aspnet_users] ADD  CONSTRAINT [DF__aspnet_Us__IsAno__07020F21]  DEFAULT ((0)) FOR [IsAnonymous]
GO
ALTER TABLE [dbo].[aspnet_users] ADD  CONSTRAINT [DF_aspnet_Users_UserFullName_1]  DEFAULT ('') FOR [UserFullName]
GO
ALTER TABLE [dbo].[aspnet_users] ADD  CONSTRAINT [DF_aspnet_Users_C_DateOfJoining]  DEFAULT ('') FOR [C_DateOfJoining]
GO
ALTER TABLE [dbo].[aspnet_users] ADD  CONSTRAINT [DF_aspnet_Users_ActiveState]  DEFAULT ((1)) FOR [ActiveState]
GO
ALTER TABLE [dbo].[aspnet_users] ADD  CONSTRAINT [DF_aspnet_Users_Contractual_1]  DEFAULT ((0)) FOR [Contractual]
GO

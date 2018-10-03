USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users_Backup](
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
	[VPN_Password] [nvarchar](50) NULL,
	[VPN_Expires] [datetime] NULL,
	[LoginID] [nvarchar](8) NULL,
	[Contractual] [bit] NOT NULL,
	[MD5Password] [nvarchar](50) NULL
) ON [PRIMARY]
GO

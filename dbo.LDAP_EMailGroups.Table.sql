USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LDAP_EMailGroups](
	[EMailGroupID] [int] NOT NULL,
	[EMailGroupName] [nvarchar](50) NOT NULL,
	[EMailGroupEmailID] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_LDAP_EMailGroups] PRIMARY KEY CLUSTERED 
(
	[EMailGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_EMailGroupName] ON [dbo].[LDAP_EMailGroups] 
(
	[EMailGroupName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
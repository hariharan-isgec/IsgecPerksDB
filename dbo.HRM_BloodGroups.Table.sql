USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_BloodGroups](
	[BloodGroupID] [nvarchar](5) NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_HRM_BloodGroups] PRIMARY KEY CLUSTERED 
(
	[BloodGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_BloodGroups] ADD  CONSTRAINT [DF_HRM_BloodGroups_Description]  DEFAULT ('') FOR [Description]
GO

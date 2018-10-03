USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DCM_Projectss](
	[ProjectID] [nvarchar](6) NOT NULL,
	[Description] [nvarchar](60) NOT NULL,
	[ProjectCode]  AS ([ProjectID]) PERSISTED NOT NULL,
 CONSTRAINT [PK_DCM_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DCM_Projectss] ADD  CONSTRAINT [DF_DCM_Projects_Description]  DEFAULT ('') FOR [Description]
GO

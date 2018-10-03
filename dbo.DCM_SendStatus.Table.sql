USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DCM_SendStatus](
	[SendStatusID] [nvarchar](2) NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_DCM_SendStatus] PRIMARY KEY CLUSTERED 
(
	[SendStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DCM_SendStatus] ADD  CONSTRAINT [DF_DCM_SendStatus_Description]  DEFAULT ('') FOR [Description]
GO
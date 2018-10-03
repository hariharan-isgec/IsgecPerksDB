USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_Designations](
	[DesignationID] [int] IDENTITY(17,1) NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
	[ShortName] [nvarchar](30) NOT NULL,
	[Sequence] [int] NOT NULL,
 CONSTRAINT [PK_HRM_Designations] PRIMARY KEY CLUSTERED 
(
	[DesignationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_Designations] ADD  CONSTRAINT [DF_HRM_Designations_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[HRM_Designations] ADD  CONSTRAINT [DF_HRM_Designations_ShortName]  DEFAULT ('') FOR [ShortName]
GO
ALTER TABLE [dbo].[HRM_Designations] ADD  CONSTRAINT [DF_HRM_Designations_Sequence]  DEFAULT ((0)) FOR [Sequence]
GO

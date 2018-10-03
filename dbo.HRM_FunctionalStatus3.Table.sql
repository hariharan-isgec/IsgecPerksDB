USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_FunctionalStatus3](
	[FunctionalStatusID3] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HRM_FunctionalStatus3] PRIMARY KEY CLUSTERED 
(
	[FunctionalStatusID3] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_FunctionalStatus3] ADD  CONSTRAINT [DF_HRM_FunctionalStatus3_Description]  DEFAULT ('') FOR [Description]
GO

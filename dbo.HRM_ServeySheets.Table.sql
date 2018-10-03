USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_ServeySheets](
	[ServeySheetID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[ServeyID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_HRM_ServeySheets] PRIMARY KEY CLUSTERED 
(
	[ServeySheetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HRM_ServeySheets]  WITH CHECK ADD  CONSTRAINT [FK_HRM_ServeySheets_HRM_Serveys] FOREIGN KEY([ServeyID])
REFERENCES [dbo].[HRM_Serveys] ([ServeyID])
GO
ALTER TABLE [dbo].[HRM_ServeySheets] CHECK CONSTRAINT [FK_HRM_ServeySheets_HRM_Serveys]
GO
ALTER TABLE [dbo].[HRM_ServeySheets] ADD  CONSTRAINT [DF_HRM_ServeySheets_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO

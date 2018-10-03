USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRT_Config](
	[GreetingID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[TillDate] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
	[EnableDear] [bit] NOT NULL,
	[DearText] [nvarchar](100) NULL,
	[EnableGreetingText] [bit] NOT NULL,
	[GreetingText] [nvarchar](500) NULL,
	[EnableImage] [bit] NOT NULL,
	[ImageID] [int] NULL,
	[UseDefaultImageSize] [bit] NOT NULL,
	[ImageHeight] [int] NULL,
	[ImageWidth] [int] NULL,
	[EnableBottomText] [bit] NOT NULL,
	[BottomText] [nvarchar](500) NULL,
	[EnableSignature] [bit] NOT NULL,
	[IncludeDesignation] [bit] NOT NULL,
	[IncludeDepartment] [bit] NOT NULL,
	[IncludeDirectNo] [bit] NOT NULL,
	[IncludeCellNo] [bit] NOT NULL,
 CONSTRAINT [PK_GRT_Config] PRIMARY KEY CLUSTERED 
(
	[GreetingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GRT_Config]  WITH CHECK ADD  CONSTRAINT [FK_GRT_Config_GRT_Images] FOREIGN KEY([ImageID])
REFERENCES [dbo].[GRT_Images] ([ImageID])
GO
ALTER TABLE [dbo].[GRT_Config] CHECK CONSTRAINT [FK_GRT_Config_GRT_Images]
GO
ALTER TABLE [dbo].[GRT_Config] ADD  CONSTRAINT [DF_GRT_Config_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[GRT_Config] ADD  CONSTRAINT [DF_GRT_Config_EnableDear]  DEFAULT ((1)) FOR [EnableDear]
GO
ALTER TABLE [dbo].[GRT_Config] ADD  CONSTRAINT [DF_GRT_Config_EnableGreetingText]  DEFAULT ((1)) FOR [EnableGreetingText]
GO
ALTER TABLE [dbo].[GRT_Config] ADD  CONSTRAINT [DF_GRT_Config_EnableImage]  DEFAULT ((1)) FOR [EnableImage]
GO
ALTER TABLE [dbo].[GRT_Config] ADD  CONSTRAINT [DF_GRT_Config_UseDefaultImageSize]  DEFAULT ((1)) FOR [UseDefaultImageSize]
GO
ALTER TABLE [dbo].[GRT_Config] ADD  CONSTRAINT [DF_GRT_Config_EnableBottomText]  DEFAULT ((0)) FOR [EnableBottomText]
GO
ALTER TABLE [dbo].[GRT_Config] ADD  CONSTRAINT [DF_GRT_Config_EnableSignature]  DEFAULT ((1)) FOR [EnableSignature]
GO
ALTER TABLE [dbo].[GRT_Config] ADD  CONSTRAINT [DF_GRT_Config_IncludeDesignation]  DEFAULT ((1)) FOR [IncludeDesignation]
GO
ALTER TABLE [dbo].[GRT_Config] ADD  CONSTRAINT [DF_GRT_Config_IncludeDepartment]  DEFAULT ((1)) FOR [IncludeDepartment]
GO
ALTER TABLE [dbo].[GRT_Config] ADD  CONSTRAINT [DF_GRT_Config_IncludeDirectNo]  DEFAULT ((1)) FOR [IncludeDirectNo]
GO
ALTER TABLE [dbo].[GRT_Config] ADD  CONSTRAINT [DF_GRT_Config_IncludeCellNo]  DEFAULT ((1)) FOR [IncludeCellNo]
GO

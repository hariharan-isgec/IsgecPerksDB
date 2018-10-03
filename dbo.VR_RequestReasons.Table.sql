USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VR_RequestReasons](
	[ReasonID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Transporter] [bit] NOT NULL,
	[ISGEC] [bit] NOT NULL,
	[Supplier] [bit] NOT NULL,
	[Other] [bit] NOT NULL,
 CONSTRAINT [PK_VR_RequestReasons] PRIMARY KEY CLUSTERED 
(
	[ReasonID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VR_RequestReasons] ADD  CONSTRAINT [DF_VR_RequestReasons_Transporter]  DEFAULT ((0)) FOR [Transporter]
GO
ALTER TABLE [dbo].[VR_RequestReasons] ADD  CONSTRAINT [DF_VR_RequestReasons_ISGEC]  DEFAULT ((0)) FOR [ISGEC]
GO
ALTER TABLE [dbo].[VR_RequestReasons] ADD  CONSTRAINT [DF_VR_RequestReasons_Supplier]  DEFAULT ((0)) FOR [Supplier]
GO
ALTER TABLE [dbo].[VR_RequestReasons] ADD  CONSTRAINT [DF_VR_RequestReasons_Other]  DEFAULT ((0)) FOR [Other]
GO

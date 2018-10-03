USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_D_Driver](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[DriverAmount] [decimal](10, 2) NULL,
	[FromDate] [datetime] NOT NULL,
	[TillDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TA_D_Driver] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_D_Driver]  WITH CHECK ADD  CONSTRAINT [FK_TA_D_Driver_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[TA_Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[TA_D_Driver] CHECK CONSTRAINT [FK_TA_D_Driver_CategoryID]
GO
ALTER TABLE [dbo].[TA_D_Driver] ADD  CONSTRAINT [DF_TA_D_Driver_Active]  DEFAULT ((0)) FOR [Active]
GO

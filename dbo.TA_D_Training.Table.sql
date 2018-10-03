USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_D_Training](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[Bord_Lodg_DA_Percent] [decimal](10, 2) NULL,
	[Lodg_DA_Percent] [decimal](10, 2) NULL,
	[FromDate] [datetime] NOT NULL,
	[TillDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TA_D_Training] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_D_Training] ADD  CONSTRAINT [DF_TA_D_Training_Active]  DEFAULT ((0)) FOR [Active]
GO

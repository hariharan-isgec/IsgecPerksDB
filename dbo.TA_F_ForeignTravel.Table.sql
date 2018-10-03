USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_F_ForeignTravel](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[Bord_Lodg_DA_Percent] [decimal](10, 2) NULL,
	[Lodg_DA_Percent] [decimal](10, 2) NULL,
	[DA_Adjested_LC_Percent] [decimal](10, 2) NULL,
	[FromDate] [datetime] NOT NULL,
	[TillDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TA_F_ForeignTravel] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_F_ForeignTravel] ADD  CONSTRAINT [DF_TA_F_ForeignTravel_Active]  DEFAULT ((0)) FOR [Active]
GO

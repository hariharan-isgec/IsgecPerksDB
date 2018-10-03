USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRK_SiteAllowanceEntitlement](
	[SerialNo] [int] NOT NULL,
	[TACategoryID] [int] NULL,
	[Entitlement] [decimal](18, 2) NULL,
	[FromDate] [datetime] NULL,
	[TillDate] [datetime] NULL,
 CONSTRAINT [PK_PRK_SiteAllowanceEntitlement] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRK_SiteAllowanceEntitlement]  WITH CHECK ADD  CONSTRAINT [FK_PRK_SiteAllowanceEntitlement_TACategoryID] FOREIGN KEY([TACategoryID])
REFERENCES [dbo].[TA_Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[PRK_SiteAllowanceEntitlement] CHECK CONSTRAINT [FK_PRK_SiteAllowanceEntitlement_TACategoryID]
GO

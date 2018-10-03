USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMT_CostCenters](
	[CostCenterID] [nvarchar](6) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[BaaNCompany] [nvarchar](10) NULL,
	[BaaNLedger] [nvarchar](20) NULL,
	[Location] [nvarchar](50) NULL,
 CONSTRAINT [PK_SPMT_CostCenters] PRIMARY KEY CLUSTERED 
(
	[CostCenterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

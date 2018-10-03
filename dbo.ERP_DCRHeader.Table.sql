USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ERP_DCRHeader](
	[DCRNo] [nvarchar](10) NOT NULL,
	[DCRDate] [nvarchar](10) NULL,
	[DCRDescription] [nvarchar](100) NULL,
	[CreatedBy] [nvarchar](8) NULL,
	[CreatedName] [nvarchar](50) NULL,
	[CreatedEMail] [nvarchar](50) NULL,
	[ProjectID] [nvarchar](6) NULL,
	[ProjectDescription] [nvarchar](100) NULL,
 CONSTRAINT [PK_ERP_DCRHeader] PRIMARY KEY CLUSTERED 
(
	[DCRNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VR_BusinessPartner](
	[BPID] [nvarchar](9) NOT NULL,
	[BPName] [nvarchar](100) NOT NULL,
	[Address1Line] [nvarchar](100) NULL,
	[Address2Line] [nvarchar](100) NULL,
	[City] [nvarchar](50) NOT NULL,
	[EMailID] [nvarchar](200) NULL,
	[FinanceCompany] [nvarchar](10) NULL,
	[LogisticCompany] [nvarchar](10) NULL,
 CONSTRAINT [PK_VR_BusinessPartner] PRIMARY KEY CLUSTERED 
(
	[BPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

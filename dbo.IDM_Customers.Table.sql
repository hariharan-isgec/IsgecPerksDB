USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IDM_Customers](
	[CustomerID] [nvarchar](6) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[ContactPerson] [nvarchar](50) NULL,
	[EmailID] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](20) NULL,
	[Address1] [nvarchar](60) NULL,
	[Address2] [nvarchar](60) NULL,
	[Address3] [nvarchar](60) NULL,
	[Address4] [nvarchar](60) NULL,
	[ToEMailID] [nvarchar](250) NULL,
	[CCEmailID] [nvarchar](250) NULL,
 CONSTRAINT [PK_IDM_Customers_1] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IDM_Customers] ADD  CONSTRAINT [DF_IDM_Customers_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[IDM_Customers] ADD  CONSTRAINT [DF_IDM_Customers_Address1_1]  DEFAULT ('') FOR [Address1]
GO
ALTER TABLE [dbo].[IDM_Customers] ADD  CONSTRAINT [DF_IDM_Customers_Address2_1]  DEFAULT ('') FOR [Address2]
GO
ALTER TABLE [dbo].[IDM_Customers] ADD  CONSTRAINT [DF_IDM_Customers_Address3_1]  DEFAULT ('') FOR [Address3]
GO
ALTER TABLE [dbo].[IDM_Customers] ADD  CONSTRAINT [DF_IDM_Customers_Address4_1]  DEFAULT ('') FOR [Address4]
GO

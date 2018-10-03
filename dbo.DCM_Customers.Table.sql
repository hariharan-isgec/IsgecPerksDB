USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DCM_Customers](
	[ProjectID] [nvarchar](6) NOT NULL,
	[CustomerID] [nvarchar](6) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[Address3] [nvarchar](50) NULL,
	[Address4] [nvarchar](50) NULL,
	[ToEMailID] [nvarchar](250) NULL,
	[CCEmailID] [nvarchar](1000) NULL,
 CONSTRAINT [PK_DCM_Customers] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DCM_Customers]  WITH CHECK ADD  CONSTRAINT [FK_DCM_Customers_DCM_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[DCM_Projectss] ([ProjectID])
GO
ALTER TABLE [dbo].[DCM_Customers] CHECK CONSTRAINT [FK_DCM_Customers_DCM_Projects]
GO
ALTER TABLE [dbo].[DCM_Customers] ADD  CONSTRAINT [DF_DCM_Customers_Description]  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[DCM_Customers] ADD  CONSTRAINT [DF_DCM_Customers_Address1]  DEFAULT ('') FOR [Address1]
GO
ALTER TABLE [dbo].[DCM_Customers] ADD  CONSTRAINT [DF_DCM_Customers_Address2]  DEFAULT ('') FOR [Address2]
GO
ALTER TABLE [dbo].[DCM_Customers] ADD  CONSTRAINT [DF_DCM_Customers_Address3]  DEFAULT ('') FOR [Address3]
GO
ALTER TABLE [dbo].[DCM_Customers] ADD  CONSTRAINT [DF_DCM_Customers_Address4]  DEFAULT ('') FOR [Address4]
GO

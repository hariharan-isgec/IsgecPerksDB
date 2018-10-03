USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IDM_VEN_BAK](
	[VendorID] [nvarchar](6) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[ContactPerson] [nvarchar](50) NULL,
	[EmailID] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](20) NULL,
	[Address1] [nvarchar](60) NULL,
	[Address2] [nvarchar](60) NULL,
	[Address3] [nvarchar](60) NULL,
	[Address4] [nvarchar](60) NULL,
	[ToEMailID] [nvarchar](250) NULL,
	[CCEmailID] [nvarchar](250) NULL
) ON [PRIMARY]
GO

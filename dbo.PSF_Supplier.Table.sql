USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PSF_Supplier](
	[SupplierID] [nvarchar](9) NOT NULL,
	[SupplierName] [nvarchar](100) NOT NULL,
	[BankName] [nvarchar](50) NOT NULL,
	[BranchAddress] [nvarchar](200) NOT NULL,
	[BankAccountNo] [nvarchar](16) NOT NULL,
	[IFSCCode] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_PSF_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

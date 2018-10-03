USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRK_Led_Bak_14_2_17](
	[DocumentID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[PerkID] [int] NOT NULL,
	[TranType] [nvarchar](3) NOT NULL,
	[TranDate] [datetime] NOT NULL,
	[FinYear] [int] NOT NULL,
	[Value] [decimal](10, 2) NOT NULL,
	[UOM] [nvarchar](5) NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[Remarks] [nvarchar](500) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ParentDocumentID] [int] NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[PostedInBaaN] [bit] NOT NULL,
	[PostedOn] [datetime] NULL,
	[PostedBy] [int] NULL,
	[BatchNo] [nvarchar](6) NOT NULL,
	[VoucherNo] [nvarchar](8) NOT NULL,
	[VoucherLineNo] [nvarchar](10) NOT NULL
) ON [PRIMARY]
GO

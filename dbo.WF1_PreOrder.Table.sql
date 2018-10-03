USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WF1_PreOrder](
	[WFID] [int] NOT NULL,
	[Parent_WFID] [int] NULL,
	[Project] [varchar](50) NOT NULL,
	[Element] [varchar](50) NOT NULL,
	[SpecificationNo] [varchar](100) NOT NULL,
	[Buyer] [varchar](8) NOT NULL,
	[WF_Status] [varchar](100) NOT NULL,
	[UserId] [varchar](8) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Supplier] [nvarchar](150) NULL,
	[SupplierName] [varchar](100) NULL,
	[RandomNo] [varchar](8) NULL,
	[PMDLDocNo] [varchar](200) NULL,
	[SupplierCode] [varchar](50) NULL,
	[ReceiptNo] [varchar](9) NULL,
	[Manager] [varchar](8) NULL,
	[EmailSubject] [varchar](200) NULL,
 CONSTRAINT [PK_WF1_PreOrder] PRIMARY KEY CLUSTERED 
(
	[WFID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[WF1_PreOrder] ADD  CONSTRAINT [DF_WF1_PreOrder_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO

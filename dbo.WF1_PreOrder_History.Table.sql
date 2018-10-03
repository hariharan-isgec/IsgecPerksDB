USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WF1_PreOrder_History](
	[WF_HistoryID] [int] NOT NULL,
	[WFID] [int] NOT NULL,
	[WFID_SlNo] [int] NOT NULL,
	[Parent_WFID] [int] NULL,
	[Project] [varchar](50) NOT NULL,
	[Element] [varchar](50) NOT NULL,
	[SpecificationNo] [varchar](100) NOT NULL,
	[Buyer] [varchar](8) NOT NULL,
	[WF_Status] [varchar](100) NOT NULL,
	[UserId] [varchar](8) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Supplier] [varchar](50) NULL,
	[SupplierName] [varchar](100) NULL,
	[Notes] [varchar](max) NULL,
	[PMDLDocNo] [varchar](100) NULL,
	[Manager] [varchar](8) NULL,
 CONSTRAINT [PK__WF1_PreOrder_His__1A111CAC] PRIMARY KEY CLUSTERED 
(
	[WF_HistoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[WF1_PreOrder_History]  WITH CHECK ADD  CONSTRAINT [FK__WF1_PreOrd__WFID__3895A3CC] FOREIGN KEY([WFID])
REFERENCES [dbo].[WF1_PreOrder] ([WFID])
GO
ALTER TABLE [dbo].[WF1_PreOrder_History] CHECK CONSTRAINT [FK__WF1_PreOrd__WFID__3895A3CC]
GO
ALTER TABLE [dbo].[WF1_PreOrder_History] ADD  CONSTRAINT [DF_WF1_PreOrder_History_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO

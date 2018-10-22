USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QCM_CT_Request](
	[QCRequestNo] [int] NOT NULL,
	[SerialNo] [int] NOT NULL,
	[PONumber] [nvarchar](9) NOT NULL,
	[ItemReference] [varchar](200) NOT NULL,
	[ActivityID] [varchar](9) NOT NULL,
	[ItemUnit] [varchar](20) NULL,
	[Activity2Desc] [varchar](150) NULL,
	[Activity3Desc] [varchar](150) NULL,
	[Activity4Desc] [varchar](150) NULL,
	[Handle] [varchar](50) NULL,
	[ProgressPercent] [decimal](18, 4) NULL,
	[Quantity] [decimal](18, 4) NULL,
	[PercentOfQuantity] [decimal](18, 4) NULL,
	[PartialOrFull] [varchar](10) NULL,
	[NotSelectedList] [varchar](500) NULL,
	[SelectedList] [varchar](500) NULL,
	[Product] [varchar](9) NULL,
	[Project] [varchar](9) NULL,
	[GridLineStatus] [int] NULL,
	[InspectionStageiD] [int] NULL,
	[IrefWeight] [decimal](18, 4) NULL,
	[ProgressWeight] [decimal](18, 4) NULL,
 CONSTRAINT [PK_QCM_CT_Request] PRIMARY KEY CLUSTERED 
(
	[QCRequestNo] ASC,
	[SerialNo] ASC,
	[PONumber] ASC,
	[ItemReference] ASC,
	[ActivityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[QCM_CT_Request]  WITH CHECK ADD  CONSTRAINT [FK_QCM_CT_Request_InspectionStageID] FOREIGN KEY([InspectionStageiD])
REFERENCES [dbo].[QCM_InspectionStages] ([InspectionStageID])
GO
ALTER TABLE [dbo].[QCM_CT_Request] CHECK CONSTRAINT [FK_QCM_CT_Request_InspectionStageID]
GO

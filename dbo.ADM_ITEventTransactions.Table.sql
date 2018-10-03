USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_ITEventTransactions](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[EventDate] [datetime] NULL,
	[CardNo] [nvarchar](8) NULL,
	[Description] [nvarchar](100) NULL,
	[Completed] [bit] NOT NULL,
	[CompletedOn] [datetime] NULL,
	[Circular] [ntext] NULL,
	[EntryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ADM_ITEventTransactions] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADM_ITEventTransactions]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ITEventTransactions_HRM_Employees] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ADM_ITEventTransactions] CHECK CONSTRAINT [FK_ADM_ITEventTransactions_HRM_Employees]
GO
ALTER TABLE [dbo].[ADM_ITEventTransactions] ADD  CONSTRAINT [DF_ADM_ITEventTransactions_Completed]  DEFAULT ((0)) FOR [Completed]
GO
ALTER TABLE [dbo].[ADM_ITEventTransactions] ADD  CONSTRAINT [DF_ADM_ITEventTransactions_EntryDate]  DEFAULT (getdate()) FOR [EntryDate]
GO

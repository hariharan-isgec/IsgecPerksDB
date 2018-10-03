USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_ExpenseHeads](
	[ExpenseHeadID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[OneTimeInTour] [bit] NOT NULL,
	[RequiresMDApproval] [bit] NOT NULL,
 CONSTRAINT [PK_TA_ExpenseHeads] PRIMARY KEY CLUSTERED 
(
	[ExpenseHeadID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_ExpenseHeads] ADD  CONSTRAINT [DF_TA_ExpenseHeads_OneTimeInTour]  DEFAULT ((0)) FOR [OneTimeInTour]
GO
ALTER TABLE [dbo].[TA_ExpenseHeads] ADD  CONSTRAINT [DF_TA_ExpenseHeads_RequiresMDApproval]  DEFAULT ((0)) FOR [RequiresMDApproval]
GO

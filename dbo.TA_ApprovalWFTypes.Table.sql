USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_ApprovalWFTypes](
	[WFTypeID] [int] IDENTITY(1,1) NOT NULL,
	[WFTypeDescription] [nvarchar](50) NULL,
	[RequiredDivisionHeadApproval] [bit] NOT NULL,
	[RequiredMDApproval] [bit] NOT NULL,
 CONSTRAINT [PK_TA_ApprovalWFTypes] PRIMARY KEY CLUSTERED 
(
	[WFTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_ApprovalWFTypes] ADD  CONSTRAINT [DF_TA_ApprovalWFTypes_RequiredDivisionHeadApproval]  DEFAULT ((0)) FOR [RequiredDivisionHeadApproval]
GO
ALTER TABLE [dbo].[TA_ApprovalWFTypes] ADD  CONSTRAINT [DF_TA_ApprovalWFTypes_RequiredMDApproval]  DEFAULT ((0)) FOR [RequiredMDApproval]
GO

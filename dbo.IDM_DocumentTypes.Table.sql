USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IDM_DocumentTypes](
	[DocumentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[ValidateInPLM] [bit] NOT NULL,
	[BlockIfNotExists] [bit] NOT NULL,
	[OnceForApproval] [bit] NOT NULL,
	[WarnForApproval] [bit] NOT NULL,
	[ImplementReceiptLock] [bit] NOT NULL,
 CONSTRAINT [PK_IDM_DocumentTypes] PRIMARY KEY CLUSTERED 
(
	[DocumentTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IDM_DocumentTypes] ADD  CONSTRAINT [DF_IDM_DocumentTypes_ValidateInPLM]  DEFAULT ((0)) FOR [ValidateInPLM]
GO
ALTER TABLE [dbo].[IDM_DocumentTypes] ADD  CONSTRAINT [DF_IDM_DocumentTypes_BlockIfNotExists]  DEFAULT ((0)) FOR [BlockIfNotExists]
GO
ALTER TABLE [dbo].[IDM_DocumentTypes] ADD  CONSTRAINT [DF_IDM_DocumentTypes_OnceForApproval]  DEFAULT ((0)) FOR [OnceForApproval]
GO
ALTER TABLE [dbo].[IDM_DocumentTypes] ADD  CONSTRAINT [DF_IDM_DocumentTypes_WarnForApproval]  DEFAULT ((0)) FOR [WarnForApproval]
GO
ALTER TABLE [dbo].[IDM_DocumentTypes] ADD  CONSTRAINT [DF_IDM_DocumentTypes_OverruleReceiptLock]  DEFAULT ((0)) FOR [ImplementReceiptLock]
GO

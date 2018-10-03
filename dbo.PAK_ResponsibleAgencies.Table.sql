USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAK_ResponsibleAgencies](
	[ResponsibleAgencyID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[ExternalAgency] [bit] NOT NULL,
 CONSTRAINT [PK_PAK_ResponsibleAgencies] PRIMARY KEY CLUSTERED 
(
	[ResponsibleAgencyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PAK_ResponsibleAgencies] ADD  CONSTRAINT [DF_Table_1_External]  DEFAULT ((0)) FOR [ExternalAgency]
GO

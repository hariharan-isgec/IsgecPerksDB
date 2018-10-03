USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOS_CLPDataDetails](
	[ProjectID] [nvarchar](6) NOT NULL,
	[ProgressID] [int] NOT NULL,
	[CLPID] [int] NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Quantity] [nvarchar](100) NULL,
	[DisplayType] [nvarchar](50) NULL,
	[Sequence] [int] NULL,
	[engEndtDefined] [datetime] NULL,
	[engEndtActual] [datetime] NULL,
	[engdelayDays] [int] NULL,
	[engdelayStatus] [nvarchar](50) NULL,
	[ordEndtDefined] [datetime] NULL,
	[ordEndtActual] [datetime] NULL,
	[orddelayDays] [int] NULL,
	[orddelayStatus] [nvarchar](50) NULL,
	[desEndtDefined] [datetime] NULL,
	[desEndtActual] [datetime] NULL,
	[desdelayDays] [int] NULL,
	[desdelayStatus] [nvarchar](50) NULL,
	[ereEndtDefined] [datetime] NULL,
	[ereEndtActual] [datetime] NULL,
	[eredelayDays] [int] NULL,
	[eredelayStatus] [nvarchar](50) NULL,
	[ioEndtDefined] [datetime] NULL,
	[ioEndtActual] [datetime] NULL,
	[iodelayDays] [int] NULL,
	[iodelayStatus] [nvarchar](50) NULL,
	[recEndtDefined] [datetime] NULL,
	[recEndtActual] [datetime] NULL,
	[recdelayDays] [int] NULL,
	[recdelayStatus] [nvarchar](50) NULL,
	[ad1EndtDefined] [datetime] NULL,
	[ad1EndtActual] [datetime] NULL,
	[ad1delayDays] [int] NULL,
	[ad1delayStatus] [nvarchar](50) NULL,
	[ad2EndtDefined] [datetime] NULL,
	[ad2EndtActual] [datetime] NULL,
	[ad2delayDays] [int] NULL,
	[ad2delayStatus] [nvarchar](50) NULL,
	[ad3EndtDefined] [datetime] NULL,
	[ad3EndtActual] [datetime] NULL,
	[ad3delayDays] [int] NULL,
	[ad3delayStatus] [nvarchar](50) NULL,
	[ad4EndtDefined] [datetime] NULL,
	[ad4EndtActual] [datetime] NULL,
	[ad4delayDays] [int] NULL,
	[ad4delayStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_TOS_CLPDataDetails] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[ProgressID] ASC,
	[CLPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TOS_CLPDataDetails]  WITH CHECK ADD  CONSTRAINT [FK_CLPDataDetails_CLPID] FOREIGN KEY([ProjectID], [CLPID])
REFERENCES [dbo].[TOS_CLPs] ([ProjectID], [CLPID])
GO
ALTER TABLE [dbo].[TOS_CLPDataDetails] CHECK CONSTRAINT [FK_CLPDataDetails_CLPID]
GO
ALTER TABLE [dbo].[TOS_CLPDataDetails]  WITH CHECK ADD  CONSTRAINT [FK_CLPDataDetails_ProgressID] FOREIGN KEY([ProjectID], [ProgressID])
REFERENCES [dbo].[TOS_CLPData] ([ProjectID], [ProgressID])
GO
ALTER TABLE [dbo].[TOS_CLPDataDetails] CHECK CONSTRAINT [FK_CLPDataDetails_ProgressID]
GO
ALTER TABLE [dbo].[TOS_CLPDataDetails]  WITH CHECK ADD  CONSTRAINT [FK_CLPDataDetails_ProjectID] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[TOS_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[TOS_CLPDataDetails] CHECK CONSTRAINT [FK_CLPDataDetails_ProjectID]
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATN_ProcessPunch](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessDate] [datetime] NOT NULL,
	[Processed] [bit] NOT NULL,
	[FinYear] [nvarchar](4) NOT NULL,
 CONSTRAINT [PK_ATN_ProcessPunch] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATN_ProcessPunch]  WITH CHECK ADD  CONSTRAINT [FK_ATN_ProcessPunch_ATN_FinYear] FOREIGN KEY([FinYear])
REFERENCES [dbo].[ATN_FinYear] ([FinYear])
GO
ALTER TABLE [dbo].[ATN_ProcessPunch] CHECK CONSTRAINT [FK_ATN_ProcessPunch_ATN_FinYear]
GO
ALTER TABLE [dbo].[ATN_ProcessPunch] ADD  CONSTRAINT [DF_ATN_ProcessPunch_Processed]  DEFAULT ((0)) FOR [Processed]
GO
USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_ComplaintResponse](
	[CallID] [int] NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[Remarks] [nvarchar](250) NOT NULL,
	[AttendedOn] [datetime] NULL,
	[AttendedBy] [nvarchar](8) NULL,
	[AutoPosted] [bit] NOT NULL,
 CONSTRAINT [PK_ADM_ComplaintResponse] PRIMARY KEY CLUSTERED 
(
	[CallID] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADM_ComplaintResponse]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ComplaintResponse_ADM_Complaints] FOREIGN KEY([CallID])
REFERENCES [dbo].[ADM_Complaints] ([CallID])
GO
ALTER TABLE [dbo].[ADM_ComplaintResponse] CHECK CONSTRAINT [FK_ADM_ComplaintResponse_ADM_Complaints]
GO
ALTER TABLE [dbo].[ADM_ComplaintResponse] ADD  CONSTRAINT [DF_ADM_ComplaintResponse_AutoPosted]  DEFAULT ((0)) FOR [AutoPosted]
GO

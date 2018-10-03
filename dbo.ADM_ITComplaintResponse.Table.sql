USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_ITComplaintResponse](
	[CallID] [int] NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[Remarks] [nvarchar](250) NOT NULL,
	[AttendedOn] [datetime] NULL,
	[AttendedBy] [nvarchar](8) NULL,
	[AutoPosted] [bit] NOT NULL,
 CONSTRAINT [PK_ADM_ITComplaintResponse] PRIMARY KEY CLUSTERED 
(
	[CallID] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADM_ITComplaintResponse]  WITH CHECK ADD  CONSTRAINT [FK_ADM_ITComplaintResponse_ADM_ITComplaints] FOREIGN KEY([CallID])
REFERENCES [dbo].[ADM_ITComplaints] ([CallID])
GO
ALTER TABLE [dbo].[ADM_ITComplaintResponse] CHECK CONSTRAINT [FK_ADM_ITComplaintResponse_ADM_ITComplaints]
GO
ALTER TABLE [dbo].[ADM_ITComplaintResponse] ADD  CONSTRAINT [DF_ADM_ITComplaintResponse_AutoPosted]  DEFAULT ((0)) FOR [AutoPosted]
GO

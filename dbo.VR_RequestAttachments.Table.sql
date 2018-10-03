USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VR_RequestAttachments](
	[RequestNo] [int] NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[FileName] [nvarchar](250) NULL,
	[DiskFile] [nvarchar](250) NULL,
 CONSTRAINT [PK_VR_RequestAttachments] PRIMARY KEY CLUSTERED 
(
	[RequestNo] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VR_RequestAttachments]  WITH CHECK ADD  CONSTRAINT [FK_VR_RequestAttachments_RequestNo] FOREIGN KEY([RequestNo])
REFERENCES [dbo].[VR_VehicleRequest] ([RequestNo])
GO
ALTER TABLE [dbo].[VR_RequestAttachments] CHECK CONSTRAINT [FK_VR_RequestAttachments_RequestNo]
GO

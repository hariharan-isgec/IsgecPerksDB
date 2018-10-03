USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QCM_InspectionFiles](
	[RequestID] [int] NOT NULL,
	[InspectionID] [int] NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](250) NOT NULL,
	[DiskFIleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QCM_InspectionFiles] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC,
	[InspectionID] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[QCM_InspectionFiles]  WITH CHECK ADD  CONSTRAINT [FK_QCM_IFiles_InspectionID] FOREIGN KEY([RequestID], [InspectionID])
REFERENCES [dbo].[QCM_Inspections] ([RequestID], [InspectionID])
GO
ALTER TABLE [dbo].[QCM_InspectionFiles] CHECK CONSTRAINT [FK_QCM_IFiles_InspectionID]
GO

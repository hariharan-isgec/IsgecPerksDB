USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IDM_ProjectContacts](
	[ProjectID] [nvarchar](6) NOT NULL,
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[CardNo] [nvarchar](8) NULL,
	[ContactPerson] [nvarchar](50) NULL,
	[EmailID] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](20) NULL,
	[Address1] [nvarchar](60) NULL,
	[Address2] [nvarchar](60) NULL,
	[Address3] [nvarchar](60) NULL,
	[Address4] [nvarchar](60) NULL,
	[Remarks] [nvarchar](250) NULL,
	[CCEmailID] [nvarchar](250) NULL,
 CONSTRAINT [PK_IDM_ProjectContacts] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IDM_ProjectContacts]  WITH CHECK ADD  CONSTRAINT [FK_PRCon_Employees] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[IDM_ProjectContacts] CHECK CONSTRAINT [FK_PRCon_Employees]
GO
ALTER TABLE [dbo].[IDM_ProjectContacts]  WITH CHECK ADD  CONSTRAINT [FK_PRCon_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[IDM_Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[IDM_ProjectContacts] CHECK CONSTRAINT [FK_PRCon_Projects]
GO
ALTER TABLE [dbo].[IDM_ProjectContacts] ADD  CONSTRAINT [DF_IDM_ProjectContacts_Address1]  DEFAULT ('') FOR [Address1]
GO
ALTER TABLE [dbo].[IDM_ProjectContacts] ADD  CONSTRAINT [DF_IDM_ProjectContacts_Address2]  DEFAULT ('') FOR [Address2]
GO
ALTER TABLE [dbo].[IDM_ProjectContacts] ADD  CONSTRAINT [DF_IDM_ProjectContacts_Address3]  DEFAULT ('') FOR [Address3]
GO
ALTER TABLE [dbo].[IDM_ProjectContacts] ADD  CONSTRAINT [DF_IDM_ProjectContacts_Address4]  DEFAULT ('') FOR [Address4]
GO

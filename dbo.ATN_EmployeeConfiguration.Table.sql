USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATN_EmployeeConfiguration](
	[CardNo] [nvarchar](8) NOT NULL,
	[SendVerifyMail] [bit] NOT NULL,
	[SendApproveMail] [bit] NOT NULL,
	[AttendanceThroughExcel] [bit] NOT NULL,
 CONSTRAINT [PK_ATN_EmployeeConfiguration] PRIMARY KEY CLUSTERED 
(
	[CardNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATN_EmployeeConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_ATN_EmployeeConfiguration_CardNo] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_EmployeeConfiguration] CHECK CONSTRAINT [FK_ATN_EmployeeConfiguration_CardNo]
GO
ALTER TABLE [dbo].[ATN_EmployeeConfiguration] ADD  CONSTRAINT [DF_ATN_EmployeeConfiguration_SendVerifyMail]  DEFAULT ((0)) FOR [SendVerifyMail]
GO
ALTER TABLE [dbo].[ATN_EmployeeConfiguration] ADD  CONSTRAINT [DF_ATN_EmployeeConfiguration_SendApproveMail]  DEFAULT ((0)) FOR [SendApproveMail]
GO
ALTER TABLE [dbo].[ATN_EmployeeConfiguration] ADD  CONSTRAINT [DF_ATN_EmployeeConfiguration_AttendanceThroughExcel]  DEFAULT ((0)) FOR [AttendanceThroughExcel]
GO

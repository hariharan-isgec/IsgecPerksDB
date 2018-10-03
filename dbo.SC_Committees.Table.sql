USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC_Committees](
	[SerialNo] [int] IDENTITY(1,1) NOT NULL,
	[DivisionID] [nvarchar](6) NULL,
	[EmployeeID] [nvarchar](8) NOT NULL,
	[IsItUnitLevelCommittee] [bit] NOT NULL,
 CONSTRAINT [PK_SC_Committees] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SC_Committees]  WITH CHECK ADD  CONSTRAINT [FK_SC_Committees_DivisionID] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[HRM_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[SC_Committees] CHECK CONSTRAINT [FK_SC_Committees_DivisionID]
GO
ALTER TABLE [dbo].[SC_Committees]  WITH CHECK ADD  CONSTRAINT [FK_SC_Committees_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[SC_Committees] CHECK CONSTRAINT [FK_SC_Committees_EmployeeID]
GO
ALTER TABLE [dbo].[SC_Committees] ADD  CONSTRAINT [DF_SC_Committees_IsItUnitLevelCommittee]  DEFAULT ((0)) FOR [IsItUnitLevelCommittee]
GO

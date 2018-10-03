USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AST_PCHistory](
	[HistoryID] [int] IDENTITY(1,1) NOT NULL,
	[HistoryType] [nvarchar](20) NOT NULL,
	[pcID] [int] NOT NULL,
	[pcBrandID] [int] NULL,
	[ModelNo] [nvarchar](50) NOT NULL,
	[SerialNo] [nvarchar](50) NOT NULL,
	[NoOfCPUs] [int] NOT NULL,
	[cpuBrandID] [int] NULL,
	[CPUModel] [nvarchar](100) NOT NULL,
	[RamID] [int] NULL,
	[NoOfHDDs] [int] NOT NULL,
	[TotalHDDGB] [int] NOT NULL,
	[HDDDetails] [nvarchar](200) NOT NULL,
	[NoOfCDROMs] [int] NOT NULL,
	[CDRomDetails] [nvarchar](200) NOT NULL,
	[vduBrandID] [int] NULL,
	[vduSerialNo] [nvarchar](50) NOT NULL,
	[pcOSID] [int] NULL,
	[pcOSDetails] [nvarchar](100) NOT NULL,
	[IPAddress] [nvarchar](15) NOT NULL,
	[HostName] [nvarchar](50) NOT NULL,
	[INDomain] [bit] NOT NULL,
	[DomainName] [nvarchar](50) NOT NULL,
	[pcUser] [nvarchar](50) NOT NULL,
	[UserID] [int] NULL,
	[MrnID] [int] NULL,
	[AssetNo] [nvarchar](20) NOT NULL,
	[LocationID] [int] NULL,
	[MapDrive] [bit] NOT NULL,
	[PenDriveDisabled] [bit] NOT NULL,
	[CDRomDisabled] [bit] NOT NULL,
	[InternetAccess] [bit] NOT NULL,
	[Keyboard] [bit] NOT NULL,
	[Mouse] [bit] NOT NULL,
	[FloppyDrive] [bit] NOT NULL,
	[Remarks] [nvarchar](200) NOT NULL,
	[Issued] [bit] NOT NULL,
	[Discarded] [bit] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_AST_PCHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AST_PCHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_PCHistory_AST_Brands] FOREIGN KEY([pcBrandID])
REFERENCES [dbo].[AST_Brands] ([BrandID])
GO
ALTER TABLE [dbo].[AST_PCHistory] CHECK CONSTRAINT [FK_AST_PCHistory_AST_Brands]
GO
ALTER TABLE [dbo].[AST_PCHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_PCHistory_AST_Brands1] FOREIGN KEY([cpuBrandID])
REFERENCES [dbo].[AST_Brands] ([BrandID])
GO
ALTER TABLE [dbo].[AST_PCHistory] CHECK CONSTRAINT [FK_AST_PCHistory_AST_Brands1]
GO
ALTER TABLE [dbo].[AST_PCHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_PCHistory_AST_Brands2] FOREIGN KEY([vduBrandID])
REFERENCES [dbo].[AST_Brands] ([BrandID])
GO
ALTER TABLE [dbo].[AST_PCHistory] CHECK CONSTRAINT [FK_AST_PCHistory_AST_Brands2]
GO
ALTER TABLE [dbo].[AST_PCHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_PCHistory_AST_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[AST_Locations] ([LocationID])
GO
ALTER TABLE [dbo].[AST_PCHistory] CHECK CONSTRAINT [FK_AST_PCHistory_AST_Locations]
GO
ALTER TABLE [dbo].[AST_PCHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_PCHistory_AST_MrnPC] FOREIGN KEY([MrnID])
REFERENCES [dbo].[AST_MrnPC] ([MrnID])
GO
ALTER TABLE [dbo].[AST_PCHistory] CHECK CONSTRAINT [FK_AST_PCHistory_AST_MrnPC]
GO
ALTER TABLE [dbo].[AST_PCHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_PCHistory_AST_PCDetails] FOREIGN KEY([pcID])
REFERENCES [dbo].[AST_PCDetails] ([pcID])
GO
ALTER TABLE [dbo].[AST_PCHistory] CHECK CONSTRAINT [FK_AST_PCHistory_AST_PCDetails]
GO
ALTER TABLE [dbo].[AST_PCHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_PCHistory_AST_Rams] FOREIGN KEY([RamID])
REFERENCES [dbo].[AST_Rams] ([RamID])
GO
ALTER TABLE [dbo].[AST_PCHistory] CHECK CONSTRAINT [FK_AST_PCHistory_AST_Rams]
GO
ALTER TABLE [dbo].[AST_PCHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_PCHistory_AST_Softwares] FOREIGN KEY([pcOSID])
REFERENCES [dbo].[AST_Softwares] ([SoftwareID])
GO
ALTER TABLE [dbo].[AST_PCHistory] CHECK CONSTRAINT [FK_AST_PCHistory_AST_Softwares]
GO
ALTER TABLE [dbo].[AST_PCHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_PCHistory_PRK_Employees] FOREIGN KEY([UserID])
REFERENCES [dbo].[PRK_Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[AST_PCHistory] CHECK CONSTRAINT [FK_AST_PCHistory_PRK_Employees]
GO
ALTER TABLE [dbo].[AST_PCHistory]  WITH CHECK ADD  CONSTRAINT [FK_AST_PCHistory_PRK_Employees1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[PRK_Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[AST_PCHistory] CHECK CONSTRAINT [FK_AST_PCHistory_PRK_Employees1]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_HistoryType]  DEFAULT ('') FOR [HistoryType]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_ModelNo]  DEFAULT ('') FOR [ModelNo]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_SerialNo]  DEFAULT ('') FOR [SerialNo]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_NoOfCPUs]  DEFAULT ((0)) FOR [NoOfCPUs]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_CPUModel]  DEFAULT ('') FOR [CPUModel]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_NoOfHDDs]  DEFAULT ((0)) FOR [NoOfHDDs]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_TotalHDDGB]  DEFAULT ((0)) FOR [TotalHDDGB]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_HDDDetails]  DEFAULT ('') FOR [HDDDetails]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_NoOfCDROMs]  DEFAULT ((0)) FOR [NoOfCDROMs]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_CDRomDetails]  DEFAULT ('') FOR [CDRomDetails]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_vduSerialNo]  DEFAULT ('') FOR [vduSerialNo]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_pcOSDetails]  DEFAULT ('') FOR [pcOSDetails]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_IPAddress]  DEFAULT ('') FOR [IPAddress]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_HostName]  DEFAULT ('') FOR [HostName]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_INDomain]  DEFAULT ((0)) FOR [INDomain]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_DomainName]  DEFAULT ('') FOR [DomainName]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_pcUser]  DEFAULT ('') FOR [pcUser]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_AssetNo]  DEFAULT ('') FOR [AssetNo]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_MapDrive]  DEFAULT ((0)) FOR [MapDrive]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_PenDriveDisabled]  DEFAULT ((0)) FOR [PenDriveDisabled]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_CDRomDisabled]  DEFAULT ((0)) FOR [CDRomDisabled]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_InternetAccess]  DEFAULT ((0)) FOR [InternetAccess]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_Keyboard]  DEFAULT ((1)) FOR [Keyboard]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_Mouse]  DEFAULT ((1)) FOR [Mouse]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_FloppyDrive]  DEFAULT ((0)) FOR [FloppyDrive]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_Remarks]  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_Issued]  DEFAULT ((0)) FOR [Issued]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_Discarded]  DEFAULT ((0)) FOR [Discarded]
GO
ALTER TABLE [dbo].[AST_PCHistory] ADD  CONSTRAINT [DF_AST_PCHistory_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO

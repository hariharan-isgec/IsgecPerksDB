USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TA_TPInvoicing](
	[InvoiceNo] [nvarchar](15) NOT NULL,
	[InvoiceDate] [datetime] NULL,
	[PAXName] [nvarchar](50) NULL,
	[Sector] [nvarchar](50) NULL,
	[BookingDate] [datetime] NULL,
	[TravelDate] [datetime] NULL,
	[AirlinesName] [nvarchar](50) NULL,
	[TicketNo] [nvarchar](50) NULL,
	[NetAmount] [decimal](8, 0) NULL,
	[EmployeeCode] [nvarchar](8) NULL,
	[Sanction] [nvarchar](50) NULL,
	[AirlineType] [nvarchar](50) NULL,
 CONSTRAINT [PK_TA_TPInvoicing] PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TA_TPInvoicing]  WITH CHECK ADD  CONSTRAINT [FK_TA_TPInvoicing_EmployeeCode] FOREIGN KEY([EmployeeCode])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[TA_TPInvoicing] CHECK CONSTRAINT [FK_TA_TPInvoicing_EmployeeCode]
GO

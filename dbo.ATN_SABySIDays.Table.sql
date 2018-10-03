USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATN_SABySIDays](
	[SerialNo] [int] NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[Remarks] [nvarchar](250) NULL,
	[D01] [nvarchar](2) NULL,
	[D02] [nvarchar](2) NULL,
	[D03] [nvarchar](2) NULL,
	[D04] [nvarchar](2) NULL,
	[D05] [nvarchar](2) NULL,
	[D06] [nvarchar](2) NULL,
	[D07] [nvarchar](2) NULL,
	[D08] [nvarchar](2) NULL,
	[D09] [nvarchar](2) NULL,
	[D10] [nvarchar](2) NULL,
	[D11] [nvarchar](2) NULL,
	[D12] [nvarchar](2) NULL,
	[D13] [nvarchar](2) NULL,
	[D14] [nvarchar](2) NULL,
	[D15] [nvarchar](2) NULL,
	[D16] [nvarchar](2) NULL,
	[D17] [nvarchar](2) NULL,
	[D18] [nvarchar](2) NULL,
	[D19] [nvarchar](2) NULL,
	[D20] [nvarchar](2) NULL,
	[D21] [nvarchar](2) NULL,
	[D22] [nvarchar](2) NULL,
	[D23] [nvarchar](2) NULL,
	[D24] [nvarchar](2) NULL,
	[D25] [nvarchar](2) NULL,
	[D26] [nvarchar](2) NULL,
	[D27] [nvarchar](2) NULL,
	[D28] [nvarchar](2) NULL,
	[D29] [nvarchar](2) NULL,
	[D30] [nvarchar](2) NULL,
	[D31] [nvarchar](2) NULL,
 CONSTRAINT [PK_ATN_SABySIDays] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC,
	[CardNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATN_SABySIDays]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SABySIDays_CardNo] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_SABySIDays] CHECK CONSTRAINT [FK_ATN_SABySIDays_CardNo]
GO
ALTER TABLE [dbo].[ATN_SABySIDays]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SABySIDays_SerialNo] FOREIGN KEY([SerialNo])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SABySIDays] CHECK CONSTRAINT [FK_ATN_SABySIDays_SerialNo]
GO

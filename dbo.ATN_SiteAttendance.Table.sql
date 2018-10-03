USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATN_SiteAttendance](
	[FinYear] [nvarchar](4) NOT NULL,
	[MonthID] [int] NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[SAStatusID] [int] NULL,
	[ATNStatusID] [int] NULL,
	[ApprovedBy] [nvarchar](8) NULL,
	[ApprovedOn] [datetime] NULL,
	[ApproverRemarks] [nvarchar](250) NULL,
	[PostedBy] [nvarchar](8) NULL,
	[PostedOn] [datetime] NULL,
	[PostingRemarks] [nvarchar](250) NULL,
	[VerifiedBy] [nvarchar](8) NULL,
	[VerifiedOn] [datetime] NULL,
	[VerifierRemarks] [nvarchar](250) NULL,
	[VD01] [nvarchar](2) NULL,
	[VD02] [nvarchar](2) NULL,
	[VD03] [nvarchar](2) NULL,
	[VD04] [nvarchar](2) NULL,
	[VD05] [nvarchar](2) NULL,
	[VD06] [nvarchar](2) NULL,
	[VD07] [nvarchar](2) NULL,
	[VD08] [nvarchar](2) NULL,
	[VD09] [nvarchar](2) NULL,
	[VD10] [nvarchar](2) NULL,
	[VD11] [nvarchar](2) NULL,
	[VD12] [nvarchar](2) NULL,
	[VD13] [nvarchar](2) NULL,
	[VD14] [nvarchar](2) NULL,
	[VD15] [nvarchar](2) NULL,
	[VD16] [nvarchar](2) NULL,
	[VD17] [nvarchar](2) NULL,
	[VD18] [nvarchar](2) NULL,
	[VD19] [nvarchar](2) NULL,
	[VD20] [nvarchar](2) NULL,
	[VD21] [nvarchar](2) NULL,
	[VD22] [nvarchar](2) NULL,
	[VD23] [nvarchar](2) NULL,
	[VD24] [nvarchar](2) NULL,
	[VD25] [nvarchar](2) NULL,
	[VD26] [nvarchar](2) NULL,
	[VD27] [nvarchar](2) NULL,
	[VD28] [nvarchar](2) NULL,
	[VD29] [nvarchar](2) NULL,
	[VD30] [nvarchar](2) NULL,
	[VD31] [nvarchar](2) NULL,
	[AD01] [nvarchar](2) NULL,
	[AD02] [nvarchar](2) NULL,
	[AD03] [nvarchar](2) NULL,
	[AD04] [nvarchar](2) NULL,
	[AD05] [nvarchar](2) NULL,
	[AD06] [nvarchar](2) NULL,
	[AD07] [nvarchar](2) NULL,
	[AD08] [nvarchar](2) NULL,
	[AD09] [nvarchar](2) NULL,
	[AD10] [nvarchar](2) NULL,
	[AD11] [nvarchar](2) NULL,
	[AD12] [nvarchar](2) NULL,
	[AD13] [nvarchar](2) NULL,
	[AD14] [nvarchar](2) NULL,
	[AD15] [nvarchar](2) NULL,
	[AD16] [nvarchar](2) NULL,
	[AD17] [nvarchar](2) NULL,
	[AD18] [nvarchar](2) NULL,
	[AD19] [nvarchar](2) NULL,
	[AD20] [nvarchar](2) NULL,
	[AD21] [nvarchar](2) NULL,
	[AD22] [nvarchar](2) NULL,
	[AD23] [nvarchar](2) NULL,
	[AD24] [nvarchar](2) NULL,
	[AD25] [nvarchar](2) NULL,
	[AD26] [nvarchar](2) NULL,
	[AD27] [nvarchar](2) NULL,
	[AD28] [nvarchar](2) NULL,
	[AD29] [nvarchar](2) NULL,
	[AD30] [nvarchar](2) NULL,
	[AD31] [nvarchar](2) NULL,
	[PD01] [nvarchar](2) NULL,
	[PD02] [nvarchar](2) NULL,
	[PD03] [nvarchar](2) NULL,
	[PD04] [nvarchar](2) NULL,
	[PD05] [nvarchar](2) NULL,
	[PD06] [nvarchar](2) NULL,
	[PD07] [nvarchar](2) NULL,
	[PD08] [nvarchar](2) NULL,
	[PD09] [nvarchar](2) NULL,
	[PD10] [nvarchar](2) NULL,
	[PD11] [nvarchar](2) NULL,
	[PD12] [nvarchar](2) NULL,
	[PD13] [nvarchar](2) NULL,
	[PD14] [nvarchar](2) NULL,
	[PD15] [nvarchar](2) NULL,
	[PD16] [nvarchar](2) NULL,
	[PD17] [nvarchar](2) NULL,
	[PD18] [nvarchar](2) NULL,
	[PD19] [nvarchar](2) NULL,
	[PD20] [nvarchar](2) NULL,
	[PD21] [nvarchar](2) NULL,
	[PD22] [nvarchar](2) NULL,
	[PD23] [nvarchar](2) NULL,
	[PD24] [nvarchar](2) NULL,
	[PD25] [nvarchar](2) NULL,
	[PD26] [nvarchar](2) NULL,
	[PD27] [nvarchar](2) NULL,
	[PD28] [nvarchar](2) NULL,
	[PD29] [nvarchar](2) NULL,
	[PD30] [nvarchar](2) NULL,
	[PD31] [nvarchar](2) NULL,
	[SN01] [int] NULL,
	[SN02] [int] NULL,
	[SN03] [int] NULL,
	[SN04] [int] NULL,
	[SN05] [int] NULL,
	[SN06] [int] NULL,
	[SN07] [int] NULL,
	[SN08] [int] NULL,
	[SN09] [int] NULL,
	[SN10] [int] NULL,
	[SN11] [int] NULL,
	[SN12] [int] NULL,
	[SN13] [int] NULL,
	[SN14] [int] NULL,
	[SN15] [int] NULL,
	[SN16] [int] NULL,
	[SN17] [int] NULL,
	[SN18] [int] NULL,
	[SN19] [int] NULL,
	[SN20] [int] NULL,
	[SN21] [int] NULL,
	[SN22] [int] NULL,
	[SN23] [int] NULL,
	[SN24] [int] NULL,
	[SN25] [int] NULL,
	[SN26] [int] NULL,
	[SN27] [int] NULL,
	[SN28] [int] NULL,
	[SN29] [int] NULL,
	[SN30] [int] NULL,
	[SN31] [int] NULL,
 CONSTRAINT [PK_ATN_SiteAttendance] PRIMARY KEY CLUSTERED 
(
	[FinYear] ASC,
	[MonthID] ASC,
	[CardNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_ApprovedBy] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_ApprovedBy]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_ATNStatusID] FOREIGN KEY([ATNStatusID])
REFERENCES [dbo].[ATN_ApplicationStatus] ([ApplStatusID])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_ATNStatusID]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_CardNo] FOREIGN KEY([CardNo])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_CardNo]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_FinYear] FOREIGN KEY([FinYear])
REFERENCES [dbo].[ATN_FinYear] ([FinYear])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_FinYear]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_MonthID] FOREIGN KEY([MonthID])
REFERENCES [dbo].[ATN_Months] ([MonthID])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_MonthID]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_PostedBy] FOREIGN KEY([PostedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_PostedBy]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SAStatusID] FOREIGN KEY([SAStatusID])
REFERENCES [dbo].[ATN_SAStatus] ([StatusID])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SAStatusID]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN01] FOREIGN KEY([SN01])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN01]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN02] FOREIGN KEY([SN02])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN02]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN03] FOREIGN KEY([SN03])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN03]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN04] FOREIGN KEY([SN04])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN04]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN05] FOREIGN KEY([SN05])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN05]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN06] FOREIGN KEY([SN06])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN06]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN07] FOREIGN KEY([SN07])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN07]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN08] FOREIGN KEY([SN08])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN08]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN09] FOREIGN KEY([SN09])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN09]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN10] FOREIGN KEY([SN10])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN10]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN11] FOREIGN KEY([SN11])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN11]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN12] FOREIGN KEY([SN12])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN12]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN13] FOREIGN KEY([SN13])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN13]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN14] FOREIGN KEY([SN14])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN14]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN15] FOREIGN KEY([SN15])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN15]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN16] FOREIGN KEY([SN16])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN16]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN17] FOREIGN KEY([SN17])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN17]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN18] FOREIGN KEY([SN18])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN18]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN19] FOREIGN KEY([SN19])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN19]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN20] FOREIGN KEY([SN20])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN20]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN21] FOREIGN KEY([SN21])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN21]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN22] FOREIGN KEY([SN22])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN22]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN23] FOREIGN KEY([SN23])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN23]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN24] FOREIGN KEY([SN24])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN24]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN25] FOREIGN KEY([SN25])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN25]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN26] FOREIGN KEY([SN26])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN26]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN27] FOREIGN KEY([SN27])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN27]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN28] FOREIGN KEY([SN28])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN28]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN29] FOREIGN KEY([SN29])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN29]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN30] FOREIGN KEY([SN30])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN30]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_SN31] FOREIGN KEY([SN31])
REFERENCES [dbo].[ATN_SABySI] ([SerialNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_SN31]
GO
ALTER TABLE [dbo].[ATN_SiteAttendance]  WITH CHECK ADD  CONSTRAINT [FK_ATN_SiteAttendance_VerifiedBy] FOREIGN KEY([VerifiedBy])
REFERENCES [dbo].[HRM_Employees] ([CardNo])
GO
ALTER TABLE [dbo].[ATN_SiteAttendance] CHECK CONSTRAINT [FK_ATN_SiteAttendance_VerifiedBy]
GO

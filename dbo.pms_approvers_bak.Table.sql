USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pms_approvers_bak](
	[FinYear] [nvarchar](4) NOT NULL,
	[CardNo] [nvarchar](8) NOT NULL,
	[Apparaiser] [nvarchar](8) NULL,
	[ReviewerI] [nvarchar](8) NULL,
	[ReviewerII] [nvarchar](8) NULL
) ON [PRIMARY]
GO

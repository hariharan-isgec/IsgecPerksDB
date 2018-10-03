USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADM_ITBackupChecker](
	[BackupID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[SourcePath] [nvarchar](250) NULL,
	[TargetPath] [nvarchar](250) NULL,
	[USBPath] [nvarchar](250) NULL,
	[SourceDrive] [nvarchar](1) NULL,
	[TargetDrive] [nvarchar](1) NULL,
	[USBDrive] [nvarchar](1) NULL,
	[CheckPointID] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ADM_ITBackupChecker] PRIMARY KEY CLUSTERED 
(
	[BackupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADM_ITBackupChecker] ADD  CONSTRAINT [DF_ADM_ITBackupChecker_Active]  DEFAULT ((1)) FOR [Active]
GO

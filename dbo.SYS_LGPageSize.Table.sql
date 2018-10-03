USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYS_LGPageSize](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[LoginID] [nvarchar](20) NOT NULL,
	[PageName] [nvarchar](250) NOT NULL,
	[PageSize] [int] NOT NULL,
	[PageNo] [int] NOT NULL,
	[ApplicationID] [int] NOT NULL,
 CONSTRAINT [PK_SYS_LGPageSize] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SYS_LGPageSize] ADD  CONSTRAINT [DF_SYS_LGPageSize_PazeSize]  DEFAULT ((10)) FOR [PageSize]
GO
ALTER TABLE [dbo].[SYS_LGPageSize] ADD  CONSTRAINT [DF_SYS_LGPageSize_PageNo]  DEFAULT ((1)) FOR [PageNo]
GO

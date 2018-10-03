USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ATH_Database](
	[DBID] [varchar](50) NOT NULL,
	[DbDescription] [varchar](max) NOT NULL,
	[DbServerName] [varchar](50) NOT NULL,
	[DatabaseName] [varchar](50) NOT NULL,
	[LibraryCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ATH_Database] PRIMARY KEY CLUSTERED 
(
	[DBID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ATH_Database]  WITH CHECK ADD FOREIGN KEY([LibraryCode])
REFERENCES [dbo].[ATH_Library] ([LibraryCode])
GO
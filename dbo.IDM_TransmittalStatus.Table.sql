USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IDM_TransmittalStatus](
	[TmtlStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_IDM_TransmittalStatus] PRIMARY KEY CLUSTERED 
(
	[TmtlStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

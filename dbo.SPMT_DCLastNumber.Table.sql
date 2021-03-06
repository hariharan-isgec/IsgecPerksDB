USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPMT_DCLastNumber](
	[NumberID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[LastNumber] [int] NULL,
	[Year] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_SPMT_DCLastNumber] PRIMARY KEY CLUSTERED 
(
	[NumberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SPMT_DCLastNumber] ADD  CONSTRAINT [DF_SPMT_DCLastNumber_Active]  DEFAULT ((0)) FOR [Active]
GO

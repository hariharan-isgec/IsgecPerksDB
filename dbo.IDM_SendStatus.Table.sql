USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IDM_SendStatus](
	[SendStatusID] [nvarchar](3) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[ReceivedBack] [bit] NOT NULL,
	[IsItForApproval] [bit] NOT NULL,
 CONSTRAINT [PK_IDM_SendStatus] PRIMARY KEY CLUSTERED 
(
	[SendStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IDM_SendStatus] ADD  CONSTRAINT [DF_IDM_SendStatus_ReceivedBack]  DEFAULT ((0)) FOR [ReceivedBack]
GO
ALTER TABLE [dbo].[IDM_SendStatus] ADD  CONSTRAINT [DF_IDM_SendStatus_IsItForApproval]  DEFAULT ((0)) FOR [IsItForApproval]
GO

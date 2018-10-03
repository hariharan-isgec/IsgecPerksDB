USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRM_Serveys](
	[ServeyID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[AnsTag1] [nvarchar](50) NULL,
	[AnsTag2] [nvarchar](50) NULL,
	[AnsTag3] [nvarchar](50) NULL,
	[AnsTag4] [nvarchar](50) NULL,
	[AnsTag5] [nvarchar](50) NULL,
	[AnsTag6] [nvarchar](50) NULL,
	[AnsTag7] [nvarchar](50) NULL,
	[AnsTag8] [nvarchar](50) NULL,
	[AnsTag9] [nvarchar](50) NULL,
	[AnsTag10] [nvarchar](50) NULL,
 CONSTRAINT [PK_HRM_Serveys] PRIMARY KEY CLUSTERED 
(
	[ServeyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

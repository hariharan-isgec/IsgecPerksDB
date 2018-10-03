USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VPN_UserGroup]
as
SELECT 
				*
FROM 
OPENQUERY([VPN],
'SELECT 
		user_id,
    group_id
FROM sisftp_user_usergroup_map  
');
GO

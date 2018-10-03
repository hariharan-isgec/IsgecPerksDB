USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[VPN_Users]
as
SELECT 
				*
FROM 
OPENQUERY([VPN],
'SELECT 
		id,
    name,
    username,
    email,
    password,
    usertype,
    block   
FROM sisftp_users  
');
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OCS_RegisteredComputers]
AS
SELECT  
 * 
FROM 
OPENQUERY([OCS],
'SELECT 
		networks.id, 
		hardware.name, 
		networks.macaddr,  
		networks.ipaddress as old_ipaddress,
    hardware.ipaddr as ipaddress,
    substr(hardware.name,1,4) as cardno    
FROM networks, hardware  
WHERE hardware.id = networks.hardware_id 
AND networks.status = "Up" 
AND networks.macaddr <> "00:50:56:C0:00:08" 
AND networks.macaddr <> "00:50:56:C0:00:01"
order by id
') ;
--AND networks.type = "Ethernet"
GO

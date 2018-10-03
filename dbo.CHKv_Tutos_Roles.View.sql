USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CHKv_Tutos_Roles]
AS
SELECT     TOP (100) PERCENT Products.id AS pro_id, Products.name AS project_name, roles.f_name, roles.l_name 
FROM         TUTOS...products AS Products,  
               TUTOS...projectroles AS proles,
								 TUTOS...addresses AS roles  
WHERE proles.pro_id = Products.id AND 
                roles.id = proles.adr_id  AND proles.role_id=2
GO

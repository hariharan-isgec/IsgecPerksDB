USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvpnOCSrcSelectByID]
  @id Int 
  AS
  SELECT
		[OCS_RegisteredComputers].[id] ,
		[OCS_RegisteredComputers].[CardNo] ,
		[OCS_RegisteredComputers].[name] ,
		[OCS_RegisteredComputers].[macaddr] ,
		[OCS_RegisteredComputers].[ipaddress] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName 
  FROM [OCS_RegisteredComputers] 
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [OCS_RegisteredComputers].[CardNo] = [aspnet_Users1].[LoginID]
  WHERE
  [OCS_RegisteredComputers].[id] = @id
GO

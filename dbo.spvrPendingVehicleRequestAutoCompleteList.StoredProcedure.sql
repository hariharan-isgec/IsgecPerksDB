USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrPendingVehicleRequestAutoCompleteList]
  @RequestStatus Int,
  @LoginID NVarChar(8),
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [VR_VehicleRequest].[RequestDescription]' 
  SET @LGSQL = @LGSQL + ',[VR_VehicleRequest].[RequestNo]' 
  SET @LGSQL = @LGSQL + ' FROM [VR_VehicleRequest] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([VR_VehicleRequest].[RequestNo],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([VR_VehicleRequest].[RequestDescription],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  SET @LGSQL = @LGSQL + ' AND [VR_VehicleRequest].[RequestStatus] = ''' + STR(@RequestStatus) + '''' 
  
  EXEC (@LGSQL)
  END
GO

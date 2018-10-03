USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrVehicleTypesSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,VehicleTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'VehicleTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_VehicleTypes].[VehicleTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [VR_VehicleTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'VehicleTypeID' THEN '[VR_VehicleTypes].[VehicleTypeID]'
                        WHEN 'VehicleTypeID DESC' THEN '[VR_VehicleTypes].[VehicleTypeID] DESC'
                        WHEN 'Description' THEN '[VR_VehicleTypes].[Description]'
                        WHEN 'Description DESC' THEN '[VR_VehicleTypes].[Description] DESC'
                        WHEN 'DefineCapacity' THEN '[VR_VehicleTypes].[DefineCapacity]'
                        WHEN 'DefineCapacity DESC' THEN '[VR_VehicleTypes].[DefineCapacity] DESC'
                        WHEN 'CapacityInKG' THEN '[VR_VehicleTypes].[CapacityInKG]'
                        WHEN 'CapacityInKG DESC' THEN '[VR_VehicleTypes].[CapacityInKG] DESC'
                        WHEN 'DefineDimention' THEN '[VR_VehicleTypes].[DefineDimention]'
                        WHEN 'DefineDimention DESC' THEN '[VR_VehicleTypes].[DefineDimention] DESC'
                        WHEN 'HeightInFt' THEN '[VR_VehicleTypes].[HeightInFt]'
                        WHEN 'HeightInFt DESC' THEN '[VR_VehicleTypes].[HeightInFt] DESC'
                        WHEN 'WidthInFt' THEN '[VR_VehicleTypes].[WidthInFt]'
                        WHEN 'WidthInFt DESC' THEN '[VR_VehicleTypes].[WidthInFt] DESC'
                        WHEN 'LengthInFt' THEN '[VR_VehicleTypes].[LengthInFt]'
                        WHEN 'LengthInFt DESC' THEN '[VR_VehicleTypes].[LengthInFt] DESC'
                        WHEN 'EnforceMinimumCapacity' THEN '[VR_VehicleTypes].[EnforceMinimumCapacity]'
                        WHEN 'EnforceMinimumCapacity DESC' THEN '[VR_VehicleTypes].[EnforceMinimumCapacity] DESC'
                        WHEN 'MinimumCapacity' THEN '[VR_VehicleTypes].[MinimumCapacity]'
                        WHEN 'MinimumCapacity DESC' THEN '[VR_VehicleTypes].[MinimumCapacity] DESC'
                        WHEN 'EnforceMaximumCapacity' THEN '[VR_VehicleTypes].[EnforceMaximumCapacity]'
                        WHEN 'EnforceMaximumCapacity DESC' THEN '[VR_VehicleTypes].[EnforceMaximumCapacity] DESC'
                        WHEN 'MaximumCapacity' THEN '[VR_VehicleTypes].[MaximumCapacity]'
                        WHEN 'MaximumCapacity DESC' THEN '[VR_VehicleTypes].[MaximumCapacity] DESC'
                        WHEN 'EnforceMinimumDimention' THEN '[VR_VehicleTypes].[EnforceMinimumDimention]'
                        WHEN 'EnforceMinimumDimention DESC' THEN '[VR_VehicleTypes].[EnforceMinimumDimention] DESC'
                        WHEN 'MinimumHeight' THEN '[VR_VehicleTypes].[MinimumHeight]'
                        WHEN 'MinimumHeight DESC' THEN '[VR_VehicleTypes].[MinimumHeight] DESC'
                        WHEN 'MinimumWidth' THEN '[VR_VehicleTypes].[MinimumWidth]'
                        WHEN 'MinimumWidth DESC' THEN '[VR_VehicleTypes].[MinimumWidth] DESC'
                        WHEN 'MinimumLength' THEN '[VR_VehicleTypes].[MinimumLength]'
                        WHEN 'MinimumLength DESC' THEN '[VR_VehicleTypes].[MinimumLength] DESC'
                        WHEN 'EnforceMaximumDimention' THEN '[VR_VehicleTypes].[EnforceMaximumDimention]'
                        WHEN 'EnforceMaximumDimention DESC' THEN '[VR_VehicleTypes].[EnforceMaximumDimention] DESC'
                        WHEN 'MaximumHeight' THEN '[VR_VehicleTypes].[MaximumHeight]'
                        WHEN 'MaximumHeight DESC' THEN '[VR_VehicleTypes].[MaximumHeight] DESC'
                        WHEN 'MaximumWidth' THEN '[VR_VehicleTypes].[MaximumWidth]'
                        WHEN 'MaximumWidth DESC' THEN '[VR_VehicleTypes].[MaximumWidth] DESC'
                        WHEN 'MaximumLength' THEN '[VR_VehicleTypes].[MaximumLength]'
                        WHEN 'MaximumLength DESC' THEN '[VR_VehicleTypes].[MaximumLength] DESC'
                        WHEN 'cmba' THEN '[VR_VehicleTypes].[cmba]'
                        WHEN 'cmba DESC' THEN '[VR_VehicleTypes].[cmba] DESC'
                        WHEN 'DailyRunning' THEN '[VR_VehicleTypes].[DailyRunning]'
                        WHEN 'DailyRunning DESC' THEN '[VR_VehicleTypes].[DailyRunning] DESC'
                        ELSE '[VR_VehicleTypes].[VehicleTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[VR_VehicleTypes].[VehicleTypeID] ,
		[VR_VehicleTypes].[Description] ,
		[VR_VehicleTypes].[DefineCapacity] ,
		[VR_VehicleTypes].[CapacityInKG] ,
		[VR_VehicleTypes].[DefineDimention] ,
		[VR_VehicleTypes].[HeightInFt] ,
		[VR_VehicleTypes].[WidthInFt] ,
		[VR_VehicleTypes].[LengthInFt] ,
		[VR_VehicleTypes].[EnforceMinimumCapacity] ,
		[VR_VehicleTypes].[MinimumCapacity] ,
		[VR_VehicleTypes].[EnforceMaximumCapacity] ,
		[VR_VehicleTypes].[MaximumCapacity] ,
		[VR_VehicleTypes].[EnforceMinimumDimention] ,
		[VR_VehicleTypes].[MinimumHeight] ,
		[VR_VehicleTypes].[MinimumWidth] ,
		[VR_VehicleTypes].[MinimumLength] ,
		[VR_VehicleTypes].[EnforceMaximumDimention] ,
		[VR_VehicleTypes].[MaximumHeight] ,
		[VR_VehicleTypes].[MaximumWidth] ,
		[VR_VehicleTypes].[MaximumLength] ,
		[VR_VehicleTypes].[cmba] ,
		[VR_VehicleTypes].[DailyRunning]  
  FROM [VR_VehicleTypes] 
    	INNER JOIN #PageIndex
          ON [VR_VehicleTypes].[VehicleTypeID] = #PageIndex.VehicleTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO

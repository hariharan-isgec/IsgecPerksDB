USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcal_LG_AttendComplaintsUpdate]
  @AttendedOn DateTime,
  @AttenderDescription NVarChar(500),
  @CallStatusID Int,
  @Original_CallID Int, 
  @RowCount int = null OUTPUT
  AS
  DECLARE @ATNDT DATETIME
  SELECT @ATNDT = AttendedOn FROM CAL_Register WHERE [CallID] = @Original_CallID
  IF(@ATNDT IS null)
	BEGIN
	  UPDATE [CAL_Register] SET 
	   [AttendedOn] = @AttendedOn
	  ,[AttenderDescription] = @AttenderDescription
	  ,[CallStatusID] = @CallStatusID
	  WHERE
	  [CallID] = @Original_CallID
	END
  ELSE
    BEGIN
	  UPDATE [CAL_Register] SET 
	   [AttenderDescription] = @AttenderDescription
	  ,[CallStatusID] = @CallStatusID
	  WHERE
	  [CallID] = @Original_CallID
	END

  SET @RowCount = @@RowCount
GO

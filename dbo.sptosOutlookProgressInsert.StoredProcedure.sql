USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOutlookProgressInsert]
  @ProjectID NVarChar(6),
  @ProgressID Int,
  @CLPID Int,
  @Description NVarChar(250),
  @Quantity NVarChar(100),
  @Sequence Int,
  @DisplayType NVarChar(50),
  @engEndtDefined DateTime,
  @engEndtActual DateTime,
  @engdelayDays Int,
  @engdelayStatus NVarChar(50),
  @ordEndtDefined DateTime,
  @ordEndtActual DateTime,
  @orddelayDays Int,
  @orddelayStatus NVarChar(50),
  @desEndtDefined DateTime,
  @desEndtActual DateTime,
  @desdelayDays Int,
  @desdelayStatus NVarChar(50),
  @ereEndtDefined DateTime,
  @ereEndtActual DateTime,
  @eredelayDays Int,
  @eredelayStatus NVarChar(50),
  @ioEndtDefined DateTime,
  @ioEndtActual DateTime,
  @iodelayDays Int,
  @iodelayStatus NVarChar(50),
  @recEndtDefined DateTime,
  @recEndtActual DateTime,
  @recdelayDays Int,
  @recdelayStatus NVarChar(50),
  @ad1EndtDefined DateTime,
  @ad1EndtActual DateTime,
  @ad1delayDays Int,
  @ad1delayStatus NVarChar(50),
  @ad2EndtDefined DateTime,
  @ad2EndtActual DateTime,
  @ad2delayDays Int,
  @ad2delayStatus NVarChar(50),
  @ad3EndtDefined DateTime,
  @ad3EndtActual DateTime,
  @ad3delayDays Int,
  @ad3delayStatus NVarChar(50),
  @ad4EndtDefined DateTime,
  @ad4EndtActual DateTime,
  @ad4delayDays Int,
  @ad4delayStatus NVarChar(50),
  @Return_ProjectID NVarChar(6) = null OUTPUT, 
  @Return_ProgressID Int = null OUTPUT, 
  @Return_CLPID Int = null OUTPUT 
  AS
  INSERT [TOS_CLPDataDetails]
  (
   [ProjectID]
  ,[ProgressID]
  ,[CLPID]
  ,[Description]
  ,[Quantity]
  ,[Sequence]
  ,[DisplayType]
  ,[engEndtDefined]
  ,[engEndtActual]
  ,[engdelayDays]
  ,[engdelayStatus]
  ,[ordEndtDefined]
  ,[ordEndtActual]
  ,[orddelayDays]
  ,[orddelayStatus]
  ,[desEndtDefined]
  ,[desEndtActual]
  ,[desdelayDays]
  ,[desdelayStatus]
  ,[ereEndtDefined]
  ,[ereEndtActual]
  ,[eredelayDays]
  ,[eredelayStatus]
  ,[ioEndtDefined]
  ,[ioEndtActual]
  ,[iodelayDays]
  ,[iodelayStatus]
  ,[recEndtDefined]
  ,[recEndtActual]
  ,[recdelayDays]
  ,[recdelayStatus]
  ,[ad1EndtDefined]
  ,[ad1EndtActual]
  ,[ad1delayDays]
  ,[ad1delayStatus]
  ,[ad2EndtDefined]
  ,[ad2EndtActual]
  ,[ad2delayDays]
  ,[ad2delayStatus]
  ,[ad3EndtDefined]
  ,[ad3EndtActual]
  ,[ad3delayDays]
  ,[ad3delayStatus]
  ,[ad4EndtDefined]
  ,[ad4EndtActual]
  ,[ad4delayDays]
  ,[ad4delayStatus]
  )
  VALUES
  (
   UPPER(@ProjectID)
  ,@ProgressID
  ,@CLPID
  ,@Description
  ,@Quantity
  ,@Sequence
  ,@DisplayType
  ,@engEndtDefined
  ,@engEndtActual
  ,@engdelayDays
  ,@engdelayStatus
  ,@ordEndtDefined
  ,@ordEndtActual
  ,@orddelayDays
  ,@orddelayStatus
  ,@desEndtDefined
  ,@desEndtActual
  ,@desdelayDays
  ,@desdelayStatus
  ,@ereEndtDefined
  ,@ereEndtActual
  ,@eredelayDays
  ,@eredelayStatus
  ,@ioEndtDefined
  ,@ioEndtActual
  ,@iodelayDays
  ,@iodelayStatus
  ,@recEndtDefined
  ,@recEndtActual
  ,@recdelayDays
  ,@recdelayStatus
  ,@ad1EndtDefined
  ,@ad1EndtActual
  ,@ad1delayDays
  ,@ad1delayStatus
  ,@ad2EndtDefined
  ,@ad2EndtActual
  ,@ad2delayDays
  ,@ad2delayStatus
  ,@ad3EndtDefined
  ,@ad3EndtActual
  ,@ad3delayDays
  ,@ad3delayStatus
  ,@ad4EndtDefined
  ,@ad4EndtActual
  ,@ad4delayDays
  ,@ad4delayStatus
  )
  SET @Return_ProjectID = @ProjectID
  SET @Return_ProgressID = @ProgressID
  SET @Return_CLPID = @CLPID
GO

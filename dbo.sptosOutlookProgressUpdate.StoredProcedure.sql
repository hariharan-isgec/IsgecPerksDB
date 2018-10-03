USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosOutlookProgressUpdate]
  @Original_ProjectID NVarChar(6), 
  @Original_ProgressID Int, 
  @Original_CLPID Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [TOS_CLPDataDetails] SET 
   [ProjectID] = @ProjectID
  ,[ProgressID] = @ProgressID
  ,[CLPID] = @CLPID
  ,[Description] = @Description
  ,[Quantity] = @Quantity
  ,[Sequence] = @Sequence
  ,[DisplayType] = @DisplayType
  ,[engEndtDefined] = @engEndtDefined
  ,[engEndtActual] = @engEndtActual
  ,[engdelayDays] = @engdelayDays
  ,[engdelayStatus] = @engdelayStatus
  ,[ordEndtDefined] = @ordEndtDefined
  ,[ordEndtActual] = @ordEndtActual
  ,[orddelayDays] = @orddelayDays
  ,[orddelayStatus] = @orddelayStatus
  ,[desEndtDefined] = @desEndtDefined
  ,[desEndtActual] = @desEndtActual
  ,[desdelayDays] = @desdelayDays
  ,[desdelayStatus] = @desdelayStatus
  ,[ereEndtDefined] = @ereEndtDefined
  ,[ereEndtActual] = @ereEndtActual
  ,[eredelayDays] = @eredelayDays
  ,[eredelayStatus] = @eredelayStatus
  ,[ioEndtDefined] = @ioEndtDefined
  ,[ioEndtActual] = @ioEndtActual
  ,[iodelayDays] = @iodelayDays
  ,[iodelayStatus] = @iodelayStatus
  ,[recEndtDefined] = @recEndtDefined
  ,[recEndtActual] = @recEndtActual
  ,[recdelayDays] = @recdelayDays
  ,[recdelayStatus] = @recdelayStatus
  ,[ad1EndtDefined] = @ad1EndtDefined
  ,[ad1EndtActual] = @ad1EndtActual
  ,[ad1delayDays] = @ad1delayDays
  ,[ad1delayStatus] = @ad1delayStatus
  ,[ad2EndtDefined] = @ad2EndtDefined
  ,[ad2EndtActual] = @ad2EndtActual
  ,[ad2delayDays] = @ad2delayDays
  ,[ad2delayStatus] = @ad2delayStatus
  ,[ad3EndtDefined] = @ad3EndtDefined
  ,[ad3EndtActual] = @ad3EndtActual
  ,[ad3delayDays] = @ad3delayDays
  ,[ad3delayStatus] = @ad3delayStatus
  ,[ad4EndtDefined] = @ad4EndtDefined
  ,[ad4EndtActual] = @ad4EndtActual
  ,[ad4delayDays] = @ad4delayDays
  ,[ad4delayStatus] = @ad4delayStatus
  WHERE
  [ProjectID] = @Original_ProjectID
  AND [ProgressID] = @Original_ProgressID
  AND [CLPID] = @Original_CLPID
  SET @RowCount = @@RowCount
GO

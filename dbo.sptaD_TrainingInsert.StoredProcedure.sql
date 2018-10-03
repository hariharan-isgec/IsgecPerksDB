USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaD_TrainingInsert]
  @Bord_Lodg_DA_Percent Decimal(10,2),
  @Lodg_DA_Percent Decimal(10,2),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [TA_D_Training]
  (
   [Bord_Lodg_DA_Percent]
  ,[Lodg_DA_Percent]
  ,[FromDate]
  ,[TillDate]
  ,[Active]
  )
  VALUES
  (
   @Bord_Lodg_DA_Percent
  ,@Lodg_DA_Percent
  ,@FromDate
  ,@TillDate
  ,@Active
  )
  SET @Return_SerialNo = Scope_Identity()
GO

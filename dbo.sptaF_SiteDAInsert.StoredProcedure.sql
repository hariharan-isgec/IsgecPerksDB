USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaF_SiteDAInsert]
  @Perm_Bord_DA Decimal(10,2),
  @Cont_NonT_Bord_DA Decimal(10,2),
  @Cont_Tech_Bord_DA Decimal(10,2),
  @CategoryID Int,
  @Cont_Tech_DA Decimal(10,2),
  @Cont_NonT_DA Decimal(10,2),
  @Perm_DA Decimal(10,2),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [TA_F_SiteDA]
  (
   [Perm_Bord_DA]
  ,[Cont_NonT_Bord_DA]
  ,[Cont_Tech_Bord_DA]
  ,[CategoryID]
  ,[Cont_Tech_DA]
  ,[Cont_NonT_DA]
  ,[Perm_DA]
  ,[FromDate]
  ,[TillDate]
  ,[Active]
  )
  VALUES
  (
   @Perm_Bord_DA
  ,@Cont_NonT_Bord_DA
  ,@Cont_Tech_Bord_DA
  ,@CategoryID
  ,@Cont_Tech_DA
  ,@Cont_NonT_DA
  ,@Perm_DA
  ,@FromDate
  ,@TillDate
  ,@Active
  )
  SET @Return_SerialNo = Scope_Identity()
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastDiscardedPCInsert]
  @Discarded Bit,
  @pcID Int = null OUTPUT
  AS
  INSERT [AST_PCDetails]
  (
   [Discarded]
  )
  VALUES
  (
   @Discarded
  )
  SET @pcID = Scope_Identity()
GO

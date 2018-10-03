USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnSiteAttendanceUpdate]
  @Original_FinYear NVarChar(4), 
  @Original_MonthID Int, 
  @Original_CardNo NVarChar(8), 
  @FinYear NVarChar(4),
  @MonthID Int,
  @CardNo NVarChar(8),
  @VD01 NVarChar(2),
  @VD02 NVarChar(2),
  @VD03 NVarChar(2),
  @VD04 NVarChar(2),
  @VD05 NVarChar(2),
  @VD06 NVarChar(2),
  @VD07 NVarChar(2),
  @VD08 NVarChar(2),
  @VD09 NVarChar(2),
  @VD10 NVarChar(2),
  @VD11 NVarChar(2),
  @VD12 NVarChar(2),
  @VD13 NVarChar(2),
  @VD14 NVarChar(2),
  @VD15 NVarChar(2),
  @VD16 NVarChar(2),
  @VD17 NVarChar(2),
  @VD18 NVarChar(2),
  @VD19 NVarChar(2),
  @VD20 NVarChar(2),
  @VD21 NVarChar(2),
  @VD22 NVarChar(2),
  @VD23 NVarChar(2),
  @VD24 NVarChar(2),
  @VD25 NVarChar(2),
  @VD26 NVarChar(2),
  @VD27 NVarChar(2),
  @VD28 NVarChar(2),
  @VD29 NVarChar(2),
  @VD30 NVarChar(2),
  @VD31 NVarChar(2),
  @PD16 NVarChar(2),
  @PostingRemarks NVarChar(250),
  @PD11 NVarChar(2),
  @PD13 NVarChar(2),
  @AD03 NVarChar(2),
  @PD15 NVarChar(2),
  @ApproverRemarks NVarChar(250),
  @PD14 NVarChar(2),
  @PD12 NVarChar(2),
  @AD01 NVarChar(2),
  @AD02 NVarChar(2),
  @PD18 NVarChar(2),
  @PD17 NVarChar(2),
  @AD06 NVarChar(2),
  @ApprovedBy NVarChar(8),
  @ApprovedOn DateTime,
  @SN03 Int,
  @PD28 NVarChar(2),
  @AD21 NVarChar(2),
  @PD27 NVarChar(2),
  @PD07 NVarChar(2),
  @PostedBy NVarChar(8),
  @AD08 NVarChar(2),
  @PostedOn DateTime,
  @AD07 NVarChar(2),
  @AD05 NVarChar(2),
  @AD25 NVarChar(2),
  @PD06 NVarChar(2),
  @AD26 NVarChar(2),
  @PD01 NVarChar(2),
  @AD28 NVarChar(2),
  @PD02 NVarChar(2),
  @PD19 NVarChar(2),
  @PD04 NVarChar(2),
  @PD08 NVarChar(2),
  @PD03 NVarChar(2),
  @AD31 NVarChar(2),
  @PD25 NVarChar(2),
  @PD20 NVarChar(2),
  @PD26 NVarChar(2),
  @PD24 NVarChar(2),
  @PD23 NVarChar(2),
  @PD05 NVarChar(2),
  @AD30 NVarChar(2),
  @AD29 NVarChar(2),
  @AD27 NVarChar(2),
  @PD22 NVarChar(2),
  @PD21 NVarChar(2),
  @PD10 NVarChar(2),
  @AD19 NVarChar(2),
  @SN14 Int,
  @SN15 Int,
  @AD04 NVarChar(2),
  @SN01 Int,
  @SN10 Int,
  @SN12 Int,
  @SN05 Int,
  @SN29 Int,
  @PD30 NVarChar(2),
  @PD31 NVarChar(2),
  @SN08 Int,
  @SN28 Int,
  @SN11 Int,
  @SN26 Int,
  @SN24 Int,
  @VerifierRemarks NVarChar(250),
  @VerifiedBy NVarChar(8),
  @AD12 NVarChar(2),
  @SAStatusID Int,
  @ATNStatusID Int,
  @VerifiedOn DateTime,
  @SN04 Int,
  @SN07 Int,
  @SN13 Int,
  @AD18 NVarChar(2),
  @SN02 Int,
  @SN09 Int,
  @SN06 Int,
  @AD22 NVarChar(2),
  @AD15 NVarChar(2),
  @PD29 NVarChar(2),
  @AD14 NVarChar(2),
  @SN18 Int,
  @AD24 NVarChar(2),
  @AD13 NVarChar(2),
  @AD16 NVarChar(2),
  @AD17 NVarChar(2),
  @AD20 NVarChar(2),
  @SN22 Int,
  @AD11 NVarChar(2),
  @AD23 NVarChar(2),
  @SN17 Int,
  @SN30 Int,
  @AD10 NVarChar(2),
  @AD09 NVarChar(2),
  @SN27 Int,
  @SN23 Int,
  @SN25 Int,
  @SN20 Int,
  @PD09 NVarChar(2),
  @SN16 Int,
  @SN31 Int,
  @SN21 Int,
  @SN19 Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [ATN_SiteAttendance] SET 
   [FinYear] = @FinYear
  ,[MonthID] = @MonthID
  ,[CardNo] = @CardNo
  ,[VD01] = @VD01
  ,[VD02] = @VD02
  ,[VD03] = @VD03
  ,[VD04] = @VD04
  ,[VD05] = @VD05
  ,[VD06] = @VD06
  ,[VD07] = @VD07
  ,[VD08] = @VD08
  ,[VD09] = @VD09
  ,[VD10] = @VD10
  ,[VD11] = @VD11
  ,[VD12] = @VD12
  ,[VD13] = @VD13
  ,[VD14] = @VD14
  ,[VD15] = @VD15
  ,[VD16] = @VD16
  ,[VD17] = @VD17
  ,[VD18] = @VD18
  ,[VD19] = @VD19
  ,[VD20] = @VD20
  ,[VD21] = @VD21
  ,[VD22] = @VD22
  ,[VD23] = @VD23
  ,[VD24] = @VD24
  ,[VD25] = @VD25
  ,[VD26] = @VD26
  ,[VD27] = @VD27
  ,[VD28] = @VD28
  ,[VD29] = @VD29
  ,[VD30] = @VD30
  ,[VD31] = @VD31
  ,[PD16] = @PD16
  ,[PostingRemarks] = @PostingRemarks
  ,[PD11] = @PD11
  ,[PD13] = @PD13
  ,[AD03] = @AD03
  ,[PD15] = @PD15
  ,[ApproverRemarks] = @ApproverRemarks
  ,[PD14] = @PD14
  ,[PD12] = @PD12
  ,[AD01] = @AD01
  ,[AD02] = @AD02
  ,[PD18] = @PD18
  ,[PD17] = @PD17
  ,[AD06] = @AD06
  ,[ApprovedBy] = @ApprovedBy
  ,[ApprovedOn] = @ApprovedOn
  ,[SN03] = @SN03
  ,[PD28] = @PD28
  ,[AD21] = @AD21
  ,[PD27] = @PD27
  ,[PD07] = @PD07
  ,[PostedBy] = @PostedBy
  ,[AD08] = @AD08
  ,[PostedOn] = @PostedOn
  ,[AD07] = @AD07
  ,[AD05] = @AD05
  ,[AD25] = @AD25
  ,[PD06] = @PD06
  ,[AD26] = @AD26
  ,[PD01] = @PD01
  ,[AD28] = @AD28
  ,[PD02] = @PD02
  ,[PD19] = @PD19
  ,[PD04] = @PD04
  ,[PD08] = @PD08
  ,[PD03] = @PD03
  ,[AD31] = @AD31
  ,[PD25] = @PD25
  ,[PD20] = @PD20
  ,[PD26] = @PD26
  ,[PD24] = @PD24
  ,[PD23] = @PD23
  ,[PD05] = @PD05
  ,[AD30] = @AD30
  ,[AD29] = @AD29
  ,[AD27] = @AD27
  ,[PD22] = @PD22
  ,[PD21] = @PD21
  ,[PD10] = @PD10
  ,[AD19] = @AD19
  ,[SN14] = @SN14
  ,[SN15] = @SN15
  ,[AD04] = @AD04
  ,[SN01] = @SN01
  ,[SN10] = @SN10
  ,[SN12] = @SN12
  ,[SN05] = @SN05
  ,[SN29] = @SN29
  ,[PD30] = @PD30
  ,[PD31] = @PD31
  ,[SN08] = @SN08
  ,[SN28] = @SN28
  ,[SN11] = @SN11
  ,[SN26] = @SN26
  ,[SN24] = @SN24
  ,[VerifierRemarks] = @VerifierRemarks
  ,[VerifiedBy] = @VerifiedBy
  ,[AD12] = @AD12
  ,[SAStatusID] = @SAStatusID
  ,[ATNStatusID] = @ATNStatusID
  ,[VerifiedOn] = @VerifiedOn
  ,[SN04] = @SN04
  ,[SN07] = @SN07
  ,[SN13] = @SN13
  ,[AD18] = @AD18
  ,[SN02] = @SN02
  ,[SN09] = @SN09
  ,[SN06] = @SN06
  ,[AD22] = @AD22
  ,[AD15] = @AD15
  ,[PD29] = @PD29
  ,[AD14] = @AD14
  ,[SN18] = @SN18
  ,[AD24] = @AD24
  ,[AD13] = @AD13
  ,[AD16] = @AD16
  ,[AD17] = @AD17
  ,[AD20] = @AD20
  ,[SN22] = @SN22
  ,[AD11] = @AD11
  ,[AD23] = @AD23
  ,[SN17] = @SN17
  ,[SN30] = @SN30
  ,[AD10] = @AD10
  ,[AD09] = @AD09
  ,[SN27] = @SN27
  ,[SN23] = @SN23
  ,[SN25] = @SN25
  ,[SN20] = @SN20
  ,[PD09] = @PD09
  ,[SN16] = @SN16
  ,[SN31] = @SN31
  ,[SN21] = @SN21
  ,[SN19] = @SN19
  WHERE
  [FinYear] = @Original_FinYear
  AND [MonthID] = @Original_MonthID
  AND [CardNo] = @Original_CardNo
  SET @RowCount = @@RowCount
GO

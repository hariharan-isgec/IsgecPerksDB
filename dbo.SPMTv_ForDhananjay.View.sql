USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SPMTv_ForDhananjay]
AS
SELECT        dbo.SPMT_PaymentAdvice.AdviceNo, dbo.SPMT_PaymentAdvice.TranTypeID, dbo.SPMT_PaymentAdvice.VendorID, dbo.SPMT_PaymentAdvice.BPID, dbo.SPMT_PaymentAdvice.CostCenter, 
                         dbo.SPMT_PaymentAdvice.ConcernedHOD, dbo.SPMT_PaymentAdvice.AdviceStatusID, dbo.SPMT_PaymentAdvice.AdviceStatusOn, dbo.SPMT_PaymentAdvice.AdviceStatusUser, 
                         dbo.SPMT_PaymentAdvice.Remarks, dbo.SPMT_PaymentAdvice.RemarksHOD, dbo.SPMT_PaymentAdvice.RemarksHR, dbo.SPMT_PaymentAdvice.RemarksAC, dbo.SPMT_PaymentAdvice.Returned, 
                         dbo.SPMT_PaymentAdvice.Forward, dbo.SPMT_PaymentAdvice.ProjectID, dbo.SPMT_PaymentAdvice.ElementID, dbo.SPMT_PaymentAdvice.EmployeeID, dbo.SPMT_PaymentAdvice.DepartmentID, 
                         dbo.SPMT_PaymentAdvice.CostCenterID, dbo.SPMT_PaymentAdvice.VoucherNo, dbo.SPMT_PaymentAdvice.DocumentNo, dbo.SPMT_PaymentAdvice.BaaNCompany, dbo.SPMT_PaymentAdvice.BaaNLedger, 
                         dbo.SPMT_PaymentAdvice.SupplierName, dbo.SPMT_PaymentAdvice.AdvanceRate, dbo.SPMT_PaymentAdvice.AdvanceAmount, dbo.SPMT_PaymentAdvice.RetensionRate, 
                         dbo.SPMT_PaymentAdvice.RetensionAmount, dbo.SPMT_PaymentAdvice.UploadBatchNo, dbo.SPMT_SupplierBill.IRNo, dbo.SPMT_SupplierBill.TranTypeID AS Expr1, dbo.SPMT_SupplierBill.IRReceivedOn, 
                         dbo.SPMT_SupplierBill.VendorID AS Expr2, dbo.SPMT_SupplierBill.BillNumber, dbo.SPMT_SupplierBill.BillDate, dbo.SPMT_SupplierBill.BillAmount, dbo.SPMT_SupplierBill.BillRemarks, 
                         dbo.SPMT_SupplierBill.BillStatusID, dbo.SPMT_SupplierBill.BillStatusDate, dbo.SPMT_SupplierBill.BillStatusUser, dbo.SPMT_SupplierBill.LogisticLinked, dbo.SPMT_SupplierBill.ApprovedAmount, 
                         dbo.SPMT_SupplierBill.Remarks AS Expr3, dbo.SPMT_SupplierBill.PassedAmount, dbo.SPMT_SupplierBill.RemarksAC AS Expr4, dbo.SPMT_SupplierBill.ReturnedByAC, dbo.SPMT_SupplierBill.ReasonID, 
                         dbo.SPMT_SupplierBill.AdviceNo AS Expr5, dbo.SPMT_SupplierBill.ConcernedHOD AS Expr6, dbo.SPMT_SupplierBill.CostCenter AS Expr7, dbo.SPMT_SupplierBill.ProjectID AS Expr8, 
                         dbo.SPMT_SupplierBill.ElementID AS Expr9, dbo.SPMT_SupplierBill.EmployeeID AS Expr10, dbo.SPMT_SupplierBill.DepartmentID AS Expr11, dbo.SPMT_SupplierBill.CostCenterID AS Expr12, 
                         dbo.SPMT_SupplierBill.VoucherNo AS Expr13, dbo.SPMT_SupplierBill.DocumentNo AS Expr14, dbo.SPMT_SupplierBill.DocumentLine, dbo.SPMT_SupplierBill.BaaNCompany AS Expr15, 
                         dbo.SPMT_SupplierBill.BaaNLedger AS Expr16, dbo.SPMT_SupplierBill.IsgecGSTIN, dbo.SPMT_SupplierBill.BPID AS Expr17, dbo.SPMT_SupplierBill.SupplierGSTIN, dbo.SPMT_SupplierBill.BillType, 
                         dbo.SPMT_SupplierBill.HSNSACCode, dbo.SPMT_SupplierBill.UOM, dbo.SPMT_SupplierBill.ShipToState, dbo.SPMT_SupplierBill.Quantity, dbo.SPMT_SupplierBill.BasicValue, dbo.SPMT_SupplierBill.Discount, 
                         dbo.SPMT_SupplierBill.ServiceCharge, dbo.SPMT_SupplierBill.AssessableValue, dbo.SPMT_SupplierBill.TaxRate, dbo.SPMT_SupplierBill.TaxAmount, dbo.SPMT_SupplierBill.CessRate, 
                         dbo.SPMT_SupplierBill.CessAmount, dbo.SPMT_SupplierBill.TotalGST, dbo.SPMT_SupplierBill.TotalAmount, dbo.SPMT_SupplierBill.RemarksGST, dbo.SPMT_SupplierBill.Currency, 
                         dbo.SPMT_SupplierBill.ConversionFactorINR, dbo.SPMT_SupplierBill.TotalAmountINR, dbo.SPMT_SupplierBill.PurchaseType, dbo.SPMT_SupplierBill.IGSTRate, dbo.SPMT_SupplierBill.IGSTAmount, 
                         dbo.SPMT_SupplierBill.SGSTRate, dbo.SPMT_SupplierBill.SGSTAmount, dbo.SPMT_SupplierBill.CGSTRate, dbo.SPMT_SupplierBill.CGSTAmount, dbo.SPMT_SupplierBill.BatchNo, dbo.SPMT_SupplierBill.DocNo, 
                         dbo.SPMT_SupplierBill.DocLine, dbo.SPMT_SupplierBill.SupplierName AS Expr18, dbo.SPMT_SupplierBill.SupplierGSTINNumber, dbo.SPMT_SupplierBill.UploadBatchNo AS Expr19
FROM            dbo.SPMT_PaymentAdvice INNER JOIN
                         dbo.SPMT_SupplierBill ON dbo.SPMT_SupplierBill.AdviceNo = dbo.SPMT_PaymentAdvice.AdviceNo
WHERE        (dbo.SPMT_PaymentAdvice.AdviceStatusOn > CONVERT(datetime, '01/07/2017', 103)) 
               AND (dbo.SPMT_PaymentAdvice.DocumentNo IS NULL)

--AND (dbo.SPMT_PaymentAdvice.ProjectID IS NOT NULL)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SPMT_PaymentAdvice"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SPMT_SupplierBill"
            Begin Extent = 
               Top = 6
               Left = 261
               Bottom = 136
               Right = 470
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SPMTv_ForDhananjay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SPMTv_ForDhananjay'
GO

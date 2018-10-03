USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*WHERE     (YEAR(dbo.SPMT_PaymentAdvice.AdviceStatusOn) = 2017) 
and (Month(dbo.SPMT_PaymentAdvice.AdviceStatusOn) <= 3)*/
CREATE VIEW [dbo].[SPMTv_PADetails]
AS
SELECT        dbo.SPMT_SupplierBill.AdviceNo, dbo.SPMT_SupplierBill.IRNo, dbo.SPMT_BillStatus.Description AS BillStatus, dbo.SPMT_TranTypes.Description AS TranType, dbo.SPMT_CostCenters.Description AS CostCenter, 
                         dbo.VR_BusinessPartner.BPName AS Supplier, dbo.SPMT_SupplierBill.BillNumber, dbo.SPMT_SupplierBill.BillDate, dbo.SPMT_SupplierBill.BillAmount, dbo.SPMT_SupplierBill.ApprovedAmount, 
                         dbo.SPMT_SupplierBill.PassedAmount, REPLACE(REPLACE(dbo.SPMT_SupplierBill.Remarks, CHAR(13), ''), CHAR(10), '') AS Particulars, REPLACE(REPLACE(dbo.SPMT_PaymentAdvice.Remarks, CHAR(13), ''), CHAR(10), '') 
                         AS Remarks, dbo.SPMT_CostCenters.Location, dbo.SPMT_PaymentAdvice.AdviceStatusOn AS AdviceDate, dbo.HRM_Employees.EmployeeName AS ConcernHOD, dbo.SPMT_PaymentAdvice.AdviceStatusUser
FROM            dbo.SPMT_CostCenters RIGHT OUTER JOIN
                         dbo.SPMT_PaymentAdvice INNER JOIN
                         dbo.SPMT_SupplierBill ON dbo.SPMT_PaymentAdvice.AdviceNo = dbo.SPMT_SupplierBill.AdviceNo LEFT OUTER JOIN
                         dbo.VR_BusinessPartner ON dbo.SPMT_SupplierBill.BPID = dbo.VR_BusinessPartner.BPID ON dbo.SPMT_CostCenters.CostCenterID = dbo.SPMT_PaymentAdvice.CostCenter LEFT OUTER JOIN
                         dbo.SPMT_Vendors ON dbo.SPMT_SupplierBill.VendorID = dbo.SPMT_Vendors.VendorID LEFT OUTER JOIN
                         dbo.SPMT_TranTypes ON dbo.SPMT_SupplierBill.TranTypeID = dbo.SPMT_TranTypes.TranTypeID LEFT OUTER JOIN
                         dbo.HRM_Employees ON dbo.SPMT_PaymentAdvice.ConcernedHOD = dbo.HRM_Employees.CardNo LEFT OUTER JOIN
                         dbo.SPMT_BillStatus ON dbo.SPMT_SupplierBill.BillStatusID = dbo.SPMT_BillStatus.BillStatusID
WHERE        (dbo.SPMT_PaymentAdvice.AdviceStatusOn BETWEEN CONVERT(datetime, '01/06/2018', 103) AND CONVERT(datetime, '31/07/2018', 103))
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
         Begin Table = "SPMT_TranTypes"
            Begin Extent = 
               Top = 12
               Left = 45
               Bottom = 120
               Right = 196
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SPMT_PaymentAdvice"
            Begin Extent = 
               Top = 144
               Left = 352
               Bottom = 252
               Right = 517
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "SPMT_SupplierBill"
            Begin Extent = 
               Top = 7
               Left = 242
               Bottom = 115
               Right = 406
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "SPMT_Vendors"
            Begin Extent = 
               Top = 2
               Left = 453
               Bottom = 80
               Right = 604
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "HRM_Employees"
            Begin Extent = 
               Top = 6
               Left = 642
               Bottom = 114
               Right = 833
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SPMT_CostCenters"
            Begin Extent = 
               Top = 117
               Left = 700
               Bottom = 225
               Right = 851
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "SPMT_BillStatus"
            Begin Extent = 
               Top = 132
               Left = 46
               Bottom = 225
               Right = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SPMTv_PADetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_BusinessPartner"
            Begin Extent = 
               Top = 228
               Left = 38
               Bottom = 358
               Right = 220
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
         Alias = 1425
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1515
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SPMTv_PADetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SPMTv_PADetails'
GO

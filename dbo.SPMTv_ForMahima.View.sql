USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SPMTv_ForMahima]
AS
SELECT        dbo.SPMT_SupplierBill.AdviceNo, dbo.SPMT_SupplierBill.IRNo, dbo.SPMT_SupplierBill.IRReceivedOn, dbo.SPMT_SupplierBill.BillNumber, dbo.SPMT_SupplierBill.BillDate, dbo.SPMT_SupplierBill.BillAmount, 
                         dbo.SPMT_BillStatus.Description AS BillStatus, dbo.HRM_Departments.Description AS DepartmentName, dbo.SPMT_SupplierBill.BillRemarks, dbo.SPMT_SupplierBill.CostCenter, 
                         dbo.SPMT_SupplierBill.TranTypeID
FROM            dbo.SPMT_SupplierBill INNER JOIN
                         dbo.SPMT_PaymentAdvice ON dbo.SPMT_SupplierBill.AdviceNo = dbo.SPMT_PaymentAdvice.AdviceNo INNER JOIN
                         dbo.SPMT_BillStatus ON dbo.SPMT_SupplierBill.BillStatusID = dbo.SPMT_BillStatus.BillStatusID LEFT OUTER JOIN
                         dbo.HRM_Departments ON dbo.SPMT_SupplierBill.DepartmentID = dbo.HRM_Departments.DepartmentID
WHERE        (YEAR(dbo.SPMT_SupplierBill.IRReceivedOn) = 2017) AND (MONTH(dbo.SPMT_SupplierBill.IRReceivedOn) > 8) AND (dbo.SPMT_SupplierBill.BillStatusID > 1) AND (dbo.SPMT_SupplierBill.TranTypeID = N'A05') 
                         AND (dbo.SPMT_SupplierBill.BillStatusUser IN (N'9201', N'1228'))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[27] 2[7] 3) )"
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
         Begin Table = "SPMT_SupplierBill"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 136
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "SPMT_PaymentAdvice"
            Begin Extent = 
               Top = 0
               Left = 640
               Bottom = 130
               Right = 825
            End
            DisplayFlags = 280
            TopColumn = 23
         End
         Begin Table = "SPMT_BillStatus"
            Begin Extent = 
               Top = 6
               Left = 16
               Bottom = 119
               Right = 186
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HRM_Departments"
            Begin Extent = 
               Top = 131
               Left = 711
               Bottom = 261
               Right = 891
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
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2400
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
         GroupBy' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SPMTv_ForMahima'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SPMTv_ForMahima'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SPMTv_ForMahima'
GO

USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ELOG_DetentionBill_Report]
AS
SELECT        dbo.ELOG_DetentionBill.IRNo, dbo.ELOG_DetentionBill.IRDate, dbo.ELOG_DetentionBill.SupplierID, dbo.ELOG_DetentionBill.SupplierBillNo, dbo.ELOG_DetentionBill.SupplierBillDate, dbo.ELOG_DetentionBill.BillAmount, 
                         dbo.ELOG_DetentionBill.GRNo, dbo.ELOG_DetentionBill.GRDate, dbo.ELOG_DetentionBill.ProjectID, dbo.ELOG_DetentionBill.PONumber, dbo.ELOG_DetentionBill.StatusID, dbo.ELOG_DetentionBill.BillTypeID, 
                         dbo.ELOG_DetentionBill.OtherBillType, dbo.ELOG_DetentionBill.VehicleExeNo, dbo.ELOG_DetentionBill.MRNNo, dbo.ELOG_DetentionBill.CreatedBy, dbo.ELOG_DetentionBill.CreatedOn, dbo.VR_BusinessPartner.BPName, 
                         dbo.ELOG_DetentionBillStatus.Description, dbo.IDM_Projects.Description AS Expr1, dbo.ELOG_DetentionBillTypes.Description AS BillTypeDescription
FROM            dbo.ELOG_DetentionBill INNER JOIN
                         dbo.ELOG_DetentionBillStatus ON dbo.ELOG_DetentionBill.StatusID = dbo.ELOG_DetentionBillStatus.StatusID INNER JOIN
                         dbo.ELOG_DetentionBillTypes ON dbo.ELOG_DetentionBill.BillTypeID = dbo.ELOG_DetentionBillTypes.BillTypeID INNER JOIN
                         dbo.IDM_Projects ON dbo.ELOG_DetentionBill.ProjectID = dbo.IDM_Projects.ProjectID INNER JOIN
                         dbo.VR_BusinessPartner ON dbo.ELOG_DetentionBill.SupplierID = dbo.VR_BusinessPartner.BPID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[13] 4[51] 2[22] 3) )"
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
         Begin Table = "ELOG_DetentionBill"
            Begin Extent = 
               Top = 101
               Left = 4
               Bottom = 231
               Right = 176
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ELOG_DetentionBillStatus"
            Begin Extent = 
               Top = 4
               Left = 535
               Bottom = 100
               Right = 705
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ELOG_DetentionBillTypes"
            Begin Extent = 
               Top = 156
               Left = 649
               Bottom = 252
               Right = 819
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IDM_Projects"
            Begin Extent = 
               Top = 12
               Left = 871
               Bottom = 142
               Right = 1095
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_BusinessPartner"
            Begin Extent = 
               Top = 1
               Left = 193
               Bottom = 131
               Right = 375
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
      Begin ColumnWidths = 22
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ELOG_DetentionBill_Report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1470
         Alias = 1740
         Table = 2235
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ELOG_DetentionBill_Report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ELOG_DetentionBill_Report'
GO

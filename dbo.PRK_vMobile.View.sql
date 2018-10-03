USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PRK_vMobile]
AS
SELECT        TOP (100) PERCENT dbo.HRM_EmployeeDetails.CardNo, dbo.HRM_EmployeeDetails.EmployeeName, dbo.HRM_EmployeeDetails.Desig, dbo.HRM_EmployeeDetails.Depart, 
                         dbo.HRM_EmployeeDetails.Division, dbo.HRM_EmployeeDetails.Location, dbo.PRK_Perks.Description, dbo.PRK_BillDetails.BillNo, dbo.PRK_BillDetails.BillDate, dbo.PRK_BillDetails.FromDate, 
                         dbo.PRK_BillDetails.ToDate, dbo.PRK_BillDetails.Description AS Particulars, dbo.PRK_BillDetails.Quantity AS BillAmount, dbo.PRK_BillDetails.Amount AS PassedAmount
FROM            dbo.HRM_EmployeeDetails INNER JOIN
                         dbo.PRK_Applications ON dbo.HRM_EmployeeDetails.CardNo = RIGHT('0000' + dbo.PRK_Applications.EmployeeID, 4) INNER JOIN
                         dbo.PRK_Perks ON dbo.PRK_Applications.PerkID = dbo.PRK_Perks.PerkID INNER JOIN
                         dbo.PRK_BillDetails ON dbo.PRK_Applications.ApplicationID = dbo.PRK_BillDetails.ApplicationID
WHERE        (dbo.PRK_Applications.PerkID IN (12, 5)) AND (dbo.PRK_Applications.StatusID = 4)
ORDER BY dbo.HRM_EmployeeDetails.CardNo, dbo.PRK_BillDetails.BillDate
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[13] 2[11] 3) )"
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
         Begin Table = "HRM_EmployeeDetails"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PRK_Applications"
            Begin Extent = 
               Top = 6
               Left = 261
               Bottom = 136
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 26
         End
         Begin Table = "PRK_Perks"
            Begin Extent = 
               Top = 6
               Left = 479
               Bottom = 136
               Right = 672
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PRK_BillDetails"
            Begin Extent = 
               Top = 37
               Left = 799
               Bottom = 167
               Right = 969
            End
            DisplayFlags = 280
            TopColumn = 6
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
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
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PRK_vMobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PRK_vMobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PRK_vMobile'
GO

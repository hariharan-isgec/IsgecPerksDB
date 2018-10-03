USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VRv_RequestReport]
AS
SELECT     dbo.VR_VehicleRequest.ProjectID, REPLACE(dbo.IDM_Projects.Description, CHAR(10), ' ') AS ProjectDescription, dbo.VR_VehicleRequest.RequestNo, 
                      dbo.VR_VehicleRequest.RequestedOn, dbo.VR_VehicleRequest.SRNNo AS ExecutionNo, REPLACE(dbo.IDM_Vendors.Description, CHAR(10), ' ') 
                      AS SupplierName, dbo.VR_VehicleRequest.MaterialWeight AS CargoWeightAsPerRequest, dbo.VR_Units.Description AS WeightUnit, 
                      STR(dbo.VR_VehicleRequest.Length) + 'x' + STR(dbo.VR_VehicleRequest.Width) + 'x' + STR(dbo.VR_VehicleRequest.Height) AS CargoDimention, 
                      VR_Units_1.Description AS DimentionUnit, dbo.VR_VehicleTypes.Description AS VehicleType, dbo.VR_VehicleTypes.CapacityInKG AS VehicleCapacity, 
                      dbo.aspnet_users.UserFullName AS RequestedBy, dbo.VR_Transporters.TransporterName, 
                      dbo.VR_RequestExecution.MaterialWeight AS CargoWeightAsPerExecution, VR_Units_2.Description AS WeightUnitExecution, 
                      STR(dbo.VR_RequestExecution.Length) + 'x' + STR(dbo.VR_RequestExecution.Width) + 'x' + STR(dbo.VR_RequestExecution.Height) 
                      AS CargoDimentionAsperExecution, VR_Units_3.Description AS DimentionUnitExecution, 
                      VR_VehicleTypes_1.Description AS VehicleTypeAsPerExecution, VR_VehicleTypes_1.CapacityInKG AS VehicleCapacityExecution, 
                      aspnet_users_1.UserFullName AS ExecutedBy
FROM         dbo.aspnet_users AS aspnet_users_1 RIGHT OUTER JOIN
                      dbo.VR_Transporters INNER JOIN
                      dbo.VR_RequestExecution ON dbo.VR_Transporters.TransporterID = dbo.VR_RequestExecution.TransporterID INNER JOIN
                      dbo.VR_VehicleTypes AS VR_VehicleTypes_1 ON dbo.VR_RequestExecution.VehicleTypeID = VR_VehicleTypes_1.VehicleTypeID ON 
                      aspnet_users_1.LoginID = dbo.VR_RequestExecution.ArrangedBy LEFT OUTER JOIN
                      dbo.VR_Units AS VR_Units_3 ON dbo.VR_RequestExecution.SizeUnit = VR_Units_3.UnitID LEFT OUTER JOIN
                      dbo.VR_Units AS VR_Units_2 ON dbo.VR_RequestExecution.WeightUnit = VR_Units_2.UnitID RIGHT OUTER JOIN
                      dbo.IDM_Vendors INNER JOIN
                      dbo.VR_VehicleRequest ON dbo.IDM_Vendors.VendorID = dbo.VR_VehicleRequest.SupplierID INNER JOIN
                      dbo.IDM_Projects ON dbo.VR_VehicleRequest.ProjectID = dbo.IDM_Projects.ProjectID INNER JOIN
                      dbo.VR_VehicleTypes ON dbo.VR_VehicleRequest.VehicleTypeID = dbo.VR_VehicleTypes.VehicleTypeID LEFT OUTER JOIN
                      dbo.aspnet_users ON dbo.VR_VehicleRequest.RequestedBy = dbo.aspnet_users.LoginID LEFT OUTER JOIN
                      dbo.VR_Units AS VR_Units_1 ON dbo.VR_VehicleRequest.SizeUnit = VR_Units_1.UnitID LEFT OUTER JOIN
                      dbo.VR_Units ON dbo.VR_VehicleRequest.WeightUnit = dbo.VR_Units.UnitID ON dbo.VR_RequestExecution.SRNNo = dbo.VR_VehicleRequest.SRNNo
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[11] 2[24] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
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
         Configuration = "(H (1[56] 4) )"
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
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "VR_VehicleRequest"
            Begin Extent = 
               Top = 3
               Left = 0
               Bottom = 111
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 23
         End
         Begin Table = "IDM_Vendors"
            Begin Extent = 
               Top = 6
               Left = 295
               Bottom = 114
               Right = 446
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IDM_Projects"
            Begin Extent = 
               Top = 6
               Left = 484
               Bottom = 114
               Right = 688
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_Units"
            Begin Extent = 
               Top = 6
               Left = 726
               Bottom = 114
               Right = 891
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_Units_1"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_VehicleTypes"
            Begin Extent = 
               Top = 114
               Left = 241
               Bottom = 222
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "aspnet_users"
            Begin Extent = 
               Top = 114
               Left = 487
               Bottom = 222
               Right = 657
            E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VRv_RequestReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'nd
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "aspnet_users_1"
            Begin Extent = 
               Top = 150
               Left = 713
               Bottom = 258
               Right = 883
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_Transporters"
            Begin Extent = 
               Top = 222
               Left = 38
               Bottom = 330
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_RequestExecution"
            Begin Extent = 
               Top = 264
               Left = 242
               Bottom = 372
               Right = 461
            End
            DisplayFlags = 280
            TopColumn = 47
         End
         Begin Table = "VR_Units_2"
            Begin Extent = 
               Top = 234
               Left = 490
               Bottom = 342
               Right = 655
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_Units_3"
            Begin Extent = 
               Top = 277
               Left = 712
               Bottom = 385
               Right = 877
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_VehicleTypes_1"
            Begin Extent = 
               Top = 136
               Left = 903
               Bottom = 244
               Right = 1111
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VRv_RequestReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VRv_RequestReport'
GO

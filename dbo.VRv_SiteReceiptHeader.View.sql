USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VRv_SiteReceiptHeader]
AS
SELECT        dbo.VR_LorryReceipts.ProjectID, dbo.VR_LorryReceipts.MRNNo, convert(varchar,dbo.VR_LorryReceipts.MRNDate,105) as MRNDate, dbo.VR_LorryReceipts.RequestExecutionNo, dbo.VR_LorryReceipts.CustomerID, 
                         convert(varchar,dbo.VR_LorryReceipts.VehicleInDate,105) as VehicleInDate, dbo.VR_LorryReceipts.VehicleOutDate, dbo.VR_LorryReceipts.TransporterID, dbo.VR_LorryReceipts.TransporterName, dbo.VR_LorryReceipts.VehicleRegistrationNo, 
                         dbo.VR_LorryReceipts.WayBillFormNo, dbo.VR_LorryReceipts.PaymentMadeAtSite, dbo.VR_LorryReceipts.AmountPaid, dbo.VR_LorryReceipts.CreatedBy, convert(varchar,dbo.VR_LorryReceipts.CreatedOn,105) as CreatedOn, 
                         dbo.VR_LorryReceipts.LRStatusID, dbo.VR_LorryReceipts.VehicleTypeID, dbo.VR_LorryReceipts.VehicleType, dbo.VR_LorryReceipts.VehicleLengthInFt, dbo.VR_LorryReceipts.VechicleWidthInFt, 
                         dbo.VR_LorryReceipts.VehicleHeightInFt, dbo.VR_LorryReceipts.OverDimensionConsignment, dbo.VR_LorryReceipts.DetentionAtSite, dbo.VR_LorryReceipts.ReasonForDetention, 
                         dbo.VR_LorryReceipts.OtherRemarks, dbo.VR_LorryReceipts.MaterialStateID, dbo.VR_LorryReceipts.RemarksForDamageOrShortage, dbo.VR_LorryReceipts.DriverNameAndContactNo, 
                         aspnet_users1.UserFullName AS aspnet_Users1_UserFullName, IDM_Projects2.Description AS IDM_Projects2_Description, VR_BusinessPartner3.BPName AS VR_BusinessPartner3_BPName, 
                         VR_LorryReceiptStatus4.Description AS VR_LorryReceiptStatus4_Description, VR_MaterialStates5.Description AS VR_MaterialStates5_Description, 
                         VR_RequestExecution6.ExecutionDescription AS VR_RequestExecution6_ExecutionDescription, VR_Transporters7.TransporterName AS VR_Transporters7_TransporterName, 
                         VR_VehicleTypes8.cmba AS VR_VehicleTypes8_cmba
FROM            dbo.VR_LorryReceipts LEFT OUTER JOIN
                         dbo.aspnet_users AS aspnet_users1 ON dbo.VR_LorryReceipts.CreatedBy = aspnet_users1.LoginID INNER JOIN
                         dbo.IDM_Projects AS IDM_Projects2 ON dbo.VR_LorryReceipts.ProjectID = IDM_Projects2.ProjectID LEFT OUTER JOIN
                         dbo.VR_BusinessPartner AS VR_BusinessPartner3 ON dbo.VR_LorryReceipts.CustomerID = VR_BusinessPartner3.BPID INNER JOIN
                         dbo.VR_LorryReceiptStatus AS VR_LorryReceiptStatus4 ON dbo.VR_LorryReceipts.LRStatusID = VR_LorryReceiptStatus4.LRStatusID LEFT OUTER JOIN
                         dbo.VR_MaterialStates AS VR_MaterialStates5 ON dbo.VR_LorryReceipts.MaterialStateID = VR_MaterialStates5.MaterialStateID LEFT OUTER JOIN
                         dbo.VR_RequestExecution AS VR_RequestExecution6 ON dbo.VR_LorryReceipts.RequestExecutionNo = VR_RequestExecution6.SRNNo LEFT OUTER JOIN
                         dbo.VR_Transporters AS VR_Transporters7 ON dbo.VR_LorryReceipts.TransporterID = VR_Transporters7.TransporterID LEFT OUTER JOIN
                         dbo.VR_VehicleTypes AS VR_VehicleTypes8 ON dbo.VR_LorryReceipts.VehicleTypeID = VR_VehicleTypes8.VehicleTypeID
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
         Begin Table = "VR_LorryReceipts"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 293
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aspnet_users1"
            Begin Extent = 
               Top = 6
               Left = 331
               Bottom = 136
               Right = 520
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IDM_Projects2"
            Begin Extent = 
               Top = 6
               Left = 558
               Bottom = 136
               Right = 782
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_BusinessPartner3"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_LorryReceiptStatus4"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 234
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_MaterialStates5"
            Begin Extent = 
               Top = 138
               Left = 454
               Bottom = 234
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_RequestExecution6"
            Begin Extent = 
               Top = 138
               Left = 662
               Bottom = 268
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VRv_SiteReceiptHeader'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'          Right = 910
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_Transporters7"
            Begin Extent = 
               Top = 234
               Left = 246
               Bottom = 364
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VR_VehicleTypes8"
            Begin Extent = 
               Top = 270
               Left = 466
               Bottom = 400
               Right = 705
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VRv_SiteReceiptHeader'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VRv_SiteReceiptHeader'
GO

ALTER PROCEDURE dbo.MERGE_INVBAL
AS
BEGIN
MERGE EDW.dbo.INVBAL as target
USING EDW.stg.INVBAL as source
ON
    (
        target.SkuNumber                            = source.SkuNumber
        AND target.Store                            = source.Store
        AND target.ReceiptAmtPTD                    = source.ReceiptAmtPTD
    )
WHEN MATCHED THEN
    UPDATE 
            SET target.SkuNumber                    = source.SkuNumber,
                target.Store                        = source.Store,
                target.OnhandBOY                    = source.OnhandBOY,
                target.OnhandBOP                    = source.OnhandBOP,
                target.Onhand                       = source.Onhand,
                target.Turns                        = source.Turns,
                target.GMROI                        = source.GMROI,
                target.CurrentWkls                  = source.CurrentWkls,
                target.WeeklySales01                = source.WeeklySales01,
                target.WeeklySales02                = source.WeeklySales02,
                target.WeeklySales03                = source.WeeklySales03,
                target.WeeklySales04                = source.WeeklySales04,
                target.WeeklySales05                = source.WeeklySales05,
                target.WeeklySales06                = source.WeeklySales06,
                target.WeeklySales07                = source.WeeklySales07,
                target.WeeklySales08                = source.WeeklySales08,
                target.NumberOrdersYTD              = source.NumberOrdersYTD,
                target.LeaddaysYTD                  = source.LeaddaysYTD,
                target.RegSlsUnitsPTD               = source.RegSlsUnitsPTD,
                target.RegSlsUnitsYTD               = source.RegSlsUnitsYTD,
                target.RegSlsAmtPTD                 = source.RegSlsAmtPTD,
                target.RegSlsAmtYTD                 = source.RegSlsAmtYTD,
                target.RegSlsVATAmtPTD              = source.RegSlsVATAmtPTD,
                target.RegSlsVATAmtYTD              = source.RegSlsVATAmtYTD,
                target.RegCstAmtPTD                 = source.RegCstAmtPTD,
                target.RegCstAmtYTD                 = source.RegCstAmtYTD,
                target.AdSlsUnitsPTD                = source.AdSlsUnitsPTD,
                target.AdSlsUnitsYTD                = source.AdSlsUnitsYTD,
                target.AdSlsAmtPTD                  = source.AdSlsAmtPTD,
                target.AdSlsAmtYTD                  = source.AdSlsAmtYTD,
                target.AdSlsVATAmtPTD               = source.AdSlsVATAmtPTD,
                target.AdSlsVATAmtYTD               = source.AdSlsVATAmtYTD,
                target.AdCstAmtPTD                  = source.AdCstAmtPTD,
                target.AdCstAmtYTD                  = source.AdCstAmtYTD,
                target.RetSlsUnitsYTD               = source.RetSlsUnitsYTD,
                target.ReceiptUnitsPTD              = source.ReceiptUnitsPTD,
                target.ReceiptUnitsYTD              = source.ReceiptUnitsYTD,
                target.ReceiptAmtPTD                = source.ReceiptAmtPTD,
                target.ReceiptAmtYTD                = source.ReceiptAmtYTD,
                target.TrninUnitsPTD                = source.TrninUnitsPTD,
                target.TrninUnitsYTD                = source.TrninUnitsYTD,
                target.TrnoutUnitsPTD               = source.TrnoutUnitsPTD,
                target.TrnoutUnitsYTD               = source.TrnoutUnitsYTD,
                target.TrnsfrsAmtPTD                = source.TrnsfrsAmtPTD,
                target.TrnsfrsAmtYTD                = source.TrnsfrsAmtYTD,
                target.RTVUnitsPTD                  = source.RTVUnitsPTD,
                target.RTVUnitsYTD                  = source.RTVUnitsYTD,
                target.RTVAmtPTD                    = source.RTVAmtPTD,
                target.RTVAmtYTD                    = source.RTVAmtYTD,
                target.AdjUnitsPTD                  = source.AdjUnitsPTD,
                target.AdjUnitsYTD                  = source.AdjUnitsYTD,
                target.AdjAmtPTD                    = source.AdjAmtPTD,
                target.AdjAmtYTD                    = source.AdjAmtYTD,
                target.PhyAdjUnitsPTD               = source.PhyAdjUnitsPTD,
                target.PhyAdjUnitsYTD               = source.PhyAdjUnitsYTD,
                target.PhyAdjAmtPTD                 = source.PhyAdjAmtPTD,
                target.PhyAdjAmtYTD                 = source.PhyAdjAmtYTD,
                target.DateLastOrderedCenturyCode   = source.DateLastOrderedCenturyCode,
                target.DateLastOrdered              = source.DateLastOrdered,
                target.DateLastRecCenturyCode       = source.DateLastRecCenturyCode,
                target.DateLastReceived             = source.DateLastReceived,
                target.DateLastAdjCenturyCode       = source.DateLastAdjCenturyCode,
                target.DateLastAdjusted             = source.DateLastAdjusted,
                target.DateLastSoldCenturyCode      = source.DateLastSoldCenturyCode,
                target.DateLastSold                 = source.DateLastSold,
                target.DateOutStockCenturyCode      = source.DateOutStockCenturyCode,
                target.DateOutStock                 = source.DateOutStock,
                target.AverageCost                  = source.AverageCost,
                target.QtyLastReceived              = source.QtyLastReceived,
                target.AvgOHatWkEnd                 = source.AvgOHatWkEnd,
                target.AvgUnitRtlWkend              = source.AvgUnitRtlWkend,
                target.AvgUnitCostWkend             = source.AvgUnitCostWkend,
                target.CurrWkOutOfStock             = source.CurrWkOutOfStock,
                target.Week01OutofStock             = source.Week01OutofStock,
                target.Week02OutofStock             = source.Week02OutofStock,
                target.Week03OutofStock             = source.Week03OutofStock,
                target.Week04OutofStock             = source.Week04OutofStock,
                target.Week05OutofStock             = source.Week05OutofStock,
                target.Week06OutofStock             = source.Week06OutofStock,
                target.Week07OutofStock             = source.Week07OutofStock,
                target.Week08OutofStock             = source.Week08OutofStock,
                target.Department                   = source.Department,
                target.SubDepartment                = source.SubDepartment,
                target.Class                        = source.Class,
                target.SubClass                     = source.SubClass,
                target.DateFirstRecCenturyCode      = source.DateFirstRecCenturyCode,
                target.DateFirstReceived            = source.DateFirstReceived,
                target.VendorNumber                 = source.VendorNumber,
                target.StyleNumber                  = source.StyleNumber,
                target.POOnOrderQty                 = source.POOnOrderQty,
                target.TrfOnOrderQty                = source.TrfOnOrderQty,
                target.InTransitQty                 = source.InTransitQty,
                target.MovingAnnualSalesUnit        = source.MovingAnnualSalesUnit,
                target.MovingAnnualSalesRtl         = source.MovingAnnualSalesRtl,
                target.MovingAnnualSalesVAT         = source.MovingAnnualSalesVAT,
                target.MovingAnnualSalesCost        = source.MovingAnnualSalesCost,
                target.LandedAverageCost            = source.LandedAverageCost,
                target.AllocateReserveQuantity      = source.AllocateReserveQuantity,
                target.NonSellableInventoryQty      = source.NonSellableInventoryQty,
                target.Last_Modified                = source.Last_Modified
WHEN NOT MATCHED BY TARGET
    THEN INSERT
            (
                SkuNumber,
                Store,
                OnhandBOY,
                OnhandBOP,
                Onhand,
                Turns,
                GMROI,
                CurrentWkls,
                WeeklySales01,
                WeeklySales02,
                WeeklySales03,
                WeeklySales04,
                WeeklySales05,
                WeeklySales06,
                WeeklySales07,
                WeeklySales08,
                NumberOrdersYTD,
                LeaddaysYTD,
                RegSlsUnitsPTD,
                RegSlsUnitsYTD,
                RegSlsAmtPTD,
                RegSlsAmtYTD,
                RegSlsVATAmtPTD,
                RegSlsVATAmtYTD,
                RegCstAmtPTD,
                RegCstAmtYTD,
                AdSlsUnitsPTD,
                AdSlsUnitsYTD,
                AdSlsAmtPTD,
                AdSlsAmtYTD,
                AdSlsVATAmtPTD,
                AdSlsVATAmtYTD,
                AdCstAmtPTD,
                AdCstAmtYTD,
                RetSlsUnitsYTD,
                ReceiptUnitsPTD,
                ReceiptUnitsYTD,
                ReceiptAmtPTD,
                ReceiptAmtYTD,
                TrninUnitsPTD,
                TrninUnitsYTD,
                TrnoutUnitsPTD,
                TrnoutUnitsYTD,
                TrnsfrsAmtPTD,
                TrnsfrsAmtYTD,
                RTVUnitsPTD,
                RTVUnitsYTD,
                RTVAmtPTD,
                RTVAmtYTD,
                AdjUnitsPTD,
                AdjUnitsYTD,
                AdjAmtPTD,
                AdjAmtYTD,
                PhyAdjUnitsPTD,
                PhyAdjUnitsYTD,
                PhyAdjAmtPTD,
                PhyAdjAmtYTD,
                DateLastOrderedCenturyCode,
                DateLastOrdered,
                DateLastRecCenturyCode,
                DateLastReceived,
                DateLastAdjCenturyCode,
                DateLastAdjusted,
                DateLastSoldCenturyCode,
                DateLastSold,
                DateOutStockCenturyCode,
                DateOutStock,
                AverageCost,
                QtyLastReceived,
                AvgOHatWkEnd,
                AvgUnitRtlWkend,
                AvgUnitCostWkend,
                CurrWkOutOfStock,
                Week01OutofStock,
                Week02OutofStock,
                Week03OutofStock,
                Week04OutofStock,
                Week05OutofStock,
                Week06OutofStock,
                Week07OutofStock,
                Week08OutofStock,
                Department,
                SubDepartment,
                Class,
                SubClass,
                DateFirstRecCenturyCode,
                DateFirstReceived,
                VendorNumber,
                StyleNumber,
                POOnOrderQty,
                TrfOnOrderQty,
                InTransitQty,
                MovingAnnualSalesUnit,
                MovingAnnualSalesRtl,
                MovingAnnualSalesVAT,
                MovingAnnualSalesCost,
                LandedAverageCost,
                AllocateReserveQuantity,
                NonSellableInventoryQty,
                Last_Modified 
            )   
    VALUES
            (
                source.SkuNumber,
                source.Store,
                source.OnhandBOY,
                source.OnhandBOP,
                source.Onhand,
                source.Turns,
                source.GMROI,
                source.CurrentWkls,
                source.WeeklySales01,
                source.WeeklySales02,
                source.WeeklySales03,
                source.WeeklySales04,
                source.WeeklySales05,
                source.WeeklySales06,
                source.WeeklySales07,
                source.WeeklySales08,
                source.NumberOrdersYTD,
                source.LeaddaysYTD,
                source.RegSlsUnitsPTD,
                source.RegSlsUnitsYTD,
                source.RegSlsAmtPTD,
                source.RegSlsAmtYTD,
                source.RegSlsVATAmtPTD,
                source.RegSlsVATAmtYTD,
                source.RegCstAmtPTD,
                source.RegCstAmtYTD,
                source.AdSlsUnitsPTD,
                source.AdSlsUnitsYTD,
                source.AdSlsAmtPTD,
                source.AdSlsAmtYTD,
                source.AdSlsVATAmtPTD,
                source.AdSlsVATAmtYTD,
                source.AdCstAmtPTD,
                source.AdCstAmtYTD,
                source.RetSlsUnitsYTD,
                source.ReceiptUnitsPTD,
                source.ReceiptUnitsYTD,
                source.ReceiptAmtPTD,
                source.ReceiptAmtYTD,
                source.TrninUnitsPTD,
                source.TrninUnitsYTD,
                source.TrnoutUnitsPTD,
                source.TrnoutUnitsYTD,
                source.TrnsfrsAmtPTD,
                source.TrnsfrsAmtYTD,
                source.RTVUnitsPTD,
                source.RTVUnitsYTD,
                source.RTVAmtPTD,
                source.RTVAmtYTD,
                source.AdjUnitsPTD,
                source.AdjUnitsYTD,
                source.AdjAmtPTD,
                source.AdjAmtYTD,
                source.PhyAdjUnitsPTD,
                source.PhyAdjUnitsYTD,
                source.PhyAdjAmtPTD,
                source.PhyAdjAmtYTD,
                source.DateLastOrderedCenturyCode,
                source.DateLastOrdered,
                source.DateLastRecCenturyCode,
                source.DateLastReceived,
                source.DateLastAdjCenturyCode,
                source.DateLastAdjusted,
                source.DateLastSoldCenturyCode,
                source.DateLastSold,
                source.DateOutStockCenturyCode,
                source.DateOutStock,
                source.AverageCost,
                source.QtyLastReceived,
                source.AvgOHatWkEnd,
                source.AvgUnitRtlWkend,
                source.AvgUnitCostWkend,
                source.CurrWkOutOfStock,
                source.Week01OutofStock,
                source.Week02OutofStock,
                source.Week03OutofStock,
                source.Week04OutofStock,
                source.Week05OutofStock,
                source.Week06OutofStock,
                source.Week07OutofStock,
                source.Week08OutofStock,
                source.Department,
                source.SubDepartment,
                source.Class,
                source.SubClass,
                source.DateFirstRecCenturyCode,
                source.DateFirstReceived,
                source.VendorNumber,
                source.StyleNumber,
                source.POOnOrderQty,
                source.TrfOnOrderQty,
                source.InTransitQty,
                source.MovingAnnualSalesUnit,
                source.MovingAnnualSalesRtl,
                source.MovingAnnualSalesVAT,
                source.MovingAnnualSalesCost,
                source.LandedAverageCost,
                source.AllocateReserveQuantity,
                source.NonSellableInventoryQty,
                source.Last_Modified 
            ) 
    ;
END;                                            
    
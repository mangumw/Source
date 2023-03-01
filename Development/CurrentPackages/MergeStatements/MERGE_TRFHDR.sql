ALTER PROCEDURE dbo.MERGE_TRFHDR
AS
BEGIN
MERGE   EDW.dbo.TRFHDR as target 
USING   EDW.stg.TRFHDR as source
ON
    (
        target.TransferBatchNumber                      = source.TransferBatchNumber
        and target.TransferReferenceNumberPONumberWONumber  = source.TransferReferenceNumberPONumberWONumber
    )
 WHEN MATCHED THEN UPDATE
            SET target.TransferBatchNumber              = source.TransferBatchNumber,
                target.TransferStatusOptions            = source.TransferStatusOptions,
                target.TransferType                     = source.TransferType,
                target.TransferPriorityCodes            = source.TransferPriorityCodes,
                target.FromStoreorWarehouse             = source.FromStoreorWarehouse,
                target.ToStoreorWarehouse               = source.ToStoreorWarehouse,
                target.InitiationDateCenturyCode        = source.InitiationDateCenturyCode,
                target.InitiationDate                   = source.InitiationDate,
                target.ShipbyDateCenturyCode            = source.ShipbyDateCenturyCode,
                target.ShipbyDate                       = source.ShipbyDate,
                target.ShippingDateCenturyCode          = source.ShippingDateCenturyCode,
                target.ShippingDate                     = source.ShippingDate,
                target.ReceivingDateCenturyCode         = source.ReceivingDateCenturyCode,
                target.RecvDate                         = source.RecvDate,
                target.SpecialInstructionsLine          = source.SpecialInstructionsLine,
                target.DefaultWarehouseSlot             = source.DefaultWarehouseSlot,
                target.TransferReferenceNumberPONumberWONumber = source.TransferReferenceNumberPONumberWONumber,
                target.ShippingDocumentPrinted          = source.ShippingDocumentPrinted,
                target.TransferInitiatedByCode          = source.TransferInitiatedByCode,
                target.PurchaseOrderNumber              = source.PurchaseOrderNumber,
                target.PurchaseOrderBackOrder           = source.PurchaseOrderBackOrder,
                target.TotalUnitsRequestedforallDetail  = source.TotalUnitsRequestedforallDetail,
                target.TotalPicksRequestedforallDetail  = source.TotalPicksRequestedforallDetail,
                target.TotalPalletsRequestforallDetail  = source.TotalPalletsRequestforallDetail,
                target.TotalCartonsRequestedforallDetail    = source.TotalCartonsRequestedforallDetail,
                target.TotalInnerPacksRequestedforallDetail = source.TotalInnerPacksRequestedforallDetail,
                target.TotalRetailValueofallDetailLines = source.TotalRetailValueofallDetailLines,
                target.TotalCostValueofallDetailLines   = source.TotalCostValueofallDetailLines,
                target.TotalCubeMeasureofallDetailLines = source.TotalCubeMeasureofallDetailLines,
                target.TotalUnitsPickedofallDetail      = source.TotalUnitsPickedofallDetail,
                target.TotalPalletsPickedofallDetail    = source.TotalPalletsPickedofallDetail,
                target.TotalCartonsPickedofallDetail    = source.TotalCartonsPickedofallDetail,
                target.TotalInnerPacksPickedofallDetail = source.TotalInnerPacksPickedofallDetail,
                target.TotalRetailValueofallallPickedDetailLines    = source.TotalRetailValueofallallPickedDetailLines,
                target.TotalCostValueofallPickedDetailLines = source.TotalCostValueofallPickedDetailLines,
                target.TotalCubicMeasureofallPickedDetailLines  = source.TotalCubicMeasureofallPickedDetailLines,
                target.TransferLinestoPick              = source.TransferLinestoPick,
                target.WarehouseCycleNumber             = source.WarehouseCycleNumber,
                target.ScheduleWaveNumber               = source.ScheduleWaveNumber,
                target.ScheduleWaveSequence             = source.ScheduleWaveSequence,
                target.ScheduleName                     = source.ScheduleName,
                target.TransferXRef                     = source.TransferXRef,
                target.ConsolidateTransfer              = source.ConsolidateTransfer,
                target.Last_Modified                    = source.Last_Modified
WHEN NOT MATCHED BY TARGET THEN
        INSERT 
            (
                TransferBatchNumber,
                TransferStatusOptions,
                TransferType,
                TransferPriorityCodes,
                FromStoreorWarehouse,
                ToStoreorWarehouse,
                InitiationDateCenturyCode,
                InitiationDate,
                ShipbyDateCenturyCode,
                ShipbyDate,
                ShippingDateCenturyCode,
                ShippingDate,
                ReceivingDateCenturyCode,
                RecvDate,
                SpecialInstructionsLine,
                DefaultWarehouseSlot,
                TransferReferenceNumberPONumberWONumber,
                ShippingDocumentPrinted,
                TransferInitiatedByCode,
                PurchaseOrderNumber,
                PurchaseOrderBackOrder,
                TotalUnitsRequestedforallDetail,
                TotalPicksRequestedforallDetail,
                TotalPalletsRequestforallDetail,
                TotalCartonsRequestedforallDetail,
                TotalInnerPacksRequestedforallDetail,
                TotalRetailValueofallDetailLines,
                TotalCostValueofallDetailLines,
                TotalCubeMeasureofallDetailLines,
                TotalUnitsPickedofallDetail,
                TotalPalletsPickedofallDetail,
                TotalCartonsPickedofallDetail,
                TotalInnerPacksPickedofallDetail,
                TotalRetailValueofallallPickedDetailLines,
                TotalCostValueofallPickedDetailLines,
                TotalCubicMeasureofallPickedDetailLines,
                TransferLinestoPick,
                WarehouseCycleNumber,
                ScheduleWaveNumber,
                ScheduleWaveSequence,
                ScheduleName,
                TransferXRef,
                ConsolidateTransfer,
                Last_Modified  
            ) 
        VALUES
            (
                source.TransferBatchNumber,
                source.TransferStatusOptions,
                source.TransferType,
                source.TransferPriorityCodes,
                source.FromStoreorWarehouse,
                source.ToStoreorWarehouse,
                source.InitiationDateCenturyCode,
                source.InitiationDate,
                source.ShipbyDateCenturyCode,
                source.ShipbyDate,
                source.ShippingDateCenturyCode,
                source.ShippingDate,
                source.ReceivingDateCenturyCode,
                source.RecvDate,
                source.SpecialInstructionsLine,
                source.DefaultWarehouseSlot,
                source.TransferReferenceNumberPONumberWONumber,
                source.ShippingDocumentPrinted,
                source.TransferInitiatedByCode,
                source.PurchaseOrderNumber,
                source.PurchaseOrderBackOrder,
                source.TotalUnitsRequestedforallDetail,
                source.TotalPicksRequestedforallDetail,
                source.TotalPalletsRequestforallDetail,
                source.TotalCartonsRequestedforallDetail,
                source.TotalInnerPacksRequestedforallDetail,
                source.TotalRetailValueofallDetailLines,
                source.TotalCostValueofallDetailLines,
                source.TotalCubeMeasureofallDetailLines,
                source.TotalUnitsPickedofallDetail,
                source.TotalPalletsPickedofallDetail,
                source.TotalCartonsPickedofallDetail,
                source.TotalInnerPacksPickedofallDetail,
                source.TotalRetailValueofallallPickedDetailLines,
                source.TotalCostValueofallPickedDetailLines,
                source.TotalCubicMeasureofallPickedDetailLines,
                source.TransferLinestoPick,
                source.WarehouseCycleNumber,
                source.ScheduleWaveNumber,
                source.ScheduleWaveSequence,
                source.ScheduleName,
                source.TransferXRef,
                source.ConsolidateTransfer,
                source.Last_Modified  
            )  
    ;
END;                                  
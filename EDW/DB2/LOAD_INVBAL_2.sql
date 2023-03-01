﻿SELECT INUMBR AS SkuNumber,
       ISTORE AS Store,
       IBHBOY AS OnhandBOY,
       IBHBOP AS OnhandBOP,
       IBHAND AS Onhand,
       IBTRNS AS Turns,
       IBGMRI AS GMROI,
       IBWKCR AS CurrentWkls,
       IBWK01 AS WeeklySales01,
       IBWK02 AS WeeklySales02,
       IBWK03 AS WeeklySales03,
       IBWK04 AS WeeklySales04,
       IBWK05 AS WeeklySales05,
       IBWK06 AS WeeklySales06,
       IBWK07 AS WeeklySales07,
       IBWK08 AS WeeklySales08,
       IB#ORD AS NumberOrdersYTD,
       IBLEAD AS LeaddaysYTD,
       IBRSUP AS RegSlsUnitsPTD,
       IBRSUY AS RegSlsUnitsYTD,
       IBRSDP AS RegSlsAmtPTD,
       IBRSDY AS RegSlsAmtYTD,
       IBVRSP AS RegSlsVATAmtPTD,
       IBVRSY AS RegSlsVATAmtYTD,
       IBRCSP AS RegCstAmtPTD,
       IBRCSY AS RegCstAmtYTD,
       IBASUP AS AdSlsUnitsPTD,
       IBASUY AS AdSlsUnitsYTD,
       IBASDP AS AdSlsAmtPTD,
       IBASDY AS AdSlsAmtYTD,
       IBVASP AS AdSlsVATAmtPTD,
       IBVASY AS AdSlsVATAmtYTD,
       IBACSP AS AdCstAmtPTD,
       IBACSY AS AdCstAmtYTD,
       IBRETS AS RetSlsUnitsYTD,
       IBRCUP AS ReceiptUnitsPTD,
       IBRCUY AS ReceiptUnitsYTD,
       IBRCDP AS ReceiptAmtPTD,
       IBRCDY AS ReceiptAmtYTD,
       IBTIUP AS TrninUnitsPTD,
       IBTIUY AS TrninUnitsYTD,
       IBTOUP AS TrnoutUnitsPTD,
       IBTOUY AS TrnoutUnitsYTD,
       IBTFDP AS TrnsfrsAmtPTD,
       IBTFDY AS TrnsfrsAmtYTD,
       IBRVUP AS RTVUnitsPTD,
       IBRVUY AS RTVUnitsYTD,
       IBRVDP AS RTVAmtPTD,
       IBRVDY AS RTVAmtYTD,
       IBAJUP AS AdjUnitsPTD,
       IBAJUY AS AdjUnitsYTD,
       IBAJDP AS AdjAmtPTD,
       IBAJDY AS AdjAmtYTD,
       IBPHUP AS PhyAdjUnitsPTD,
       IBPHUY AS PhyAdjUnitsYTD,
       IBPHDP AS PhyAdjAmtPTD,
       IBPHDY AS PhyAdjAmtYTD,
       IBCEN1 AS DateLastOrderedCenturyCode,
       CASE IBCEN1
           WHEN 0 THEN DATE(TIMESTAMP_FORMAT(CHAR(IBALD1 + 19000000), 'YYYYMMDD'))
           WHEN 1 THEN to_date(CHAR(LPAD(IBALD1, 6, 0)), 'YYMMDD')
       END AS DateLastOrdered,
       IBCEN2 AS DateLastRecCenturyCode,
       CASE IBCEN2
           WHEN 0 THEN DATE(TIMESTAMP_FORMAT(CHAR(IBALD2 + 19000000), 'YYYYMMDD'))
           WHEN 1 THEN to_date(CHAR(LPAD(IBALD2, 6, 0)), 'YYMMDD')
       END AS DateLastReceived,
       IBCEN3 AS DateLastAdjCenturyCode,
       CASE IBCEN3
           WHEN 0 THEN DATE(TIMESTAMP_FORMAT(CHAR(IBALD3 + 19000000), 'YYYYMMDD'))
           WHEN 1 THEN to_date(CHAR(LPAD(IBALD3, 6, 0)), 'YYMMDD')
       END AS DateLastAdjusted,
       IBCEN4 AS DateLastSoldCenturyCode,
       CASE IBCEN4
           WHEN 0 THEN DATE(TIMESTAMP_FORMAT(CHAR(IBALD4 + 19000000), 'YYYYMMDD'))
           WHEN 1 THEN to_date(CHAR(LPAD(IBALD4, 6, 0)), 'YYMMDD')
       END AS DateLastSold,
       IBCEN5 AS DateOutStockCenturyCode,
       CASE IBCEN5
           WHEN 0 THEN DATE(TIMESTAMP_FORMAT(CHAR(IBALD5 + 19000000), 'YYYYMMDD'))
           WHEN 1 THEN to_date(CHAR(LPAD(IBALD5, 6, 0)), 'YYMMDD')
       END AS DateOutStock,
       IBAVGC AS AverageCost,
       IBQLRC AS QtyLastReceived,
       IBAVOH AS AvgOHatWkEnd,
       IBAVRT AS AvgUnitRtlWkend,
       IBAVCS AS AvgUnitCostWkend,
       IBOSCR AS CurrWkOutOfStock,
       IBOS01 AS Week01OutofStock,
       IBOS02 AS Week02OutofStock,
       IBOS03 AS Week03OutofStock,
       IBOS04 AS Week04OutofStock,
       IBOS05 AS Week05OutofStock,
       IBOS06 AS Week06OutofStock,
       IBOS07 AS Week07OutofStock,
       IBOS08 AS Week08OutofStock,
       IBDEPT AS Department,
       IBSDPT AS SubDepartment,
       IBCLAS AS Class,
       IBSCLS AS SubClass,
       IBFRCN AS DateFirstRecCenturyCode,
       CASE IBFRCN
           WHEN 0 THEN DATE(TIMESTAMP_FORMAT(CHAR(IBFRDT + 19000000), 'YYYYMMDD'))
           WHEN 1 THEN to_date(CHAR(LPAD(IBFRDT, 6, 0)), 'YYMMDD')
       END AS DateFirstReceived,
       IBVNDR AS VendorNumber,
       IBSTYL AS StyleNumber,
       IBPOOQ AS POOnOrderQty,
       IBTOOQ AS TrfOnOrderQty,
       IBINTQ AS InTransitQty,
       IBMASU AS MovingAnnualSalesUnit,
       IBMASD AS MovingAnnualSalesRtl,
       IBMASV AS MovingAnnualSalesVAT,
       IBMASC AS MovingAnnualSalesCost,
       IBLAVC AS LandedAverageCost,
       IBARQT AS AllocateReserveQuantity,
       IBNSQT AS NonSellableInventoryQty
    FROM MM4R4LIB.INVBAL
 --   WHERE IBFRDT >= (SELECT VARCHAR_FORMAT(CURRENT TIMESTAMP, 'YYMMDD') - 100 FROM SYSIBM.SYSDUMMY1)
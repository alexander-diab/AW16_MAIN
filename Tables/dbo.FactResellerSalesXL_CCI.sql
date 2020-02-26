CREATE TABLE [dbo].[FactResellerSalesXL_CCI]
(
[ProductKey] [int] NOT NULL,
[OrderDateKey] [int] NOT NULL,
[DueDateKey] [int] NOT NULL,
[ShipDateKey] [int] NOT NULL,
[ResellerKey] [int] NOT NULL,
[EmployeeKey] [int] NOT NULL,
[PromotionKey] [int] NOT NULL,
[CurrencyKey] [int] NOT NULL,
[SalesTerritoryKey] [int] NOT NULL,
[SalesOrderNumber] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SalesOrderLineNumber] [tinyint] NOT NULL,
[RevisionNumber] [tinyint] NULL,
[OrderQuantity] [smallint] NULL,
[UnitPrice] [money] NULL,
[ExtendedAmount] [money] NULL,
[UnitPriceDiscountPct] [float] NULL,
[DiscountAmount] [float] NULL,
[ProductStandardCost] [money] NULL,
[TotalProductCost] [money] NULL,
[SalesAmount] [money] NULL,
[TaxAmt] [money] NULL,
[Freight] [money] NULL,
[CarrierTrackingNumber] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerPONumber] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrderDate] [datetime] NULL,
[DueDate] [datetime] NULL,
[ShipDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactResellerSalesXL_CCI] ADD CONSTRAINT [PK_FactResellerSalesXL_CCI_SalesOrderNumber_SalesOrderLineNumber] PRIMARY KEY NONCLUSTERED  ([SalesOrderNumber], [SalesOrderLineNumber]) WITH (DATA_COMPRESSION = PAGE) ON [PRIMARY]
GO
CREATE CLUSTERED COLUMNSTORE INDEX [IndFactResellerSalesXL_CCI] ON [dbo].[FactResellerSalesXL_CCI] ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactResellerSalesXL_CCI] ADD CONSTRAINT [FK_FactResellerSalesXL_CCI_DimCurrency] FOREIGN KEY ([CurrencyKey]) REFERENCES [dbo].[DimCurrency] ([CurrencyKey])
GO
ALTER TABLE [dbo].[FactResellerSalesXL_CCI] ADD CONSTRAINT [FK_FactResellerSalesXL_CCI_DimDate] FOREIGN KEY ([OrderDateKey]) REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactResellerSalesXL_CCI] ADD CONSTRAINT [FK_FactResellerSalesXL_CCI_DimDate1] FOREIGN KEY ([DueDateKey]) REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactResellerSalesXL_CCI] ADD CONSTRAINT [FK_FactResellerSalesXL_CCI_DimDate2] FOREIGN KEY ([ShipDateKey]) REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactResellerSalesXL_CCI] ADD CONSTRAINT [FK_FactResellerSalesXL_CCI_DimEmployee] FOREIGN KEY ([EmployeeKey]) REFERENCES [dbo].[DimEmployee] ([EmployeeKey])
GO
ALTER TABLE [dbo].[FactResellerSalesXL_CCI] ADD CONSTRAINT [FK_FactResellerSalesXL_CCI_DimProduct] FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey])
GO
ALTER TABLE [dbo].[FactResellerSalesXL_CCI] ADD CONSTRAINT [FK_FactResellerSalesXL_CCI_DimPromotion] FOREIGN KEY ([PromotionKey]) REFERENCES [dbo].[DimPromotion] ([PromotionKey])
GO
ALTER TABLE [dbo].[FactResellerSalesXL_CCI] ADD CONSTRAINT [FK_FactResellerSalesXL_CCI_DimReseller] FOREIGN KEY ([ResellerKey]) REFERENCES [dbo].[DimReseller] ([ResellerKey])
GO
ALTER TABLE [dbo].[FactResellerSalesXL_CCI] ADD CONSTRAINT [FK_FactResellerSalesXL_CCI_DimSalesTerritory] FOREIGN KEY ([SalesTerritoryKey]) REFERENCES [dbo].[DimSalesTerritory] ([SalesTerritoryKey])
GO

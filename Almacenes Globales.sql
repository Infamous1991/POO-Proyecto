USE [master]
GO
/****** Object:  Database [AlmacenesGlobales]    Script Date: 11/17/2024 10:22:14 PM ******/
CREATE DATABASE [AlmacenesGlobales]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlmacenesGlobales', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AlmacenesGlobales.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AlmacenesGlobales_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AlmacenesGlobales_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AlmacenesGlobales] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlmacenesGlobales].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlmacenesGlobales] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlmacenesGlobales] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlmacenesGlobales] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AlmacenesGlobales] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlmacenesGlobales] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET RECOVERY FULL 
GO
ALTER DATABASE [AlmacenesGlobales] SET  MULTI_USER 
GO
ALTER DATABASE [AlmacenesGlobales] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlmacenesGlobales] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlmacenesGlobales] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlmacenesGlobales] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlmacenesGlobales] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AlmacenesGlobales] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AlmacenesGlobales', N'ON'
GO
ALTER DATABASE [AlmacenesGlobales] SET QUERY_STORE = ON
GO
ALTER DATABASE [AlmacenesGlobales] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AlmacenesGlobales]
GO
/****** Object:  User [nombre_usuario_user]    Script Date: 11/17/2024 10:22:14 PM ******/
CREATE USER [nombre_usuario_user] FOR LOGIN [nombre_usuario_user] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [nombre_usuario_admin]    Script Date: 11/17/2024 10:22:14 PM ******/
CREATE USER [nombre_usuario_admin] FOR LOGIN [nombre_usuario_admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [roleUser]    Script Date: 11/17/2024 10:22:14 PM ******/
CREATE ROLE [roleUser]
GO
/****** Object:  DatabaseRole [roleAdmin]    Script Date: 11/17/2024 10:22:14 PM ******/
CREATE ROLE [roleAdmin]
GO
ALTER ROLE [roleUser] ADD MEMBER [nombre_usuario_user]
GO
ALTER ROLE [roleAdmin] ADD MEMBER [nombre_usuario_admin]
GO
/****** Object:  Schema [Movimientos]    Script Date: 11/17/2024 10:22:15 PM ******/
CREATE SCHEMA [Movimientos]
GO
/****** Object:  Schema [Productos]    Script Date: 11/17/2024 10:22:15 PM ******/
CREATE SCHEMA [Productos]
GO
/****** Object:  Schema [Proveedores]    Script Date: 11/17/2024 10:22:15 PM ******/
CREATE SCHEMA [Proveedores]
GO
/****** Object:  Schema [Reportes]    Script Date: 11/17/2024 10:22:15 PM ******/
CREATE SCHEMA [Reportes]
GO
/****** Object:  Schema [Usuarios]    Script Date: 11/17/2024 10:22:15 PM ******/
CREATE SCHEMA [Usuarios]
GO
/****** Object:  Table [Productos].[Productos]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Productos].[Productos](
	[ID] [int] NOT NULL,
	[Código] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripción] [nvarchar](255) NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[StockActual] [int] NOT NULL,
	[StockMinimo] [int] NOT NULL,
	[CategoriaID] [int] NULL,
	[ProveedorID] [int] NULL,
 CONSTRAINT [PK_Productos_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Código] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Movimientos].[Entradas]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movimientos].[Entradas](
	[ID] [int] NOT NULL,
	[ProductoID] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[FechaEntrada] [date] NOT NULL,
	[TipoEntrada] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Entradas_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Movimientos].[Salidas]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movimientos].[Salidas](
	[ID] [int] NOT NULL,
	[ProductoID] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[FechaSalida] [date] NOT NULL,
	[TipoSalida] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Salidas_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Reportes].[RotacionInventario]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Vista de rotación de inventario
CREATE VIEW [Reportes].[RotacionInventario] AS
SELECT 
    p.Nombre AS Producto,
    p.Código,
    SUM(e.Cantidad) AS TotalEntradas,
    SUM(s.Cantidad) AS TotalSalidas,
    (SUM(e.Cantidad) - SUM(s.Cantidad)) AS StockFinal
FROM 
    Productos.Productos p
LEFT JOIN 
    Movimientos.Entradas e ON p.ID = e.ProductoID
LEFT JOIN 
    Movimientos.Salidas s ON p.ID = s.ProductoID
GROUP BY 
    p.Nombre, p.Código;
GO
/****** Object:  View [Reportes].[CostosAlmacenamiento]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Vista de costos de almacenamiento
CREATE VIEW [Reportes].[CostosAlmacenamiento] AS
SELECT 
    p.Nombre AS Producto,
    p.Código,
    p.Precio,
    p.StockActual,
    (p.Precio * p.StockActual) AS CostoTotal
FROM 
    Productos.Productos p;
GO
/****** Object:  Table [Movimientos].[Movimientos]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movimientos].[Movimientos](
	[ID] [int] NOT NULL,
	[ProductoID] [int] NULL,
	[TipoMovimiento] [nvarchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[FechaFinal] [date] NULL,
	[UsuarioID] [int] NULL,
    [Estado] [nvarchar](20) NOT NULL
 CONSTRAINT [PK_Movimientos_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Reportes].[ProductosMasVendidos]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Vista de los 10 productos más vendidos con ORDER BY
CREATE VIEW [Reportes].[ProductosMasVendidos] AS
SELECT TOP 10
    p.Nombre AS Producto,
    SUM(m.Cantidad) AS CantidadVendida
FROM 
    Movimientos.Movimientos m
JOIN 
    Productos.Productos p ON m.ProductoID = p.ID
WHERE 
    m.TipoMovimiento = 'Salida'
GROUP BY 
    p.Nombre
ORDER BY 
    CantidadVendida DESC;
GO
/****** Object:  View [Reportes].[ProductosEnBajoStock]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Vista de productos en bajo stock
CREATE VIEW [Reportes].[ProductosEnBajoStock] AS
SELECT 
    p.Nombre AS Producto,
    p.Código,
    p.StockActual,
    p.StockMinimo,
    CASE 
        WHEN p.StockActual < p.StockMinimo THEN 'Bajo Stock'
        ELSE 'Stock Suficiente'
    END AS EstadoStock
FROM 
    Productos.Productos p
WHERE 
    p.StockActual < p.StockMinimo;
GO
/****** Object:  View [Reportes].[VentasMensuales]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Reportes].[VentasMensuales] AS
SELECT 
    p.Nombre AS Producto,
    p.Código,
    YEAR(s.FechaSalida) AS Año,
    MONTH(s.FechaSalida) AS Mes,
    SUM(s.Cantidad) AS TotalVendido,
    SUM(s.Cantidad * p.Precio) AS Ingresos
FROM 
    Movimientos.Salidas s
JOIN 
    Productos.Productos p ON s.ProductoID = p.ID
WHERE 
    s.TipoSalida = 'Venta'
GROUP BY 
    p.Nombre, p.Código, YEAR(s.FechaSalida), MONTH(s.FechaSalida)
ORDER BY 
    Año DESC, Mes DESC
OFFSET 0 ROWS;  -- Esto es necesario para usar el ORDER BY en la vista
GO
/****** Object:  View [Reportes].[ProductosSinVentas]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Reportes].[ProductosSinVentas] AS
SELECT 
    p.Nombre AS Producto,
    p.Código
FROM 
    Productos.Productos p
LEFT JOIN 
    Movimientos.Salidas s ON p.ID = s.ProductoID AND s.TipoSalida = 'Venta'
WHERE 
    s.ID IS NULL;
GO
/****** Object:  Table [Productos].[Categorías]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Productos].[Categorías](
	[ID] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripción] [nvarchar](255) NULL,
 CONSTRAINT [PK_Categorías_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Reportes].[StockTotalPorCategoria]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Reportes].[StockTotalPorCategoria] AS
SELECT 
    c.Nombre AS Categoria,
    p.Nombre AS Producto,
    SUM(s.Cantidad) AS StockTotal
FROM 
    productos.Productos p
JOIN 
    productos.Categorías c ON p.CategoriaID = c.ID
LEFT JOIN 
    Movimientos.Entradas s ON p.ID = s.ProductoID
LEFT JOIN 
    Movimientos.Salidas o ON p.ID = o.ProductoID
GROUP BY 
    c.Nombre, p.Nombre
HAVING 
    SUM(s.Cantidad) - SUM(o.Cantidad) > 0  -- Solo productos con stock positivo
ORDER BY 
    StockTotal DESC
OFFSET 0 ROWS;  -- Esto permite el uso de ORDER BY en la vista

GO
/****** Object:  Table [Movimientos].[Pedidos]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movimientos].[Pedidos](
	[ID] [int] NOT NULL,
	[ProductoID] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[FechaPedido] [date] NOT NULL,
	[UsuarioID] [int] NULL,
    [Tipo] [nvarchar](20) NOT NULL
 CONSTRAINT [PK_Pedidos_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Proveedores].[Proveedores]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proveedores].[Proveedores](
	[ID] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Contacto] [nvarchar](100) NULL,
	[Dirección] [nvarchar](255) NULL,
 CONSTRAINT [PK_Proveedores_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Usuarios].[Usuarios]    Script Date: 11/17/2024 10:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Usuarios].[Usuarios](
	[ID] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Rol] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ProductoID_FechaEntrada]    Script Date: 11/17/2024 10:22:15 PM ******/
CREATE NONCLUSTERED INDEX [IDX_ProductoID_FechaEntrada] ON [Movimientos].[Entradas]
(
	[ProductoID] ASC,
	[FechaEntrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ProductoID_FechaSalida]    Script Date: 11/17/2024 10:22:15 PM ******/
CREATE NONCLUSTERED INDEX [IDX_ProductoID_FechaSalida] ON [Movimientos].[Salidas]
(
	[ProductoID] ASC,
	[FechaSalida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Codigo_Productos]    Script Date: 11/17/2024 10:22:15 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Codigo_Productos] ON [Productos].[Productos]
(
	[Código] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Movimientos].[Entradas]  WITH CHECK ADD  CONSTRAINT [FK_Entradas_Producto] FOREIGN KEY([ProductoID])
REFERENCES [Productos].[Productos] ([ID])
GO
ALTER TABLE [Movimientos].[Entradas] CHECK CONSTRAINT [FK_Entradas_Producto]
GO
ALTER TABLE [Movimientos].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_Producto] FOREIGN KEY([ProductoID])
REFERENCES [Productos].[Productos] ([ID])
GO
ALTER TABLE [Movimientos].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_Producto]
GO
ALTER TABLE [Movimientos].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [Usuarios].[Usuarios] ([ID])
GO
ALTER TABLE [Movimientos].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_Usuario]
GO
ALTER TABLE [Movimientos].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Producto] FOREIGN KEY([ProductoID])
REFERENCES [Productos].[Productos] ([ID])
GO
ALTER TABLE [Movimientos].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Producto]
GO
ALTER TABLE [Movimientos].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Usuario] FOREIGN KEY([UsuarioID])
REFERENCES [Usuarios].[Usuarios] ([ID])
GO
ALTER TABLE [Movimientos].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Usuario]
GO
ALTER TABLE [Movimientos].[Salidas]  WITH CHECK ADD  CONSTRAINT [FK_Salidas_Producto] FOREIGN KEY([ProductoID])
REFERENCES [Productos].[Productos] ([ID])
GO
ALTER TABLE [Movimientos].[Salidas] CHECK CONSTRAINT [FK_Salidas_Producto]
GO
ALTER TABLE [Productos].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categoría] FOREIGN KEY([CategoriaID])
REFERENCES [Productos].[Categorías] ([ID])
GO
ALTER TABLE [Productos].[Productos] CHECK CONSTRAINT [FK_Productos_Categoría]
GO
ALTER TABLE [Productos].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proveedor] FOREIGN KEY([ProveedorID])
REFERENCES [Proveedores].[Proveedores] ([ID])
GO
ALTER TABLE [Productos].[Productos] CHECK CONSTRAINT [FK_Productos_Proveedor]
GO
ALTER TABLE [Movimientos].[Entradas]  WITH CHECK ADD CHECK  (([Cantidad]>(0)))
GO
ALTER TABLE [Movimientos].[Entradas]  WITH CHECK ADD CHECK  (([TipoEntrada]='Devolución de Cliente' OR [TipoEntrada]='Compra'))
GO
ALTER TABLE [Movimientos].[Movimientos]  WITH CHECK ADD CHECK  (([Cantidad]>(0)))
GO
ALTER TABLE [Movimientos].[Movimientos]  WITH CHECK ADD CHECK  (([TipoMovimiento]='Salida' OR [TipoMovimiento]='Entrada'))
GO
ALTER TABLE [Movimientos].[Pedidos]  WITH CHECK ADD CHECK  (([Cantidad]>(0)))
GO
ALTER TABLE [Movimientos].[Salidas]  WITH CHECK ADD CHECK  (([Cantidad]>(0)))
GO
ALTER TABLE [Movimientos].[Salidas]  WITH CHECK ADD CHECK  (([TipoSalida]='Devolución a Proveedor' OR [TipoSalida]='Venta'))
GO
ALTER TABLE [Productos].[Productos]  WITH CHECK ADD CHECK  (([Precio]>=(0)))
GO
ALTER TABLE [Productos].[Productos]  WITH CHECK ADD CHECK  (([StockActual]>=(0)))
GO
ALTER TABLE [Productos].[Productos]  WITH CHECK ADD CHECK  (([StockMinimo]>=(0)))
GO
ALTER TABLE [Usuarios].[Usuarios]  WITH CHECK ADD CHECK  (([Rol]='Usuario' OR [Rol]='Administrador'))
GO
USE [master]
GO
ALTER DATABASE [AlmacenesGlobales] SET  READ_WRITE 
GO

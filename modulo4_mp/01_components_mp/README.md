# Venta de Motos - App React Native

Aplicación móvil para la gestión de venta de motos desarrollada con React Native y Expo.

## Estructura del Proyecto

```
01_components_mp/
├── src/
│   ├── app/                    # Páginas y navegación
│   │   ├── _layout.tsx         # Layout principal
│   │   ├── index.tsx           # Página de inicio
│   │   ├── explore.tsx         # Catálogo de motos
│   │   └── components/         # Componentes de página
│   │       ├── card.tsx        # Tarjeta genérica
│   │       ├── fila-info.tsx   # Fila de información
│   │       ├── tarjeta-moto.tsx    # Tarjeta de moto
│   │       ├── tarjeta-cliente.tsx # Tarjeta de cliente
│   │       └── tarjeta-venta.tsx   # Tarjeta de venta
│   ├── components/             # Componentes reutilizables
│   │   ├── themed-text.tsx     # Texto con temas
│   │   ├── themed-view.tsx     # Vista con temas
│   │   ├── external-link.tsx   # Enlace externo
│   │   ├── hint-row.tsx        # Fila de pista
│   │   ├── animated-icon.tsx   # Icono animado
│   │   ├── app-tabs.tsx        # Tabs de navegación
│   │   ├── web-badge.tsx       # Badge web
│   │   └── ui/                 # Componentes UI
│   │       └── collapsible.tsx # Sección colapsable
│   ├── hooks/                  # Custom hooks
│   │   ├── use-color-scheme.ts
│   │   ├── use-color-scheme.web.ts
│   │   └── use-theme.ts
│   ├── constants/              # Constantes
│   │   └── theme.ts           # Temas y colores
│   └── global.css             # Estilos globales
├── assets/                    # Recursos estáticos
├── scripts/                   # Scripts de utilidad
├── package.json              # Dependencias
├── tsconfig.json             # Configuración TypeScript
├── app.json                  # Configuración Expo
└── .gitignore               # Archivos ignorados
```

## Componentes Principales

- **Card**: Tarjeta genérica con título y subtítulo
- **FilaInfo**: Fila de información etiqueta-valor
- **TarjetaMoto**: Tarjeta específica para mostrar motos
- **TarjetaCliente**: Tarjeta para información de clientes
- **TarjetaVenta**: Tarjeta para transacciones de venta

## Inicio Rápido

```bash
npm install
npx expo start
```

## Tecnologías

- React Native
- Expo
- TypeScript
- React Navigation
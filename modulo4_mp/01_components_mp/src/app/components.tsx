import { Platform, ScrollView, StyleSheet, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Collapsible } from '@/components/ui/collapsible';
import { Card, FilaInfo, TarjetaMoto, TarjetaCliente, TarjetaVenta } from '@/components/motos';
import { BottomTabInset, MaxContentWidth, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';

export default function ComponentsScreen() {
  const safeAreaInsets = useSafeAreaInsets();
  const insets = {
    ...safeAreaInsets,
    bottom: safeAreaInsets.bottom + BottomTabInset + Spacing.three,
  };
  const theme = useTheme();

  const contentPlatformStyle = Platform.select({
    android: {
      paddingTop: insets.top,
      paddingLeft: insets.left,
      paddingRight: insets.right,
      paddingBottom: insets.bottom,
    },
    web: {
      paddingTop: Spacing.six,
      paddingBottom: Spacing.four,
    },
  });

  return (
    <ScrollView
      style={[styles.scrollView, { backgroundColor: theme.background }]}
      contentInset={insets}
      contentContainerStyle={[styles.contentContainer, contentPlatformStyle]}>
      <ThemedView style={styles.container}>
        <ThemedView style={styles.titleContainer}>
          <ThemedText type="subtitle">Todos los Componentes</ThemedText>
          <ThemedText style={styles.centerText} themeColor="textSecondary">
            Galeria completa de componentes del proyecto
          </ThemedText>
        </ThemedView>

        <ThemedView style={styles.sectionsWrapper}>

          {/* SECCION: ThemedText */}
          <Card titulo="ThemedText" subtitulo="Textos con soporte de temas" color="#9C27B0">
            <ThemedText type="default">Texto por defecto</ThemedText>
            <ThemedText type="small">Texto pequeno</ThemedText>
            <ThemedText type="smallBold">Texto pequeno bold</ThemedText>
            <ThemedText type="subtitle">Subtitulo</ThemedText>
            <ThemedText type="title" style={{ fontSize: 24 }}>Titulo</ThemedText>
            <ThemedText type="link">Texto enlace</ThemedText>
            <ThemedText type="linkPrimary">Enlace primario</ThemedText>
            <ThemedText type="code">Codigo monospace</ThemedText>
          </Card>

          {/* SECCION: ThemedView */}
          <Card titulo="ThemedView" subtitulo="Vistas con soporte de temas" color="#9C27B0">
            <ThemedView type="backgroundElement" style={styles.demoView}>
              <ThemedText type="small">backgroundElement</ThemedText>
            </ThemedView>
            <ThemedView type="backgroundSelected" style={styles.demoView}>
              <ThemedText type="small">backgroundSelected</ThemedText>
            </ThemedView>
          </Card>

          {/* SECCION: Collapsible */}
          <Card titulo="Collapsible" subtitulo="Secciones colapsables" color="#9C27B0">
            <Collapsible title="Seccion 1 - Marcas">
              <ThemedText type="small">Honda, Yamaha, Suzuki, Kawasaki</ThemedText>
            </Collapsible>
            <Collapsible title="Seccion 2 - Servicios">
              <ThemedText type="small">Mantenimiento, repuestos, garantia</ThemedText>
            </Collapsible>
          </Card>

          {/* SECCION: Card */}
          <Card titulo="Card" subtitulo="Tarjeta generica con titulo y subtítulo" color="#1565C0">
            <FilaInfo etiqueta="Propiedad:" valor="Valor de ejemplo" />
            <FilaInfo etiqueta="Color:" valor="Configurable" />
          </Card>

          {/* SECCION: FilaInfo */}
          <Card titulo="FilaInfo" subtitulo="Fila de informacion etiqueta-valor" color="#1565C0">
            <FilaInfo etiqueta="Motor:" valor="4 cilindros" />
            <FilaInfo etiqueta="Potencia:" valor="118 HP" />
            <FilaInfo etiqueta="Peso:" valor="194 kg" />
            <FilaInfo etiqueta="Tanque:" valor="18 litros" />
          </Card>

          {/* SECCION: TarjetaMoto */}
          <Card titulo="TarjetaMoto" subtitulo="Tarjeta para mostrar motos" color="#2E7D32">
            <TarjetaMoto
              nombre="Honda CBR 600RR"
              precio="$12,500"
              cilindraje="600cc"
              anio="2024"
              colorMoto="#E53935"
            />
            <TarjetaMoto
              nombre="Yamaha R1"
              precio="$18,900"
              cilindraje="1000cc"
              anio="2024"
              colorMoto="#1E88E5"
            />
            <TarjetaMoto
              nombre="Suzuki GSX-R750"
              precio="$14,200"
              cilindraje="750cc"
              anio="2024"
              colorMoto="#FDD835"
            />
          </Card>

          {/* SECCION: TarjetaCliente */}
          <Card titulo="TarjetaCliente" subtitulo="Tarjeta para informacion de clientes" color="#E65100">
            <TarjetaCliente
              nombre="Juan Perez"
              telefono="+593 99 123 4567"
              email="juan@email.com"
              direccion="Av. Principal 123"
            />
            <TarjetaCliente
              nombre="Maria Garcia"
              telefono="+593 98 765 4321"
              email="maria@email.com"
            />
          </Card>

          {/* SECCION: TarjetaVenta */}
          <Card titulo="TarjetaVenta" subtitulo="Tarjeta para transacciones de venta" color="#C62828">
            <TarjetaVenta
              id="001"
              moto="Honda CBR 600RR"
              cliente="Juan Perez"
              fecha="15/07/2026"
              total="$12,500"
              estado="completada"
            />
            <TarjetaVenta
              id="002"
              moto="Yamaha R1"
              cliente="Maria Garcia"
              fecha="20/07/2026"
              total="$18,900"
              estado="pendiente"
            />
            <TarjetaVenta
              id="003"
              moto="Suzuki GSX-R750"
              cliente="Carlos Lopez"
              fecha="22/07/2026"
              total="$14,200"
              estado="cancelada"
            />
          </Card>

        </ThemedView>
      </ThemedView>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  scrollView: {
    flex: 1,
  },
  contentContainer: {
    flexDirection: 'row',
    justifyContent: 'center',
  },
  container: {
    maxWidth: MaxContentWidth,
    flexGrow: 1,
  },
  titleContainer: {
    gap: Spacing.three,
    alignItems: 'center',
    paddingHorizontal: Spacing.four,
    paddingVertical: Spacing.six,
  },
  centerText: {
    textAlign: 'center',
  },
  sectionsWrapper: {
    gap: Spacing.five,
    paddingHorizontal: Spacing.four,
    paddingTop: Spacing.three,
    paddingBottom: Spacing.five,
  },
  demoView: {
    padding: Spacing.three,
    borderRadius: Spacing.two,
    alignItems: 'center',
  },
});
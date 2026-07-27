import { Platform, ScrollView, StyleSheet } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Collapsible } from '@/components/ui/collapsible';
import { Card, FilaInfo, TarjetaMoto } from '@/components/motos';
import { BottomTabInset, MaxContentWidth, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';

export default function ExploreScreen() {
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
          <ThemedText type="subtitle">Catalogo de Motos</ThemedText>
          <ThemedText style={styles.centerText} themeColor="textSecondary">
            Explora nuestra variedad de motos disponibles
          </ThemedText>
        </ThemedView>

        <ThemedView style={styles.sectionsWrapper}>
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

          <Card titulo="Especificaciones Honda CBR 600RR" color="#1565C0">
            <FilaInfo etiqueta="Motor:" valor="4 cilindros en linea" />
            <FilaInfo etiqueta="Potencia:" valor="118 HP" />
            <FilaInfo etiqueta="Peso:" valor="194 kg" />
            <FilaInfo etiqueta="Tanque:" valor="18 litros" />
            <FilaInfo etiqueta="Precio:" valor="$12,500" />
          </Card>

          <Collapsible title="Formas de Pago">
            <ThemedText type="small">
              Aceptamos efectivo, tarjeta de credito/debito, transferencia bancaria y financiamiento.
            </ThemedText>
          </Collapsible>

          <Collapsible title="Entrega Inmediata">
            <ThemedText type="small">
              Tenemos motos en stock para entrega inmediata. Consulta disponibilidad.
            </ThemedText>
          </Collapsible>
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
  },
});
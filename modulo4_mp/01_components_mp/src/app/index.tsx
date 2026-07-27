import { Platform, ScrollView, StyleSheet } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { TarjetaMoto, TarjetaCliente, TarjetaVenta } from '@/components/motos';
import { BottomTabInset, MaxContentWidth, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';

export default function HomeScreen() {
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
          <ThemedText type="title">MotoStore</ThemedText>
          <ThemedText style={styles.centerText} themeColor="textSecondary">
            Tu concesionario de motos de confianza
          </ThemedText>
        </ThemedView>

        <ThemedView style={styles.sectionsWrapper}>

          {/* Motos Destacadas */}
          <ThemedText type="subtitle">Motos Destacadas</ThemedText>

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

          {/* Cliente Destacado */}
          <ThemedText type="subtitle">Cliente Destacado</ThemedText>

          <TarjetaCliente
            nombre="Juan Perez"
            telefono="+593 99 123 4567"
            email="juan@email.com"
            direccion="Av. Principal 123, Quito"
          />

          {/* Ultimas Ventas */}
          <ThemedText type="subtitle">Ultimas Ventas</ThemedText>

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
});
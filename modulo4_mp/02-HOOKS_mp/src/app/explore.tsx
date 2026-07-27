import { Platform, ScrollView, StyleSheet } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { BottomTabInset, MaxContentWidth, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';

export default function ExploreScreen() {
  const safeAreaInsets = useSafeAreaInsets();
  const insets = { ...safeAreaInsets, bottom: safeAreaInsets.bottom + BottomTabInset + Spacing.three };
  const theme = useTheme();

  const contentPlatformStyle = Platform.select({
    android: { paddingTop: insets.top, paddingLeft: insets.left, paddingRight: insets.right, paddingBottom: insets.bottom },
    web: { paddingTop: Spacing.six, paddingBottom: Spacing.four },
  });

  return (
    <ScrollView
      style={[styles.scrollView, { backgroundColor: theme.background }]}
      contentInset={insets}
      contentContainerStyle={[styles.contentContainer, contentPlatformStyle]}
    >
      <ThemedView style={styles.container}>
        <ThemedView style={styles.titleContainer}>
          <ThemedText type="subtitle">Guia de Hooks</ThemedText>
          <ThemedText style={styles.centerText} themeColor="textSecondary">
            Aprende a usar los hooks de React Native aplicados a venta de motos
          </ThemedText>
        </ThemedView>
        <ThemedView style={styles.sectionsWrapper}>
          <ThemedText type="smallBold">Paso 1: useState</ThemedText>
          <ThemedText type="small">Contador de reintentos de conexion al sistema de ventas</ThemedText>
          <ThemedText type="smallBold">Paso 2: useEffect</ThemedText>
          <ThemedText type="small">Monitoreo periodico de inventario de motos</ThemedText>
          <ThemedText type="smallBold">Paso 3: useEffect + fetch</ThemedText>
          <ThemedText type="small">Catalogo de motos obtenido desde una API</ThemedText>
          <ThemedText type="smallBold">Paso 4: useRef</ThemedText>
          <ThemedText type="small">Foco automatico en formulario de registro de clientes</ThemedText>
          <ThemedText type="smallBold">Paso 5: Hooks nativos de RN</ThemedText>
          <ThemedText type="small">useWindowDimensions y useColorScheme para layout adaptativo</ThemedText>
          <ThemedText type="smallBold">Paso 6: Custom Hook</ThemedText>
          <ThemedText type="small">useConexionSimulada para gestionar conexion a servicios</ThemedText>
          <ThemedText type="smallBold">Paso 7: Ejemplo combinado</ThemedText>
          <ThemedText type="small">Panel de ventas completo con todos los hooks</ThemedText>
        </ThemedView>
      </ThemedView>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  scrollView: { flex: 1 },
  contentContainer: { flexDirection: 'row', justifyContent: 'center' },
  container: { maxWidth: MaxContentWidth, flexGrow: 1 },
  titleContainer: { gap: Spacing.three, alignItems: 'center', paddingHorizontal: Spacing.four, paddingVertical: Spacing.six },
  centerText: { textAlign: 'center' },
  sectionsWrapper: { gap: Spacing.five, paddingHorizontal: Spacing.four, paddingTop: Spacing.three },
});
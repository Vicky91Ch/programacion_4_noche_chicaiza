import { StyleSheet, Text, View } from 'react-native';

interface TarjetaMotoProps {
  nombre: string;
  precio: string;
  cilindraje: string;
  anio: string;
  colorMoto?: string;
}

export function TarjetaMoto({ nombre, precio, cilindraje, anio, colorMoto = '#1565C0' }: TarjetaMotoProps) {
  return (
    <View style={styles.card}>
      <View style={styles.header}>
        <View style={[styles.iconContainer, { backgroundColor: colorMoto }]}>
          <Text style={styles.iconText}>🏍️</Text>
        </View>
        <View style={styles.info}>
          <Text style={styles.nombre}>{nombre}</Text>
          <Text style={[styles.precio, { color: colorMoto }]}>{precio}</Text>
        </View>
      </View>
      <View style={styles.divider} />
      <View style={styles.details}>
        <View style={styles.chip}>
          <Text style={styles.chipText}>⚙️ {cilindraje}</Text>
        </View>
        <View style={styles.chip}>
          <Text style={styles.chipText}>📅 {anio}</Text>
        </View>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  card: {
    backgroundColor: '#ffffff',
    borderRadius: 10,
    padding: 16,
    shadowColor: '#000',
    shadowOpacity: 0.06,
    shadowRadius: 4,
    shadowOffset: { width: 0, height: 2 },
    elevation: 2,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
  },
  iconContainer: {
    width: 48,
    height: 48,
    borderRadius: 24,
    justifyContent: 'center',
    alignItems: 'center',
  },
  iconText: {
    fontSize: 24,
  },
  info: {
    flex: 1,
  },
  nombre: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1A1A1A',
  },
  precio: {
    fontSize: 14,
    fontWeight: '700',
  },
  divider: {
    height: 1,
    backgroundColor: '#E0E0E0',
    marginVertical: 12,
  },
  details: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  chip: {
    backgroundColor: '#F5F5F5',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 16,
  },
  chipText: {
    fontSize: 12,
    color: '#757575',
  },
});
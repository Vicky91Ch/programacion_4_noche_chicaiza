import { StyleSheet, Text, View } from 'react-native';

interface TarjetaVentaProps {
  id: string;
  moto: string;
  cliente: string;
  fecha: string;
  total: string;
  estado: 'completada' | 'pendiente' | 'cancelada';
}

export function TarjetaVenta({ id, moto, cliente, fecha, total, estado }: TarjetaVentaProps) {
  const estadoColor = {
    completada: '#4CAF50',
    pendiente: '#FF9800',
    cancelada: '#F44336',
  };

  return (
    <View style={styles.card}>
      <View style={styles.header}>
        <Text style={styles.id}>Venta #{id}</Text>
        <View style={[styles.badge, { backgroundColor: estadoColor[estado] }]}>
          <Text style={styles.badgeText}>{estado.toUpperCase()}</Text>
        </View>
      </View>
      <View style={styles.divider} />
      <View style={styles.details}>
        <View style={styles.detailRow}>
          <Text style={styles.detailLabel}>🏍️ Moto:</Text>
          <Text style={styles.detailValue}>{moto}</Text>
        </View>
        <View style={styles.detailRow}>
          <Text style={styles.detailLabel}>👤 Cliente:</Text>
          <Text style={styles.detailValue}>{cliente}</Text>
        </View>
        <View style={styles.detailRow}>
          <Text style={styles.detailLabel}>📅 Fecha:</Text>
          <Text style={styles.detailValue}>{fecha}</Text>
        </View>
        <View style={styles.detailRow}>
          <Text style={styles.detailLabel}>💰 Total:</Text>
          <Text style={[styles.detailValue, styles.total]}>{total}</Text>
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
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  id: {
    fontSize: 16,
    fontWeight: '700',
    color: '#1A1A1A',
  },
  badge: {
    paddingHorizontal: 8,
    paddingVertical: 4,
    borderRadius: 12,
  },
  badgeText: {
    fontSize: 10,
    fontWeight: '700',
    color: '#ffffff',
  },
  divider: {
    height: 1,
    backgroundColor: '#E0E0E0',
    marginVertical: 12,
  },
  details: {
    gap: 8,
  },
  detailRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  detailLabel: {
    fontSize: 13,
    color: '#546E7A',
    fontWeight: '500',
  },
  detailValue: {
    fontSize: 13,
    color: '#1A1A1A',
    fontFamily: 'monospace',
  },
  total: {
    fontSize: 16,
    fontWeight: '700',
    color: '#1565C0',
  },
});
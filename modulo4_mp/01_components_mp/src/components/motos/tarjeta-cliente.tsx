import { StyleSheet, Text, View } from 'react-native';

interface TarjetaClienteProps {
  nombre: string;
  telefono: string;
  email: string;
  direccion?: string;
}

export function TarjetaCliente({ nombre, telefono, email, direccion }: TarjetaClienteProps) {
  return (
    <View style={styles.card}>
      <View style={styles.header}>
        <View style={styles.avatar}>
          <Text style={styles.avatarText}>👤</Text>
        </View>
        <View style={styles.info}>
          <Text style={styles.nombre}>{nombre}</Text>
          <Text style={styles.contacto}>Cliente Registrado</Text>
        </View>
      </View>
      <View style={styles.divider} />
      <View style={styles.details}>
        <View style={styles.detailRow}>
          <Text style={styles.detailLabel}>📞 Teléfono:</Text>
          <Text style={styles.detailValue}>{telefono}</Text>
        </View>
        <View style={styles.detailRow}>
          <Text style={styles.detailLabel}>📧 Email:</Text>
          <Text style={styles.detailValue}>{email}</Text>
        </View>
        {direccion && (
          <View style={styles.detailRow}>
            <Text style={styles.detailLabel}>📍 Dirección:</Text>
            <Text style={styles.detailValue}>{direccion}</Text>
          </View>
        )}
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
  avatar: {
    width: 48,
    height: 48,
    borderRadius: 24,
    backgroundColor: '#E3F2FD',
    justifyContent: 'center',
    alignItems: 'center',
  },
  avatarText: {
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
  contacto: {
    fontSize: 12,
    color: '#757575',
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
});
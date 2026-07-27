import { StyleSheet, Text, View, Pressable } from 'react-native';
import { useConexionSimulada } from '../hooks/useConexionSimulada';

export default function Paso6() {
  const webHook = useConexionSimulada('sistema-ventas');
  const cacheHook = useConexionSimulada('inventario-cache');
  const databaseHook = useConexionSimulada('base-clientes');

  return (
    <View style={styles.contenedor}>
      <Text style={styles.titulo}>Estado de Servicios - MotoStore</Text>
      <TarjetaServicio nombre="Sistema de Ventas" hook={webHook} />
      <TarjetaServicio nombre="Cache de Inventario" hook={cacheHook} />
      <TarjetaServicio nombre="Base de Clientes" hook={databaseHook} />
    </View>
  );
}

interface PropsTarjeta {
  nombre: string;
  hook: ReturnType<typeof useConexionSimulada>;
}

function TarjetaServicio({ nombre, hook }: PropsTarjeta) {
  const { estado, intentos, latencia, reconectar, reiniciar } = hook;

  const colorEstado: Record<string, string> = {
    desconectado: '#757575',
    conectando: '#1565c0',
    conectado: '#2e7d32',
    error: '#c62828',
  };

  const textoBoton: Record<string, string> = {
    desconectado: 'Conectar',
    conectando: 'Conectando...',
    conectado: 'Reconectar',
    error: 'Reintentar',
  };

  return (
    <View style={[styles.tarjeta, { borderColor: colorEstado[estado], width: '100%' }]}>
      <View style={{ flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center' }}>
        <Text style={styles.nombreServicio}>{nombre}</Text>
        <Text style={[styles.etiqueta, { color: colorEstado[estado] }]}>
          {estado.toUpperCase()}
        </Text>
      </View>
      <Text style={styles.detalle}>
        Intentos: {intentos}
        {latencia !== null ? ` · Latencia: ${latencia} ms` : ''}
      </Text>
      <View style={{ flexDirection: 'row', gap: 8, marginTop: 8 }}>
        <Pressable
          style={({ pressed }: { pressed: boolean }) => [
            styles.boton,
            styles.botonActivo,
            estado === 'conectando' && styles.botonDeshabilitado,
            pressed && { opacity: 0.75 },
            { flex: 1 },
          ]}
          onPress={reconectar}
          disabled={estado === 'conectando'}
        >
          <Text style={styles.textoBoton}>{textoBoton[estado]}</Text>
        </Pressable>
        <Pressable
          style={({ pressed }: { pressed: boolean }) => [
            { paddingHorizontal: 16, borderRadius: 8, borderWidth: 1, borderColor: '#1565c0', justifyContent: 'center' },
            pressed && { opacity: 0.75 },
          ]}
          onPress={reiniciar}
        >
          <Text style={[styles.textoSecundario, { fontSize: 13 }]}>Reiniciar</Text>
        </Pressable>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  contenedor: { flex: 1, justifyContent: 'center', alignItems: 'center', padding: 24, backgroundColor: '#f5f5f5', gap: 16 },
  titulo: { fontSize: 20, fontWeight: '700', color: '#1a1a1a' },
  tarjeta: { width: '100%', padding: 16, borderRadius: 10, borderWidth: 2, backgroundColor: '#fff', gap: 6 },
  etiqueta: { color: '#757575', fontSize: 14, fontWeight: '600' },
  nombreServicio: { color: '#1a1a1a', fontSize: 16, fontWeight: '700' },
  detalle: { fontSize: 13, color: '#666' },
  boton: { width: '100%', paddingVertical: 14, borderRadius: 8, alignItems: 'center' },
  botonActivo: { backgroundColor: '#1565c0' },
  botonDeshabilitado: { backgroundColor: '#a5d6a7' },
  textoBoton: { color: '#fff', fontWeight: '600', fontSize: 15 },
  textoSecundario: { color: '#1565c0', fontSize: 14 },
});
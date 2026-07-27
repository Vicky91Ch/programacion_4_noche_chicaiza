import { useRef, useState, useEffect } from 'react';
import { StyleSheet, Text, TextInput, View, Pressable, ScrollView, TextInput as RNTextInput, useWindowDimensions, useColorScheme } from 'react-native';
import { useConexionSimulada } from '../hooks/useConexionSimulada';

export default function Paso7() {
  const { width } = useWindowDimensions();
  const esquema = useColorScheme();
  const esModoOscuro = esquema === 'dark';

  const colores = {
    fondo: esModoOscuro ? '#0d1b2a' : '#f0f4f8',
    tarjeta: esModoOscuro ? '#1a2a3a' : '#ffffff',
    texto: esModoOscuro ? '#e8eaed' : '#1a1a1a',
    detalle: esModoOscuro ? '#9aa0a6' : '#666666',
    borde: esModoOscuro ? '#2d3e50' : '#e0e0e0',
  };

  const { estado, intentos, latencia, reconectar, reiniciar } = useConexionSimulada('base-ventas');

  const inputFiltroRef = useRef<RNTextInput>(null);
  const [filtro, setFiltro] = useState<string>('');

  useEffect(() => {
    const timer = setTimeout(() => {
      inputFiltroRef.current?.focus();
    }, 300);
    return () => clearTimeout(timer);
  }, []);

  const [logs, setLogs] = useState<string[]>([]);

  useEffect(() => {
    if (estado !== 'conectado') return;

    const intervalo = setInterval(() => {
      const ahora = new Date().toLocaleTimeString();
      const eventos = [
        `[${ahora}] Venta registrada - Honda CBR 600RR`,
        `[${ahora}] Cliente nuevo: Juan Perez`,
        `[${ahora}] Inventario actualizado - Yamaha R1`,
        `[${ahora}] Pago confirmado - $12,500`,
      ];
      const evento = eventos[Math.floor(Math.random() * eventos.length)];
      setLogs(prev => [evento, ...prev].slice(0, 20));
    }, 1500);

    return () => clearInterval(intervalo);
  }, [estado]);

  const logsFiltrados = filtro.trim()
    ? logs.filter(l => l.toLowerCase().includes(filtro.toLowerCase()))
    : logs;

  const colorConexion: Record<string, string> = {
    desconectado: '#757575',
    conectando: '#1565c0',
    conectado: '#2e7d32',
    error: '#c62828',
  };

  const esAncho = width > 600;

  return (
    <View style={[styles.contenedor, { backgroundColor: colores.fondo }]}>
      <Text style={[styles.titulo, { color: colores.texto }]}>Panel de Ventas - MotoStore</Text>

      <View style={[styles.tarjeta, { backgroundColor: colores.tarjeta, borderColor: colorConexion[estado], width: '100%' }]}>
        <View style={{ flexDirection: 'row', justifyContent: 'space-between' }}>
          <Text style={[styles.nombreServicio, { color: colores.texto }]}>sistema-ventas</Text>
          <Text style={[styles.etiqueta, { color: colorConexion[estado] }]}>{estado.toUpperCase()}</Text>
        </View>
        <Text style={[styles.detalle, { color: colores.detalle }]}>
          192.168.1.100 · Puerto 3000 · API REST
        </Text>
        <Text style={[styles.detalle, { color: colores.detalle }]}>
          Intentos: {intentos}
          {latencia !== null ? ` · ${latencia} ms` : ''}
          {' · '}Tema: {esquema ?? 'sin preferencia'}
        </Text>
        <View style={{ flexDirection: 'row', gap: 8, marginTop: 10 }}>
          <Pressable
            style={({ pressed }: { pressed: boolean }) => [
              styles.boton,
              estado === 'conectando' ? styles.botonDeshabilitado : styles.botonActivo,
              pressed && { opacity: 0.75 },
              { flex: 1 },
            ]}
            onPress={reconectar}
            disabled={estado === 'conectando'}
          >
            <Text style={styles.textoBoton}>
              {estado === 'conectando' ? 'Conectando...' : 'Conectar / Reconectar'}
            </Text>
          </Pressable>
          <Pressable
            style={({ pressed }: { pressed: boolean }) => [
              { paddingHorizontal: 14, borderRadius: 8, borderWidth: 1, borderColor: colores.borde, justifyContent: 'center' },
              pressed && { opacity: 0.6 },
            ]}
            onPress={reiniciar}
          >
            <Text style={{ color: colores.detalle, fontSize: 13 }}>Reset</Text>
          </Pressable>
        </View>
      </View>

      <TextInput
        ref={inputFiltroRef}
        style={[styles.input, { backgroundColor: colores.tarjeta, borderColor: colores.borde, color: colores.texto, width: '100%' }]}
        value={filtro}
        onChangeText={setFiltro}
        placeholder="Filtrar logs..."
        placeholderTextColor={colores.detalle}
        autoCapitalize="none"
      />

      <ScrollView
        style={[styles.logContenedor, { backgroundColor: esModoOscuro ? '#0a1520' : '#1e1e1e', width: '100%' }]}
        showsVerticalScrollIndicator={false}
      >
        {estado !== 'conectado' ? (
          <Text style={styles.logVacio}>
            {estado === 'desconectado' || estado === 'error'
              ? 'Sin conexion - los logs aparecen al conectar'
              : 'Estableciendo conexion...'}
          </Text>
        ) : logsFiltrados.length === 0 ? (
          <Text style={styles.logVacio}>Sin entradas que coincidan con "{filtro}"</Text>
        ) : (
          logsFiltrados.map((log, i) => (
            <Text key={i} style={styles.logLinea}>{log}</Text>
          ))
        )}
      </ScrollView>

      <Text style={[styles.detalle, { color: colores.detalle, fontSize: 11 }]}>
        {Math.round(width)} dp · {esAncho ? 'layout ancho' : 'layout normal'}
      </Text>
    </View>
  );
}

const styles = StyleSheet.create({
  contenedor: { flex: 1, justifyContent: 'center', alignItems: 'center', padding: 24, gap: 16 },
  titulo: { fontSize: 20, fontWeight: '700', color: '#1a1a1a' },
  tarjeta: { width: '100%', padding: 16, borderRadius: 10, borderWidth: 2, backgroundColor: '#fff', gap: 6 },
  etiqueta: { color: '#757575', fontSize: 14, fontWeight: '600' },
  nombreServicio: { color: '#1a1a1a', fontSize: 16, fontWeight: '700' },
  detalle: { fontSize: 13, color: '#666' },
  boton: { width: '100%', paddingVertical: 14, borderRadius: 8, alignItems: 'center' },
  botonActivo: { backgroundColor: '#1565c0' },
  botonDeshabilitado: { backgroundColor: '#a5d6a7' },
  textoBoton: { color: '#fff', fontWeight: '600', fontSize: 15 },
  logContenedor: { borderRadius: 8, padding: 12, maxHeight: 220 },
  logLinea: { fontSize: 11, fontFamily: 'monospace', color: '#a8d8a8', lineHeight: 18 },
  logVacio: { fontSize: 12, color: '#666', fontStyle: 'italic' },
  input: { width: '100%', padding: 10, borderRadius: 8, borderWidth: 1, borderColor: '#ccc' },
});
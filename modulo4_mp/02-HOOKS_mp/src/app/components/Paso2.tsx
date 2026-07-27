import { useState, useEffect } from 'react';
import { StyleSheet, Text, View, Pressable } from 'react-native';

type EstadoStock = 'verificando' | 'ok' | 'alerta' | 'inactivo';

export default function Paso2() {
  const [stock, setStock] = useState<number | null>(null);
  const [estado, setEstado] = useState<EstadoStock>('inactivo');
  const [activo, setActivo] = useState<boolean>(false);
  const [ciclos, setCiclos] = useState<number>(0);

  useEffect(() => {
    if (!activo) return;

    const intervalo = setInterval(() => {
      setEstado('verificando');

      setTimeout(() => {
        const stockActual = Math.floor(Math.random() * 10);
        setStock(stockActual);
        setEstado(stockActual < 3 ? 'alerta' : 'ok');
        setCiclos(c => c + 1);
      }, 400);
    }, 2000);

    return () => clearInterval(intervalo);
  }, [activo]);

  const colorEstado: Record<EstadoStock, string> = {
    verificando: '#1565c0',
    ok: '#2e7d32',
    alerta: '#c62828',
    inactivo: '#757575',
  };

  return (
    <View style={styles.contenedor}>
      <Text style={styles.titulo}>Monitor de Inventario - Honda CBR</Text>

      <View style={styles.tarjeta}>
        <Text style={[styles.etiqueta, { color: colorEstado[estado] }]}>
          {estado.toUpperCase()}
        </Text>
        <Text style={styles.latencia}>
          {stock !== null ? `${stock} unidades` : '— unidades'}
        </Text>
        <Text style={styles.ciclos}>Verificaciones: {ciclos}</Text>
        <Text style={styles.detalle}>Honda CBR 600RR · Stock minimo: 3</Text>
      </View>

      <Pressable
        style={({ pressed }: { pressed: boolean }) => [
          styles.boton,
          activo ? styles.botonDetener : styles.botonIniciar,
          pressed && { opacity: 0.75 },
        ]}
        onPress={() => setActivo(a => !a)}
      >
        <Text style={styles.textoBoton}>
          {activo ? 'Detener monitoreo' : 'Iniciar monitoreo'}
        </Text>
      </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  contenedor: { flex: 1, justifyContent: 'center', alignItems: 'center', padding: 24, backgroundColor: '#f5f5f5', gap: 16 },
  titulo: { fontSize: 20, fontWeight: '700', color: '#1a1a1a' },
  tarjeta: { width: '100%', padding: 16, borderRadius: 10, borderWidth: 2, backgroundColor: '#fff', gap: 6 },
  etiqueta: { color: '#757575', fontSize: 14, fontWeight: '600' },
  latencia: { fontSize: 24, fontWeight: '700' },
  ciclos: { fontSize: 13, color: '#666' },
  detalle: { fontSize: 13, color: '#666' },
  boton: { width: '100%', paddingVertical: 14, borderRadius: 8, alignItems: 'center' },
  botonIniciar: { backgroundColor: '#2e7d32' },
  botonDetener: { backgroundColor: '#c62828' },
  textoBoton: { color: '#fff', fontWeight: '600', fontSize: 15 },
});
import { useWindowDimensions, useColorScheme } from 'react-native';
import { StyleSheet, Text, View } from 'react-native';

export default function Paso5() {
  const { width, height, scale } = useWindowDimensions();
  const esquema = useColorScheme();

  const colores = {
    fondo: esquema === 'dark' ? '#0d1b2a' : '#f5f5f5',
    tarjeta: esquema === 'dark' ? '#1a2a3a' : '#ffffff',
    texto: esquema === 'dark' ? '#e8eaed' : '#1a1a1a',
    detalle: esquema === 'dark' ? '#9aa0a6' : '#666666',
    borde: esquema === 'dark' ? '#2d3e50' : '#e0e0e0',
  };

  const columnas = width > 500 ? 2 : 1;
  const anchoTarjeta = (width - 48 - (columnas - 1) * 12) / columnas;

  const motos = [
    { nombre: 'Honda CBR 600RR', precio: '$12,500', estado: 'disponible' },
    { nombre: 'Yamaha R1', precio: '$18,900', estado: 'disponible' },
    { nombre: 'Suzuki GSX-R750', precio: '$14,200', estado: 'agotado' },
    { nombre: 'Kawasaki Ninja ZX-6R', precio: '$13,800', estado: 'disponible' },
  ];

  return (
    <View style={[styles.contenedor, { backgroundColor: colores.fondo }]}>
      <Text style={[styles.titulo, { color: colores.texto }]}>Inventario de Motos</Text>

      <View style={[styles.tarjeta, { backgroundColor: colores.tarjeta, borderColor: colores.borde, width: '100%' }]}>
        <Text style={[styles.etiqueta, { color: colores.detalle }]}>
          Pantalla: {Math.round(width)} x {Math.round(height)} dp
          {'  '}|{'  '}escala: {scale.toFixed(1)}
          {'  '}|{'  '}tema: {esquema ?? 'sin preferencia'}
        </Text>
      </View>

      <View style={{ flexDirection: 'row', flexWrap: 'wrap', gap: 12 }}>
        {motos.map(moto => (
          <View
            key={moto.nombre}
            style={[styles.tarjeta, { backgroundColor: colores.tarjeta, borderColor: colores.borde, width: anchoTarjeta }]}
          >
            <Text style={[styles.nombreMoto, { color: colores.texto }]}>{moto.nombre}</Text>
            <Text style={[styles.precioMoto, { color: colores.detalle }]}>{moto.precio}</Text>
            <Text style={{ fontSize: 12, fontWeight: '600', color: moto.estado === 'disponible' ? '#2e7d32' : '#c62828' }}>
              {moto.estado.toUpperCase()}
            </Text>
          </View>
        ))}
      </View>

      <View style={[styles.nota, { borderColor: colores.borde }]}>
        <Text style={[styles.notaTexto, { color: colores.detalle }]}>
          useWindowDimensions() y useColorScheme() son hooks nativos de React Native que permiten
          adaptar el layout segun el tamano de pantalla y el tema del sistema.
        </Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  contenedor: { flex: 1, padding: 24 },
  titulo: { fontSize: 24, fontWeight: '700', marginBottom: 16 },
  tarjeta: { borderWidth: 1, borderRadius: 16, padding: 16, marginBottom: 12 },
  etiqueta: { fontSize: 14, lineHeight: 20 },
  nombreMoto: { fontSize: 18, fontWeight: '700', marginBottom: 4 },
  precioMoto: { fontSize: 14, marginBottom: 8 },
  nota: { borderWidth: 1, borderRadius: 12, padding: 14, marginTop: 12 },
  notaTexto: { fontSize: 13, lineHeight: 18 },
});
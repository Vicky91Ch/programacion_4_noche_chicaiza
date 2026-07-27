import { useWindowDimensions, useColorScheme } from 'react-native'
import { StyleSheet, Text, View } from 'react-native'

export default function Paso5() {
  const { width, height, scale, fontScale } = useWindowDimensions()
  const esquema = useColorScheme()

  const colores = {
    fondo:   esquema === 'dark' ? '#0d1b2a' : '#f5f5f5',
    tarjeta: esquema === 'dark' ? '#1a2a3a' : '#ffffff',
    texto:   esquema === 'dark' ? '#e8eaed' : '#1a1a1a',
    detalle: esquema === 'dark' ? '#9aa0a6' : '#666666',
    borde:   esquema === 'dark' ? '#2d3e50' : '#e0e0e0',
  }

  const columnas = width > 500 ? 2 : 1
  const anchoTarjeta = (width - 48 - (columnas - 1) * 12) / columnas

  const motos = [
    { nombre: 'Honda CBR 600RR',   precio: '$12,500', estado: 'disponible' },
    { nombre: 'Yamaha YZF-R3',     precio: '$5,800',  estado: 'disponible' },
    { nombre: 'Kawasaki Ninja ZX',  precio: '$11,200', estado: 'reservada' },
    { nombre: 'Ducati Panigale V4', precio: '$28,500', estado: 'disponible' },
  ]

  return (
    <View style={[styles.contenedor, { backgroundColor: colores.fondo }]}>
      <Text style={[styles.titulo, { color: colores.texto }]}>
        Catálogo de Motos
      </Text>

      <View style={[styles.tarjeta, {
        backgroundColor: colores.tarjeta,
        borderColor: colores.borde,
        width: '100%',
      }]}>
        <Text style={[styles.etiqueta, { color: colores.detalle }]}>
          Pantalla: {Math.round(width)} × {Math.round(height)} dp
          {'  '}·{'  '}escala: {scale.toFixed(1)}
          {'  '}·{'  '}tema: {esquema ?? 'sin preferencia'}
        </Text>
      </View>

      <View style={{ flexDirection: 'row', flexWrap: 'wrap', gap: 12 }}>
        {motos.map(moto => (
          <View
            key={moto.nombre}
            style={[styles.tarjeta, {
              backgroundColor: colores.tarjeta,
              borderColor: colores.borde,
              width: anchoTarjeta,
            }]}
          >
            <Text style={[styles.nombreMoto, { color: colores.texto }]}>
              {moto.nombre}
            </Text>
            <Text style={[styles.precioMoto, { color: '#2e7d32' }]}>
              {moto.precio}
            </Text>
            <Text style={{
              fontSize: 12,
              fontWeight: '600',
              color: moto.estado === 'disponible' ? '#2e7d32' : '#f57f17',
            }}>
              {moto.estado.toUpperCase()}
            </Text>
          </View>
        ))}
      </View>

      <View style={[styles.nota, { borderColor: colores.borde }]}>
        <Text style={[styles.notaTexto, { color: colores.detalle }]}>
          useSafeAreaInsets() — disponible desde react-native-safe-area-context.
          El hook expone los valores numéricos {'{'}top, bottom, left, right{'}'} para
          posicionar elementos manualmente respetando el notch y la barra de inicio.
        </Text>
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
    backgroundColor: '#f5f5f5',
    gap: 16,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a1a1a',
  },
  tarjeta: {
    width: '100%',
    padding: 16,
    borderRadius: 10,
    borderWidth: 2,
    backgroundColor: '#fff',
    gap: 6,
  },
  etiqueta: {
    color: '#757575',
    fontSize: 14,
    fontWeight: '600',
  },
  nombreMoto: {
    color: '#1a1a1a',
    fontSize: 16,
    fontWeight: '700',
  },
  precioMoto: {
    color: '#2e7d32',
    fontSize: 14,
    fontWeight: '500',
  },
  nota: {
    width: '100%',
    padding: 12,
    borderWidth: 1,
    borderRadius: 8,
  },
  notaTexto: {
    fontSize: 12,
    color: '#666',
  },
})

import { StyleSheet, Text, View } from 'react-native'

interface TarjetaMotoProps {
  marca: string
  modelo: string
  anio: number
  precio: number
}

export function TarjetaMoto({ marca, modelo, anio, precio }: TarjetaMotoProps) {
  return (
    <View style={styles.tarjeta}>
      <Text style={styles.nombreMoto}>{marca} {modelo}</Text>
      <Text style={styles.datoAnio}>{anio}</Text>
      <Text style={styles.datoPrecio}>${precio.toLocaleString()}</Text>
    </View>
  )
}

const styles = StyleSheet.create({
  tarjeta: {
    backgroundColor: '#ffffff',
    borderRadius: 10,
    padding: 16,
    gap: 4,
    shadowColor: '#000',
    shadowOpacity: 0.06,
    shadowRadius: 4,
    shadowOffset: { width: 0, height: 2 },
    elevation: 2,
  },
  nombreMoto: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1a1a1a',
  },
  datoAnio: {
    fontSize: 13,
    color: '#1565c0',
    fontFamily: 'monospace',
  },
  datoPrecio: {
    fontSize: 14,
    fontWeight: '700',
    color: '#2e7d32',
  },
})

import { useEffect, useState } from 'react'
import {
  ActivityIndicator,
  FlatList,
  StyleSheet,
  Text,
  View,
} from 'react-native'

type Moto = {
  id: number
  title: string
  price: number
  category: string
}

export default function Paso3() {
  const [motos, setMotos] = useState<Moto[]>([])
  const [cargando, setCargando] = useState(true)
  const [error, setError] = useState('')

  useEffect(() => {
    async function obtenerMotos() {
      try {
        const response = await fetch('https://fakestoreapi.com/products')

        if (!response.ok) {
          throw new Error('Error al consultar la API')
        }

        const data: Moto[] = await response.json()
        setMotos(data)
      } catch (err) {
        setError('No se pudieron obtener las motos del catálogo')
      } finally {
        setCargando(false)
      }
    }

    obtenerMotos()
  }, [])

  if (cargando) {
    return (
      <View style={styles.center}>
        <ActivityIndicator size="large" />
        <Text>Cargando catálogo de motos...</Text>
      </View>
    )
  }

  if (error) {
    return (
      <View style={styles.center}>
        <Text>{error}</Text>
      </View>
    )
  }

  return (
    <View style={styles.container}>
      <Text style={styles.titulo}>Catálogo de Motos</Text>

      <FlatList
        data={motos}
        keyExtractor={(item) => item.id.toString()}
        renderItem={({ item }) => (
          <View style={styles.card}>
            <Text style={styles.nombre}>{item.title}</Text>
            <Text>Categoría: {item.category}</Text>
            <Text style={styles.precio}>${item.price}</Text>
          </View>
        )}
      />
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
  },
  center: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  titulo: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 15,
  },
  card: {
    backgroundColor: '#f5f5f5',
    padding: 15,
    borderRadius: 8,
    marginBottom: 10,
  },
  nombre: {
    fontWeight: 'bold',
    fontSize: 16,
  },
  precio: {
    marginTop: 5,
    color: 'green',
    fontWeight: 'bold',
  },
})

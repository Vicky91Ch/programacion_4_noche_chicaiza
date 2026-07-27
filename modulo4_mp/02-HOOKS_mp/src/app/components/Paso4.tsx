import { useRef, useState, useEffect } from 'react'
import {
  StyleSheet, Text, TextInput, View, Pressable, TextInput as RNTextInput
} from 'react-native'

export default function Paso4() {
  const inputMarcaRef = useRef<RNTextInput>(null)
  const inputModeloRef = useRef<RNTextInput>(null)

  const [marca, setMarca] = useState<string>('')
  const [modelo, setModelo] = useState<string>('')

  useEffect(() => {
    inputMarcaRef.current?.focus()
  }, [])

  const intentosSilenciosRef = useRef<number>(0)
  const [ultimaBusqueda, setUltimaBusqueda] = useState<string>('—')

  function buscarMoto() {
    intentosSilenciosRef.current += 1
    setUltimaBusqueda(
      `${marca || 'marca'} ${modelo || 'modelo'} — búsqueda #${intentosSilenciosRef.current}`
    )
  }

  return (
    <View style={styles.contenedor}>
      <Text style={styles.titulo}>Buscar Motocicleta</Text>

      <View style={styles.formulario}>
        <Text style={styles.etiqueta}>Marca</Text>
        <TextInput
          ref={inputMarcaRef}
          style={styles.input}
          value={marca}
          onChangeText={setMarca}
          placeholder="Honda, Yamaha, Kawasaki..."
          placeholderTextColor="#aaa"
          autoCapitalize="none"
          returnKeyType="next"
          onSubmitEditing={() => inputModeloRef.current?.focus()}
        />

        <Text style={styles.etiqueta}>Modelo</Text>
        <TextInput
          ref={inputModeloRef}
          style={styles.input}
          value={modelo}
          onChangeText={setModelo}
          placeholder="CBR 600RR, YZF-R3..."
          placeholderTextColor="#aaa"
          returnKeyType="done"
        />
      </View>

      <Pressable
        style={({ pressed }) => [styles.boton, styles.botonActivo, pressed && { opacity: 0.75 }]}
        onPress={buscarMoto}
      >
        <Text style={styles.textoBoton}>Buscar</Text>
      </Pressable>

      <Text style={styles.detalle}>Última búsqueda: {ultimaBusqueda}</Text>
      <Text style={styles.detalle}>
        (las búsquedas silenciosas no causan re-renders)
      </Text>
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
  detalle: {
    fontSize: 13,
    color: '#666',
  },
  boton: {
    width: '100%',
    paddingVertical: 14,
    borderRadius: 8,
    alignItems: 'center',
  },
  botonActivo: {
    backgroundColor: '#1565c0',
  },
  textoBoton: {
    color: '#fff',
    fontWeight: '600',
    fontSize: 15,
  },
  etiqueta: {
    color: '#757575',
    fontSize: 14,
    fontWeight: '600',
  },
  formulario: {
    width: '100%',
    gap: 12,
  },
  input: {
    width: '100%',
    padding: 10,
  },
})

// app/index.tsx — agrega la función Paso3
import { useRef, useState, useEffect } from 'react'
import {
  StyleSheet, Text, TextInput, View, Pressable, TextInput as RNTextInput
} from 'react-native'

export default function Paso4() {
  // ── Uso 1: referencia a un TextInput para foco programático ─────────
  const inputHostRef = useRef<RNTextInput>(null)
  const inputPuertoRef = useRef<RNTextInput>(null)

  const [host, setHost] = useState<string>('')
  const [puerto, setPuerto] = useState<string>('22')

  // Foco automático al montar la pantalla
  useEffect(() => {
    inputHostRef.current?.focus()
  }, [])

  // ── Uso 2: contador de intentos silencioso (sin re-render) ───────────
  const intentosSilenciosRef = useRef<number>(0)
  const [ultimaConexion, setUltimaConexion] = useState<string>('—')

  function intentarConexion() {
    intentosSilenciosRef.current += 1   // muta sin re-render
    // Solo actualizamos el estado (y disparamos re-render) al conectar
    setUltimaConexion(
      `${host || 'servidor'}:${puerto} — intento #${intentosSilenciosRef.current}`
    )
  }

  return (
    <View style={styles.contenedor}>
      <Text style={styles.titulo}>Configurar Conexión SSH</Text>

      <View style={styles.formulario}>
        <Text style={styles.etiqueta}>Host o IP</Text>
        <TextInput
          ref={inputHostRef}
          style={styles.input}
          value={host}
          onChangeText={setHost}
          placeholder="10.0.2.10"
          placeholderTextColor="#aaa"
          autoCapitalize="none"
          returnKeyType="next"
          onSubmitEditing={() => inputPuertoRef.current?.focus()}
        />

        <Text style={styles.etiqueta}>Puerto SSH</Text>
        <TextInput
          ref={inputPuertoRef}
          style={styles.input}
          value={puerto}
          onChangeText={setPuerto}
          placeholder="22"
          placeholderTextColor="#aaa"
          keyboardType="number-pad"
          returnKeyType="done"
        />
      </View>

      <Pressable
        style={({ pressed }) => [styles.boton, styles.botonActivo, pressed && { opacity: 0.75 }]}
        onPress={intentarConexion}
      >
        <Text style={styles.textoBoton}>Conectar</Text>
      </Pressable>

      <Text style={styles.detalle}>Último intento: {ultimaConexion}</Text>
      <Text style={styles.detalle}>
        (los reintentos silenciosos no causan re-renders)
      </Text>
    </View>
  )
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    padding: 16,
    backgroundColor: '#fff',
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    marginBottom: 16,
  },
  formulario: {
    marginBottom: 16,
  },
  etiqueta: {
    fontSize: 14,
    marginBottom: 8,
    color: '#333',
  },
  input: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 8,
    paddingHorizontal: 12,
    paddingVertical: 10,
    marginBottom: 12,
    color: '#000',
  },
  boton: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 14,
    borderRadius: 8,
  },
  botonActivo: {
    backgroundColor: '#007aff',
  },
  textoBoton: {
    color: '#fff',
    fontWeight: '700',
  },
  detalle: {
    marginTop: 12,
    color: '#555',
  },
});
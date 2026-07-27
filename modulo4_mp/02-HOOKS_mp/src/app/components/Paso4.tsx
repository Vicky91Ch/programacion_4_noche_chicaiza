import { useRef, useState, useEffect } from 'react';
import { StyleSheet, Text, TextInput, View, Pressable, TextInput as RNTextInput } from 'react-native';

export default function Paso4() {
  const inputNombreRef = useRef<RNTextInput>(null);
  const inputTelefonoRef = useRef<RNTextInput>(null);

  const [nombre, setNombre] = useState<string>('');
  const [telefono, setTelefono] = useState<string>('');

  useEffect(() => {
    inputNombreRef.current?.focus();
  }, []);

  const intentosSilenciososRef = useRef<number>(0);
  const [ultimoRegistro, setUltimoRegistro] = useState<string>('—');

  function registrarCliente() {
    intentosSilenciososRef.current += 1;
    setUltimoRegistro(
      `${nombre || 'Cliente'}:${telefono} — registro #${intentosSilenciososRef.current}`
    );
  }

  return (
    <View style={styles.contenedor}>
      <Text style={styles.titulo}>Registrar Cliente</Text>

      <View style={styles.formulario}>
        <Text style={styles.etiqueta}>Nombre completo</Text>
        <TextInput
          ref={inputNombreRef}
          style={styles.input}
          value={nombre}
          onChangeText={setNombre}
          placeholder="Juan Perez"
          placeholderTextColor="#aaa"
          autoCapitalize="words"
          returnKeyType="next"
          onSubmitEditing={() => inputTelefonoRef.current?.focus()}
        />

        <Text style={styles.etiqueta}>Telefono</Text>
        <TextInput
          ref={inputTelefonoRef}
          style={styles.input}
          value={telefono}
          onChangeText={setTelefono}
          placeholder="+593 99 123 4567"
          placeholderTextColor="#aaa"
          keyboardType="phone-pad"
          returnKeyType="done"
        />
      </View>

      <Pressable
        style={({ pressed }: { pressed: boolean }) => [styles.boton, styles.botonActivo, pressed && { opacity: 0.75 }]}
        onPress={registrarCliente}
      >
        <Text style={styles.textoBoton}>Registrar</Text>
      </Pressable>

      <Text style={styles.detalle}>Ultimo registro: {ultimoRegistro}</Text>
      <Text style={styles.detalle}>(los registros silenciosos no causan re-renders)</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  contenedor: { flex: 1, padding: 16, backgroundColor: '#fff' },
  titulo: { fontSize: 20, fontWeight: '700', marginBottom: 16 },
  formulario: { marginBottom: 16 },
  etiqueta: { fontSize: 14, marginBottom: 8, color: '#333' },
  input: { borderWidth: 1, borderColor: '#ccc', borderRadius: 8, paddingHorizontal: 12, paddingVertical: 10, marginBottom: 12, color: '#000' },
  boton: { alignItems: 'center', justifyContent: 'center', paddingVertical: 14, borderRadius: 8 },
  botonActivo: { backgroundColor: '#007aff' },
  textoBoton: { color: '#fff', fontWeight: '700' },
  detalle: { marginTop: 12, color: '#555' },
});
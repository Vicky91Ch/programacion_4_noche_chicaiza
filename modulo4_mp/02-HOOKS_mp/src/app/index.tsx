import { useState } from 'react';
import { View, Text, Pressable, StyleSheet, ScrollView } from 'react-native';
import Paso1 from './components/Paso1';
import Paso2 from './components/Paso2';
import Paso3 from './components/Paso3';
import Paso4 from './components/Paso4';
import Paso5 from './components/Paso5';
import Paso6 from './components/Paso6';
import Paso7 from './components/Paso7';

const PASOS = [
  { numero: 1, titulo: 'useState', descripcion: 'Conexion al Sistema de Ventas' },
  { numero: 2, titulo: 'useEffect', descripcion: 'Monitor de Inventario de Motos' },
  { numero: 3, titulo: 'useEffect + fetch', descripcion: 'Catalogo de Motos' },
  { numero: 4, titulo: 'useRef', descripcion: 'Registro de Clientes' },
  { numero: 5, titulo: 'Hooks nativos de RN', descripcion: 'Layout adaptativo' },
  { numero: 6, titulo: 'Custom Hook', descripcion: 'useConexionSimulada' },
  { numero: 7, titulo: 'Ejemplo combinado', descripcion: 'Panel de Ventas MotoStore' },
];

const pasosComponents = [Paso1, Paso2, Paso3, Paso4, Paso5, Paso6, Paso7];

export default function Index() {
  const [pasoActual, setPasoActual] = useState<number>(1);

  const PasoComponent = pasosComponents[pasoActual - 1];

  return (
    <View style={styles.contenedor}>
      {/* Barra de navegacion */}
      <View style={styles.navBar}>
        <Pressable
          style={({ pressed }) => [
            styles.botonNav,
            pasoActual === 1 && styles.botonDeshabilitado,
            pressed && { opacity: 0.75 },
          ]}
          onPress={() => setPasoActual(p => Math.max(1, p - 1))}
          disabled={pasoActual === 1}
        >
          <Text style={styles.textoNav}>{'<'}</Text>
        </Pressable>

        <View style={styles.infoPaso}>
          <Text style={styles.tituloPaso}>Paso {pasoActual}: {PASOS[pasoActual - 1].titulo}</Text>
          <Text style={styles.descripcionPaso}>{PASOS[pasoActual - 1].descripcion}</Text>
        </View>

        <Pressable
          style={({ pressed }) => [
            styles.botonNav,
            pasoActual === 7 && styles.botonDeshabilitado,
            pressed && { opacity: 0.75 },
          ]}
          onPress={() => setPasoActual(p => Math.min(7, p + 1))}
          disabled={pasoActual === 7}
        >
          <Text style={styles.textoNav}>{'>'}</Text>
        </Pressable>
      </View>

      {/* Indicador de pasos */}
      <View style={styles.indicador}>
        {PASOS.map((paso) => (
          <Pressable
            key={paso.numero}
            style={[
              styles.punto,
              pasoActual === paso.numero && styles.puntoActivo,
            ]}
            onPress={() => setPasoActual(paso.numero)}
          />
        ))}
      </View>

      {/* Contenido del paso actual */}
      <ScrollView style={styles.contenido} contentContainerStyle={styles.contenidoContainer}>
        <PasoComponent />
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  contenedor: { flex: 1, backgroundColor: '#f5f5f5' },
  navBar: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    padding: 12,
    backgroundColor: '#fff',
    borderBottomWidth: 1,
    borderBottomColor: '#e0e0e0',
  },
  botonNav: {
    paddingHorizontal: 16,
    paddingVertical: 10,
    backgroundColor: '#1565c0',
    borderRadius: 8,
  },
  botonDeshabilitado: { backgroundColor: '#ccc' },
  textoNav: { color: '#fff', fontSize: 18, fontWeight: '700' },
  infoPaso: { flex: 1, alignItems: 'center', marginHorizontal: 10 },
  tituloPaso: { fontSize: 14, fontWeight: '700', color: '#1a1a1a' },
  descripcionPaso: { fontSize: 11, color: '#666' },
  indicador: {
    flexDirection: 'row',
    justifyContent: 'center',
    gap: 8,
    paddingVertical: 10,
    backgroundColor: '#fff',
    borderBottomWidth: 1,
    borderBottomColor: '#e0e0e0',
  },
  punto: {
    width: 10,
    height: 10,
    borderRadius: 5,
    backgroundColor: '#ccc',
  },
  puntoActivo: { backgroundColor: '#1565c0' },
  contenido: { flex: 1 },
  contenidoContainer: { flexGrow: 1 },
});

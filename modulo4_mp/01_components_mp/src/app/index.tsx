// app/index.tsx
import { SafeAreaView, ScrollView, StyleSheet, Text, View } from 'react-native'
import { Card } from './components/Card'
import { FilaInfo } from './components/FilaInfo'
import { TarjetaMoto } from './components/TarjetaMoto'

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Props tipadas — TarjetaMoto                         │
// │  2  Paso 2  children y composición — Card reutilizable           │
// │  3  Paso 3  Props opcionales y BadgeEstado                      │
// │  4  Paso 4  ScrollView y SafeAreaView                           │
// │  5  Paso 5  Modal de confirmación                               │
// │  6  Paso 6  Pantalla completa — detalle de moto                 │
// └──────────────────────────────────────────────────────────────────┘
const PASO = 6

export default function Index() {
  switch (PASO) {
    case 1:
      return <Paso1 />
    case 2:
      return <Paso2 />
    case 3:
      return <Paso3 />
    case 4:
      return <Paso4 />
    case 5:
      return <Paso5 />
    case 6:
      return <Paso6 />
    default:
      return (
        <View style={styles.fondo}>
          <Text>Paso {PASO}: crea el componente primero</Text>
        </View>
      )
  }
}

// ─── Paso 1 — Props tipadas ──────────────────────────────────────────

function Paso1() {
  return (
    <View style={styles.fondo}>
      <Text style={styles.encabezado}>Inventario de Motos</Text>
      <TarjetaMoto
        marca="Honda"
        modelo="CBR 600RR"
        anio={2024}
        precio={12500}
      />
      <TarjetaMoto
        marca="Yamaha"
        modelo="YZF-R3"
        anio={2024}
        precio={5800}
      />
      <TarjetaMoto
        marca="Kawasaki"
        modelo="Ninja ZX-6R"
        anio={2023}
        precio={11200}
      />
      <TarjetaMoto
        marca="Suzuki"
        modelo="GSX-R750"
        anio={2024}
        precio={13400}
      />
    </View>
  )
}

function Paso2() {
  return (
    <View style={styles.fondo}>
      <Text style={styles.titulo}>Detalle de motocicleta</Text>
      <Card titulo="Honda CBR 600RR" subtitulo="Deportiva 600cc">
        <FilaInfo etiqueta="Marca" valor="Honda" />
        <FilaInfo etiqueta="Modelo" valor="CBR 600RR" />
        <FilaInfo etiqueta="Año" valor="2024" />
        <FilaInfo etiqueta="Motor" valor="599cc · 4 cilindros" />
        <FilaInfo etiqueta="Potencia" valor="118 HP" />
      </Card>
      <Card titulo="Especificaciones">
        <FilaInfo etiqueta="Peso" valor="186 kg" />
        <FilaInfo etiqueta="Tanque" valor="18 litros" />
        <FilaInfo etiqueta="Freno" valor="Doble disco ABS" />
      </Card>
      <Card titulo="Disponibilidad" color='#21df70'>
        <FilaInfo etiqueta="Stock" valor="3 unidades" />
        <FilaInfo etiqueta="Color" valor="Rojo / Negro" />
        <FilaInfo etiqueta="Garantía" valor="2 años" />
      </Card>
    </View>
  )
}

const styles = StyleSheet.create({
  fondo: {
    flex: 1,
    backgroundColor: '#f0f4f8',
    padding: 20,
    paddingTop: 60,
    gap: 12,
  },
  centrado: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  encabezado: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a237e',
    marginBottom: 4,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a237e',
  },
})

// ─── Paso 3 — Props opcionales ───────────────────────────────────────

type EstadoMoto = 'disponible' | 'reservada' | 'vendida' | 'mantenimiento'

interface BadgeEstadoProps {
  estado: EstadoMoto
  tamaño?: number
  mostrarIcono?: boolean
}

const COLOR_ESTADO: Record<EstadoMoto, { fondo: string; texto: string }> = {
  disponible:   { fondo: '#e8f5e9', texto: '#2e7d32' },
  reservada:    { fondo: '#fff8e1', texto: '#f57f17' },
  vendida:      { fondo: '#f5f5f5', texto: '#616161' },
  mantenimiento: { fondo: '#fce4ec', texto: '#c62828' },
}

const ICONO_ESTADO: Record<EstadoMoto, string> = {
  disponible:   '●',
  reservada:    '◐',
  vendida:      '○',
  mantenimiento: '✕',
}

function BadgeEstado({
  estado,
  tamaño = 12,
  mostrarIcono = false,
}: BadgeEstadoProps) {
  const colores = COLOR_ESTADO[estado]
  return (
    <View style={[estilos3.badge, { backgroundColor: colores.fondo }]}>
      {mostrarIcono && (
        <Text style={[estilos3.icono, { color: colores.texto, fontSize: tamaño }]}>
          {ICONO_ESTADO[estado]}{' '}
        </Text>
      )}
      <Text style={[estilos3.textoBadge, { color: colores.texto, fontSize: tamaño }]}>
        {estado.toUpperCase()}
      </Text>
    </View>
  )
}

interface FilaMotoProps {
  marca: string
  modelo: string
  estado: EstadoMoto
  precio?: number
}

function FilaMoto({ marca, modelo, estado, precio }: FilaMotoProps) {
  return (
    <View style={estilos3.fila}>
      <View style={estilos3.infoIzq}>
        <Text style={estilos3.nombreMoto}>{marca} {modelo}</Text>
      </View>
      <View style={estilos3.infoDer}>
        {precio !== undefined && (
          <Text style={estilos3.precio}>${precio.toLocaleString()}</Text>
        )}
        <BadgeEstado estado={estado} mostrarIcono tamaño={11} />
      </View>
    </View>
  )
}

function Paso3() {
  return (
    <View style={estilos3.fondo}>
      <Text style={estilos3.titulo}>Estado del inventario</Text>
      <FilaMoto marca="Honda"    modelo="CBR 600RR"     estado="disponible"    precio={12500} />
      <FilaMoto marca="Yamaha"   modelo="YZF-R3"        estado="disponible"    precio={5800}  />
      <FilaMoto marca="Kawasaki" modelo="Ninja ZX-6R"   estado="reservada"     precio={11200} />
      <FilaMoto marca="Suzuki"   modelo="GSX-R750"      estado="vendida"                  />
      <FilaMoto marca="Ducati"   modelo="Panigale V4"   estado="mantenimiento"             />
    </View>
  )
}

const estilos3 = StyleSheet.create({
  fondo: {
    flex: 1,
    backgroundColor: '#f0f4f8',
    padding: 20,
    paddingTop: 60,
    gap: 8,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a237e',
    marginBottom: 8,
  },
  fila: {
    backgroundColor: '#ffffff',
    borderRadius: 10,
    paddingHorizontal: 16,
    paddingVertical: 14,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOpacity: 0.05,
    shadowRadius: 3,
    shadowOffset: { width: 0, height: 1 },
    elevation: 1,
  },
  infoIzq: { gap: 2 },
  infoDer: { alignItems: 'flex-end', gap: 4 },
  nombreMoto: { fontSize: 14, fontWeight: '600', color: '#1a1a1a' },
  precio: { fontSize: 12, color: '#2e7d32', fontWeight: '600' },
  badge: {
    flexDirection: 'row',
    alignItems: 'center',
    borderRadius: 4,
    paddingHorizontal: 6,
    paddingVertical: 2,
  },
  icono: { fontWeight: '700' },
  textoBadge: { fontWeight: '600' },
})

// ─── Paso 4 — ScrollView y SafeAreaView ──────────────────────────────

const MOTOS_DEMO = [
  { id: '1',  marca: 'Honda',    modelo: 'CBR 600RR',     anio: 2024, precio: 12500, stock: 3,  color: 'Rojo' },
  { id: '2',  marca: 'Yamaha',   modelo: 'YZF-R3',        anio: 2024, precio: 5800,  stock: 5,  color: 'Azul' },
  { id: '3',  marca: 'Kawasaki', modelo: 'Ninja ZX-6R',   anio: 2023, precio: 11200, stock: 2,  color: 'Verde' },
  { id: '4',  marca: 'Suzuki',   modelo: 'GSX-R750',      anio: 2024, precio: 13400, stock: 1,  color: 'Negro' },
  { id: '5',  marca: 'Ducati',   modelo: 'Panigale V4',   anio: 2024, precio: 28500, stock: 1,  color: 'Rojo' },
  { id: '6',  marca: 'BMW',      modelo: 'S1000RR',       anio: 2023, precio: 16800, stock: 2,  color: 'Blanco' },
  { id: '7',  marca: 'KTM',      modelo: 'RC 390',        anio: 2024, precio: 5200,  stock: 4,  color: 'Naranja' },
  { id: '8',  marca: 'Honda',    modelo: 'Africa Twin',   anio: 2024, precio: 14900, stock: 2,  color: 'Azul' },
  { id: '9',  marca: 'Yamaha',   modelo: 'MT-09',         anio: 2023, precio: 9800,  stock: 3,  color: 'Negro' },
  { id: '10', marca: 'Kawasaki', modelo: 'Z900',          anio: 2024, precio: 9500,  stock: 2,  color: 'Verde' },
  { id: '11', marca: 'Triumph',  modelo: 'Speed Triple',  anio: 2024, precio: 15600, stock: 1,  color: 'Rojo' },
  { id: '12', marca: 'Aprilia',  modelo: 'RSV4',          anio: 2023, precio: 22000, stock: 1,  color: 'Negro' },
]

interface BarraStockProps {
  cantidad: number
  etiqueta: string
}

function BarraStock({ cantidad, etiqueta }: BarraStockProps) {
  const maxStock = 5
  const porcentaje = Math.min((cantidad / maxStock) * 100, 100)
  const color = cantidad <= 1 ? '#c62828'
              : cantidad <= 2 ? '#f57f17'
              : '#2e7d32'
  return (
    <View style={estilos4.barraFila}>
      <Text style={estilos4.barraEtiqueta}>{etiqueta}</Text>
      <View style={estilos4.barraFondo}>
        <View style={[estilos4.barraRelleno, { width: `${porcentaje}%` as any, backgroundColor: color }]} />
      </View>
      <Text style={[estilos4.barraPct, { color }]}>{cantidad}</Text>
    </View>
  )
}

function TarjetaInventario({ marca, modelo, anio, precio, stock, color }: typeof MOTOS_DEMO[0]) {
  return (
    <View style={estilos4.nodo}>
      <View style={estilos4.nodoEncabezado}>
        <Text style={estilos4.nodoNombre}>{marca} {modelo}</Text>
        <Text style={estilos4.nodoPrecio}>${precio.toLocaleString()}</Text>
      </View>
      <Text style={estilos4.nodoDetalle}>{anio} · {color}</Text>
      <BarraStock cantidad={stock} etiqueta="Stock" />
    </View>
  )
}

function Paso4() {
  return (
    <SafeAreaView style={estilos4.safeArea}>
      <View style={estilos4.header}>
        <Text style={estilos4.headerTitulo}>Catálogo de Motos</Text>
        <Text style={estilos4.headerSub}>{MOTOS_DEMO.length} motocicletas disponibles</Text>
      </View>
      <ScrollView
        style={estilos4.scroll}
        contentContainerStyle={estilos4.scrollContenido}
        showsVerticalScrollIndicator={false}
      >
        {MOTOS_DEMO.map((moto) => (
          <TarjetaInventario key={moto.id} {...moto} />
        ))}
      </ScrollView>
    </SafeAreaView>
  )
}

const estilos4 = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: '#0d1b2a',
  },
  header: {
    paddingHorizontal: 20,
    paddingTop: 16,
    paddingBottom: 12,
    borderBottomWidth: 1,
    borderBottomColor: '#1c2e40',
  },
  headerTitulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#e3f2fd',
  },
  headerSub: {
    fontSize: 12,
    color: '#78909c',
    marginTop: 2,
  },
  scroll: { flex: 1 },
  scrollContenido: {
    padding: 16,
    gap: 10,
    paddingBottom: 40,
  },
  nodo: {
    backgroundColor: '#132232',
    borderRadius: 10,
    padding: 14,
    gap: 8,
    borderWidth: 1,
    borderColor: '#1c3548',
  },
  nodoEncabezado: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'baseline',
  },
  nodoNombre: {
    fontSize: 14,
    fontWeight: '700',
    color: '#e3f2fd',
  },
  nodoPrecio: {
    fontSize: 14,
    color: '#4fc3f7',
    fontWeight: '700',
  },
  nodoDetalle: {
    fontSize: 11,
    color: '#546e7a',
    marginBottom: 2,
  },
  barraFila: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
  },
  barraEtiqueta: {
    fontSize: 11,
    color: '#78909c',
    width: 36,
  },
  barraFondo: {
    flex: 1,
    height: 4,
    backgroundColor: '#1c3548',
    borderRadius: 2,
    overflow: 'hidden',
  },
  barraRelleno: {
    height: '100%',
    borderRadius: 2,
  },
  barraPct: {
    fontSize: 11,
    fontWeight: '600',
    width: 34,
    textAlign: 'right',
  },
})

// ─── Paso 5 — Modal de confirmación ──────────────────────────────────

import { useState } from 'react'
import { Modal, Pressable } from 'react-native'

interface ModalConfirmProps {
  visible: boolean
  titulo: string
  mensaje: string
  etiquetaConfirmar?: string
  etiquetaCancelar?: string
  onConfirmar: () => void
  onCancelar: () => void
}

function ModalConfirm({
  visible,
  titulo,
  mensaje,
  etiquetaConfirmar = 'Confirmar',
  etiquetaCancelar = 'Cancelar',
  onConfirmar,
  onCancelar,
}: ModalConfirmProps) {
  return (
    <Modal
      visible={visible}
      transparent
      animationType="fade"
      onRequestClose={onCancelar}
    >
      <Pressable style={estilos5.fondo} onPress={onCancelar}>
        <Pressable style={estilos5.dialogo} onPress={() => {}}>
          <Text style={estilos5.dialogoTitulo}>{titulo}</Text>
          <Text style={estilos5.dialogoMensaje}>{mensaje}</Text>
          <View style={estilos5.botones}>
            <Pressable
              style={[estilos5.boton, estilos5.botonCancelar]}
              onPress={onCancelar}
            >
              <Text style={estilos5.textoCancelar}>{etiquetaCancelar}</Text>
            </Pressable>
            <Pressable
              style={[estilos5.boton, estilos5.botonConfirmar]}
              onPress={onConfirmar}
            >
              <Text style={estilos5.textoConfirmar}>{etiquetaConfirmar}</Text>
            </Pressable>
          </View>
        </Pressable>
      </Pressable>
    </Modal>
  )
}

function Paso5() {
  const [modalVisible, setModalVisible] = useState(false)
  const [accionEjecutada, setAccionEjecutada] = useState<string | null>(null)

  return (
    <SafeAreaView style={estilos5.safeArea}>
      <Text style={estilos5.titulo}>Gestión de Venta</Text>
      <Text style={estilos5.subtitulo}>Honda CBR 600RR · $12,500</Text>

      <View style={estilos5.acciones}>
        <Pressable
          style={estilos5.botonAccion}
          onPress={() => {
            setAccionEjecutada(null)
            setModalVisible(true)
          }}
        >
          <Text style={estilos5.textoAccion}>Confirmar compra</Text>
        </Pressable>
      </View>

      {accionEjecutada && (
        <View style={estilos5.resultado}>
          <Text style={estilos5.textoResultado}>{accionEjecutada}</Text>
        </View>
      )}

      <ModalConfirm
        visible={modalVisible}
        titulo="Confirmar compra"
        mensaje={`¿Deseas comprar la Honda CBR 600RR?\nPrecio: $12,500`}
        etiquetaConfirmar="Comprar"
        onConfirmar={() => {
          setModalVisible(false)
          setAccionEjecutada('Compra registrada a las ' + new Date().toLocaleTimeString())
        }}
        onCancelar={() => setModalVisible(false)}
      />
    </SafeAreaView>
  )
}

const estilos5 = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: '#f0f4f8',
    padding: 24,
    paddingTop: 60,
  },
  titulo: {
    fontSize: 22,
    fontWeight: '700',
    color: '#1a237e',
  },
  subtitulo: {
    fontSize: 14,
    color: '#546e7a',
    marginTop: 4,
    marginBottom: 32,
    fontFamily: 'monospace',
  },
  acciones: { gap: 12 },
  botonAccion: {
    backgroundColor: '#1565c0',
    borderRadius: 10,
    paddingVertical: 14,
    alignItems: 'center',
  },
  textoAccion: {
    color: '#fff',
    fontWeight: '700',
    fontSize: 15,
  },
  resultado: {
    marginTop: 24,
    backgroundColor: '#e8f5e9',
    borderRadius: 8,
    padding: 14,
  },
  textoResultado: {
    color: '#2e7d32',
    fontSize: 13,
    fontFamily: 'monospace',
  },
  fondo: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.55)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  dialogo: {
    backgroundColor: '#ffffff',
    borderRadius: 16,
    padding: 24,
    width: '85%',
    gap: 12,
    shadowColor: '#000',
    shadowOpacity: 0.2,
    shadowRadius: 12,
    shadowOffset: { width: 0, height: 6 },
    elevation: 10,
  },
  dialogoTitulo: {
    fontSize: 17,
    fontWeight: '700',
    color: '#1a1a1a',
  },
  dialogoMensaje: {
    fontSize: 14,
    color: '#546e7a',
    lineHeight: 20,
  },
  botones: {
    flexDirection: 'row',
    gap: 10,
    marginTop: 4,
  },
  boton: {
    flex: 1,
    borderRadius: 8,
    paddingVertical: 12,
    alignItems: 'center',
  },
  botonCancelar: {
    backgroundColor: '#f5f5f5',
  },
  botonConfirmar: {
    backgroundColor: '#1565c0',
  },
  textoCancelar: {
    color: '#424242',
    fontWeight: '600',
    fontSize: 14,
  },
  textoConfirmar: {
    color: '#ffffff',
    fontWeight: '700',
    fontSize: 14,
  },
})

// ─── Paso 6 — Pantalla completa de detalle ───────────────────────────

interface AccionProps {
  etiqueta: string
  color: string
  onPress: () => void
}

function BotonAccion({ etiqueta, color, onPress }: AccionProps) {
  return (
    <Pressable
      style={({ pressed }) => [
        estilos6.botonAccion,
        { backgroundColor: color },
        pressed && { opacity: 0.75 },
      ]}
      onPress={onPress}
    >
      <Text style={estilos6.textoBotonAccion}>{etiqueta}</Text>
    </Pressable>
  )
}

function Paso6() {
  const [modalVisible, setModalVisible] = useState(false)
  const [accionPendiente, setAccionPendiente] = useState<string>('')
  const [log, setLog] = useState<string[]>([])

  function pedirConfirmacion(accion: string) {
    setAccionPendiente(accion)
    setModalVisible(true)
  }

  function ejecutarAccion() {
    const entrada = `[${new Date().toLocaleTimeString()}] ${accionPendiente} — Honda CBR 600RR`
    setLog((prev) => [entrada, ...prev])
    setModalVisible(false)
  }

  return (
    <SafeAreaView style={estilos6.safeArea}>
      <View style={estilos6.cabecera}>
        <View>
          <Text style={estilos6.cabNombre}>Honda CBR 600RR</Text>
          <Text style={estilos6.cabDetalle}>2024 · Deportiva 600cc</Text>
        </View>
        <BadgeEstado estado="disponible" mostrarIcono tamaño={12} />
      </View>

      <ScrollView
        contentContainerStyle={estilos6.scrollContenido}
        showsVerticalScrollIndicator={false}
      >
        <Card titulo="Especificaciones" subtitulo="Ficha técnica">
          <FilaInfo etiqueta="Motor" valor="599cc · 4 cilindros en línea" />
          <FilaInfo etiqueta="Potencia" valor="118 HP @ 13,500 RPM" />
          <FilaInfo etiqueta="Torque" valor="64 Nm @ 11,500 RPM" />
          <FilaInfo etiqueta="Peso" valor="186 kg en seco" />
          <FilaInfo etiqueta="Tanque" valor="18 litros" />
        </Card>

        <Card titulo="Información de venta">
          <FilaInfo etiqueta="Precio" valor="$12,500" />
          <FilaInfo etiqueta="Disponibilidad" valor="3 unidades" />
          <FilaInfo etiqueta="Color" valor="Rojo / Negro" />
          <FilaInfo etiqueta="Garantía" valor="2 años" />
          <FilaInfo etiqueta="Financiamiento" valor="Disponible" />
        </Card>

        <Card titulo="Acciones">
          <View style={estilos6.gridAcciones}>
            <BotonAccion
              etiqueta="Reservar"
              color="#1565c0"
              onPress={() => pedirConfirmacion('Reserva')}
            />
            <BotonAccion
              etiqueta="Vender"
              color="#2e7d32"
              onPress={() => pedirConfirmacion('Venta')}
            />
            <BotonAccion
              etiqueta="Agendar prueba"
              color="#6a1b9a"
              onPress={() => pedirConfirmacion('Prueba de manejo')}
            />
            <BotonAccion
              etiqueta="Cotizar"
              color="#f57f17"
              onPress={() => pedirConfirmacion('Cotización')}
            />
          </View>
        </Card>

        {log.length > 0 && (
          <Card titulo="Actividad reciente">
            {log.map((entrada, i) => (
              <Text key={i} style={estilos6.entradaLog}>{entrada}</Text>
            ))}
          </Card>
        )}
      </ScrollView>

      <ModalConfirm
        visible={modalVisible}
        titulo={`Confirmar: ${accionPendiente}`}
        mensaje={`¿Ejecutar "${accionPendiente}" para la Honda CBR 600RR?`}
        etiquetaConfirmar="Ejecutar"
        onConfirmar={ejecutarAccion}
        onCancelar={() => setModalVisible(false)}
      />
    </SafeAreaView>
  )
}

const estilos6 = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: '#f0f4f8',
  },
  cabecera: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: 20,
    paddingVertical: 14,
    backgroundColor: '#ffffff',
    borderBottomWidth: 1,
    borderBottomColor: '#e0e7ef',
  },
  cabNombre: {
    fontSize: 18,
    fontWeight: '700',
    color: '#1a237e',
  },
  cabDetalle: {
    fontSize: 12,
    color: '#78909c',
    fontFamily: 'monospace',
    marginTop: 2,
  },
  scrollContenido: {
    padding: 16,
    gap: 14,
    paddingBottom: 40,
  },
  gridAcciones: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 10,
  },
  botonAccion: {
    borderRadius: 8,
    paddingVertical: 10,
    paddingHorizontal: 16,
    minWidth: '45%',
    alignItems: 'center',
  },
  textoBotonAccion: {
    color: '#ffffff',
    fontWeight: '600',
    fontSize: 14,
  },
  entradaLog: {
    fontSize: 11,
    color: '#2e7d32',
    fontFamily: 'monospace',
    lineHeight: 18,
  },
})

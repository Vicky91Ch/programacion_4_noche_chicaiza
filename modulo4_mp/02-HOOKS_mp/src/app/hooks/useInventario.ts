import { useState, useEffect, useCallback } from 'react';

interface Moto {
  id: number;
  nombre: string;
  precio: number;
  cilindraje: string;
  marca: string;
  stock: number;
}

type EstadoInventario = 'cargando' | 'listo' | 'error';

interface ResultadoInventario {
  motos: Moto[];
  estado: EstadoInventario;
  total: number;
  motosSinStock: number;
  recargar: () => void;
  filtrarPorMarca: (marca: string) => void;
}

const MOTOS_SIMULADAS: Moto[] = [
  { id: 1, nombre: 'Honda CBR 600RR', precio: 12500, cilindraje: '600cc', marca: 'Honda', stock: 3 },
  { id: 2, nombre: 'Yamaha R1', precio: 18900, cilindraje: '1000cc', marca: 'Yamaha', stock: 2 },
  { id: 3, nombre: 'Suzuki GSX-R750', precio: 14200, cilindraje: '750cc', marca: 'Suzuki', stock: 0 },
  { id: 4, nombre: 'Kawasaki Ninja ZX-6R', precio: 13800, cilindraje: '636cc', marca: 'Kawasaki', stock: 4 },
  { id: 5, nombre: 'Honda CB 500F', precio: 6500, cilindraje: '500cc', marca: 'Honda', stock: 5 },
  { id: 6, nombre: 'Yamaha MT-09', precio: 9800, cilindraje: '847cc', marca: 'Yamaha', stock: 1 },
];

export function useInventario(): ResultadoInventario {
  const [motos, setMotos] = useState<Moto[]>([]);
  const [estado, setEstado] = useState<EstadoInventario>('cargando');
  const [filtroMarca, setFiltroMarca] = useState<string>('');

  const cargarDatos = useCallback(() => {
    setEstado('cargando');
    setTimeout(() => {
      setMotos(MOTOS_SIMULADAS);
      setEstado('listo');
    }, 1000);
  }, []);

  useEffect(() => {
    cargarDatos();
  }, [cargarDatos]);

  const motosFiltradas = filtroMarca
    ? motos.filter(m => m.marca === filtroMarca)
    : motos;

  return {
    motos: motosFiltradas,
    estado,
    total: motosFiltradas.length,
    motosSinStock: motosFiltradas.filter(m => m.stock === 0).length,
    recargar: cargarDatos,
    filtrarPorMarca: setFiltroMarca,
  };
}
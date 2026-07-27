import { useState, useCallback } from 'react';

interface Cliente {
  id: number;
  nombre: string;
  telefono: string;
  email: string;
  comprasTotales: number;
}

interface ResultadoClientes {
  clientes: Cliente[];
  total: Cliente[];
  agregarCliente: (cliente: Omit<Cliente, 'id' | 'comprasTotales'>) => void;
  eliminarCliente: (id: number) => void;
  buscarPorNombre: (nombre: string) => Cliente[];
}

const CLIENTES_INICIALES: Cliente[] = [
  { id: 1, nombre: 'Juan Perez', telefono: '+593 99 123 4567', email: 'juan@email.com', comprasTotales: 25000 },
  { id: 2, nombre: 'Maria Garcia', telefono: '+593 98 765 4321', email: 'maria@email.com', comprasTotales: 18900 },
  { id: 3, nombre: 'Carlos Lopez', telefono: '+593 97 111 2233', email: 'carlos@email.com', comprasTotales: 14200 },
];

export function useClientes(): ResultadoClientes {
  const [clientes, setClientes] = useState<Cliente[]>(CLIENTES_INICIALES);

  const agregarCliente = useCallback((nuevo: Omit<Cliente, 'id' | 'comprasTotales'>) => {
    setClientes(prev => [
      ...prev,
      { ...nuevo, id: prev.length + 1, comprasTotales: 0 },
    ]);
  }, []);

  const eliminarCliente = useCallback((id: number) => {
    setClientes(prev => prev.filter(c => c.id !== id));
  }, []);

  const buscarPorNombre = useCallback((nombre: string) => {
    return clientes.filter(c =>
      c.nombre.toLowerCase().includes(nombre.toLowerCase())
    );
  }, [clientes]);

  return {
    clientes,
    total: clientes,
    agregarCliente,
    eliminarCliente,
    buscarPorNombre,
  };
}
import 'dart:io';

void main() {
  int totalMotosVendidas = 0;
  int totalClientesAtendidos = 0;
  int totalVentas = 0;
  int cantidadVendedores = 0;
  int ventas = -1;

  while (ventas != 0) {
    print('Ingrese la cantidad de ventas realizadas por el vendedor:');
    ventas = int.parse(stdin.readLineSync()!);

    if (ventas <= 0) {
      break;
    }

    print('Ingrese la cantidad de clientes atendidos:');
    int clientes = int.parse(stdin.readLineSync()!);

    print('Ingrese el total en dolares de ventas:');
    int monto = int.parse(stdin.readLineSync()!);

    double clientesPorVenta = clientes / ventas;
    double montoPorVenta = monto / ventas;

    if (clientesPorVenta < 5) {
      print('Baja afluencia');
    } else if (clientesPorVenta >= 5 && clientesPorVenta <= 15) {
      print('Afluencia normal');
    } else {
      print('Alta afluencia');
    }

    totalMotosVendidas += ventas;
    totalClientesAtendidos += clientes;
    totalVentas += monto;
    cantidadVendedores++;
  }

  print('Total de motos vendidas: $totalMotosVendidas');
  print('Total de clientes atendidos: $totalClientesAtendidos');
  print('Cantidad de vendedores registrados: $cantidadVendedores');

  if (cantidadVendedores > 0) {
    double promedioClientesVendedor = totalClientesAtendidos / cantidadVendedores;
    print('Promedio de clientes por vendedor: $promedioClientesVendedor');
  } else {
    print('Promedio de clientes por vendedor: 0');
  }

  if (totalMotosVendidas > 0) {
    double promedioVentas = totalVentas / totalMotosVendidas;
    print('Promedio de ventas por moto: $promedioVentas');
  } else {
    print('Promedio de ventas por moto: 0');
  }
}

import 'producto.dart';

class ProductoDto {
  final int     id;
  final String  title;
  final int  price;
  final bool    isActive;
  final String? categoryName;

  const ProductoDto({
    required this.id,
    required this.title,
    required this.price,
    required this.isActive,
    this.categoryName,
  });

  factory ProductoDto.fromJson(Map<String, dynamic> json) => ProductoDto(
    id:           json['id']            as int,
    title:         json['title']          as String? ?? 'Nombre',
    price:        json['price']         as int? ?? 0,
    isActive:     json['is_active']     as bool? ?? false,
    categoryName: json['category']['name'] as String? ?? 'Sin categoria',
  );

  Producto toDomain() => Producto(
    id:        id,
    nombre:    title,
    precio:    price.toDouble() ?? 0,
    activo:    isActive,
    categoria: categoryName,
  );
}
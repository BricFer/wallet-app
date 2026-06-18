import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryIcons {
  static const Map<String, IconData> icons = {
    // Agua
    'water': Icons.water_drop_outlined,
    'garage': Icons.garage_outlined,
    'rent': Icons.home_work_outlined,
    'community': Icons.people_outline,
    // Decoracion y mobiliario
    'decoration': Icons.chair_outlined,
    // Hipoteca
    'mortgage': Icons.real_estate_agent_outlined,
    // Hogar (otros)
    'homeOthers': Icons.home_outlined,
    // Limpieza
    'cleaning': Icons.cleaning_services_outlined,
    // Luz
    'electricity': Icons.electrical_services,
    // Gas
    'gas': Icons.gas_meter_outlined,
    // Mantenimiento del hogar
    'maintenance': Icons.handyman_outlined,
    // Seguridad y alarmas
    'alarms': Icons.sensor_occupied_sharp,
    // Teléfono, TV e internet
    'internet': Icons.signal_cellular_alt,
    // VEHICULO Y TRANSPORTE
    // Gasolina y combustible
    'carGas': Icons.local_gas_station_rounded,
    // Mantenimiento de vehiculo
    'mechanic': Icons.car_repair_outlined,
    // Multas
    'fine': Icons.local_police_outlined,
    // Parking y garaje
    'parking': Icons.local_parking_rounded,
    // Peajes
    'toll': Icons.toll_outlined,
    // Recarga vehiculo electrico
    'charging': Icons.electric_car_outlined,
    // Taxi y carsharing
    'taxi': Icons.local_taxi_outlined,
    //Transporte publico
    'transport': Icons.train_outlined,
    // Vehiculo y trasnporte (otros)
    'transportOthers': Icons.commute_outlined,
    // COMPRAS
    // Ropa y complementos
    'clothing': Icons.checkroom_sharp,
    // OCIO Y VIAJES
    // Alquiler vehiculo
    'carRental': Icons.car_rental_outlined,
    // Billetes de viaje
    'flightTicket': Icons.airplane_ticket_outlined,
    // Cafeterias
    'coffee': Icons.coffee_outlined,
    // Restaurantes
    'restaurant': Icons.restaurant_outlined,
    // Cine, teatro y espectaculos
    'activities': Icons.theater_comedy_outlined,
    // Estancos y tabaco
    'smoking': Icons.smoking_rooms,
    // Gastos desplazamiento
    'transportExpenses': Icons.emoji_transportation_sharp,
    // Hotel y alojamiento
    'hotel': Icons.hotel_outlined,
    // Videojuegos
    'videogames': Icons.videogame_asset_outlined,
    // Loteria y apuestas
    'lottery': Icons.casino_outlined,
    // Ocio y viajes (otros)
    'leisure': Icons.roller_skating_outlined,
    // Parques y atracciones
    'attractions': Icons.attractions_outlined,
    // OTROS GASTOS
    // Asociaciones y colegios profesionales
    'college': Icons.school_outlined,
    // Autonomos
    'selfEmployed': Icons.business_center_outlined,
    // Cajeros
    'atm': Icons.atm_outlined,
    // Comisiones e intereses
    'bankInterest': Icons.attach_money,

    // Otros gastos (otros)
    'otherExpenses': Icons.currency_exchange_outlined,
    // Pago de impuestos (ingresos y egresos)
    'taxes': Icons.attach_money_sharp,
    // Pensión alimenticia (Egreso e ingreso)
    'alimony': Icons.food_bank_outlined,
    // Sindicatos
    'union': Icons.handshake_outlined,
    // Suscripciones
    'suscription': Icons.subscriptions_outlined,
    // Transferencias - Movimientos excluidos > Traspaso entre cuentas - Bizum (ingreso y egresos)
    'transfer': Icons.compare_arrows_outlined,
    // ALIMENTACIÓN
    // Alimentación (otros)
    'foodOthers': Icons.bakery_dining_rounded,
    // Bodega y gourmet
    'gourmet': Icons.wine_bar_outlined,
    // Comida a domicilio
    'delivery': Icons.delivery_dining_outlined,

    // EDUCACIÓN Y SALUD
    // Actividades extraescolares
    'extracurricularActivities': Icons.sports_cricket_outlined,
    // Dentista, médico
    'dentist': Icons.medication_outlined,
    // Deporte y gimnasio
    'gym': Icons.sports_basketball_rounded,

    // Educación, salud y deporte (otros)
    'health': Icons.healing_outlined,
    // Farmacia, herbolario y nutrición
    'pharmacy': Icons.local_pharmacy_outlined,
    // Guardería y cuidado de niños
    'daycare': Icons.child_friendly_outlined,
    // Óptica
    'optics': Icons.remove_red_eye_outlined,

    // AHORRO
    // Otros ahorros
    'savings': Icons.savings_outlined,

    // INSURANCES
    // Otros seguros
    // Seguro de coche y moto
    // Seguro de decesos
    // Seguro de salud
    // Seguro de viaje
    // Seguro de vida
    // Seguro del hogar
    // Seguro del movil
    // Seguro dental
    // Seguro deportivo
    // Seguro mascotas
    // Seguro proteccion impago
    'insurance': Icons.business_outlined,

    // LOANS
    // Otros prestamos y avales
    // Prestamo de vehiculo
    'carLoan': Icons.payments_outlined,
  };

  static const Map<String, FaIconData> faIcons = {
    // COMPRAS
    // Belleza, perfumeria y peluqueria
    'beauty': FontAwesomeIcons.sprayCanSparkles,
    // Compras (otros)
    'shoppingOthers': FontAwesomeIcons.bagShopping,
    // Electronica
    'electronic': FontAwesomeIcons.microchip,
    // Mascotas y veterinario
    'vet': FontAwesomeIcons.dog,
    // Tarjetas financieras y de credito
    'debts': FontAwesomeIcons.creditCard,
    // OCIO Y VIAJES
    // Libros
    'bookFaIcon': FontAwesomeIcons.book,
    // Musica
    'musicFaIcon': FontAwesomeIcons.guitar,
    // Regalos y juguetes
    'souvenirFaIcon': FontAwesomeIcons.gift,
    // OTROS GASTOS
    // Cheques (Ingresos y egresos)
    'paycheck': FontAwesomeIcons.moneyCheckDollar,
    // ONG
    'ong': FontAwesomeIcons.handHoldingHeart,
    // ALIMENTACION
    // Supermercados y alimentación
    'grocery': FontAwesomeIcons.cartShopping,
    // NÓMINA Y OTRAS PRESTACIONES
    // Nómina o pensión
    'payslip': FontAwesomeIcons.coins,
    // Nónima o pensión (otros)
    // Pensión alimenticia
    // Prestación por desempleo

    // OTROS INGRESOS
    // Abono de financiación
    // Ingreso Bizum
    // Ingresos de cheques
    // Ingresos de efectivo
    'cashIncome': FontAwesomeIcons.wallet,
    // Ingresos de impuestos
    // Ingresos de otras entidades
    // Ingresos por alquiler

    // INVERSIÓN
    // Acciones
    'shares': FontAwesomeIcons.chartLine,
    // Fondos de inversión
    'investmentFund': FontAwesomeIcons.moneyBillTrendUp,
    // Otras inversiones
    'otherInvestments': FontAwesomeIcons.handHoldingDollar,
    // Planes de pensiones
    'pension': FontAwesomeIcons.sackDollar,
    // Educación
    'education': FontAwesomeIcons.bookOpenReader,
    // AHORRO
    // Productos de ahorro
    'savingProducts': FontAwesomeIcons.vault,
  };

  static IconData getIcon(String key) {
    return icons[key] ?? Icons.help_outline;
  }

  static FaIconData getFaIcon(String key) {
    return faIcons[key] ?? FontAwesomeIcons.circleQuestion;
  }
}

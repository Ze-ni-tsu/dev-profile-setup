"""
Reglas de Seguridad:

1. Si temperatura_aceite supera 100.0 O nivel_combustible es menor a 15.0, imprime un aviso de "ADVERTENCIA: Parámetros fuera de rango nominal".

2. Si rpm_motor supera 3800, imprime "ALERTA: Cambio de marcha sugerido (REV LIMIT)".

3. Si no se cumple ninguna de las anteriores, imprime "SISTEMA OK: Telemetría estable".

Salida esperada:

1. Imprime en cada ciclo el número de kilómetro actual y los valores actualizados de los sensores formateados de forma clara.
"""

# Sensores

temperatura_aceite = 85.0
presion_neumaticos = 32.0
nivel_combustible = 100.0
rpm_motor = 2500

# Kilometros

kilometros_recorridos = 0

# Simulación de Etapa

while kilometros_recorridos <= 5:
    print(f"Kilometro actual: {kilometros_recorridos} Km")
    print(f"Temperatura del Aceite: {temperatura_aceite} °C")
    print(f"Presión de los neumáticos: {presion_neumaticos} PSI")
    print(f"Nivel del combustible: {nivel_combustible}%")
    print(f"RPM del Motor: {rpm_motor} RPM")
    if temperatura_aceite > 100.0 or nivel_combustible < 15.0:
        print("ADVERTENCIA: Parámetros fuera de rango nominal")
    elif rpm_motor > 3800:
        print("ALERTA: Cambio de marcha sugerido (REV LIMIT)")
    else:
        print("SISTEMA OK: Telemetría estable")
    temperatura_aceite += 3.5
    nivel_combustible -= 8.0
    rpm_motor += 300
    kilometros_recorridos += 1
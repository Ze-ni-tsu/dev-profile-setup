# Funciones

def procesar_velocidad(distancia_m, tiempo_s):
    try:
        resultado_metros_segundos = distancia_m / tiempo_s
        resultado_kilometros_hora = round((resultado_metros_segundos * 3.6), 2)
        print(f"La velocidad actual es de {resultado_kilometros_hora} Km/H")
        return resultado_kilometros_hora
    except ZeroDivisionError:
        print("Error: El tiempo no puede ser 0")
        return None
    except TypeError:
        print("Error: Parámetros de velocidad inválidos")
        return None

def validar_presion_neumatico(presion_psi):
    try:
        conversion_float = float(presion_psi)
    except (ValueError, TypeError):
        print("Error: Lectura de presión corrupta")
        return None
    else:
        if conversion_float >= 28.0 and conversion_float <= 35.0:
            return True
        else:
            return False

def main():
    print("--- Pruebas de Velocidad ---")
    procesar_velocidad(500, 250) # Caso 1
    procesar_velocidad(500, 0) # Caso 2
    procesar_velocidad(500, "250") # Caso 3
    print("\n--- Pruebas de Presión ---")
    print(validar_presion_neumatico(20)) # Caso 1
    print(validar_presion_neumatico(32)) # Caso 2
    print(validar_presion_neumatico(40)) # Caso 3
    validar_presion_neumatico("presion") # Caso 4
    validar_presion_neumatico([12, 80, 23, 34]) # Caso 5

# Bloque de prueba

if __name__ == "__main__":
    main()
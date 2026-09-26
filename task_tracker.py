# POO

class Pila:
    def __init__(self):
        self.data = {}   # Diccionario como almacenamiento interno
        self.size = 0    # Contador manual de tamaño / tope

    def push(self, item):
        self.data[self.size] = item
        self.size += 1

    def pop(self):
        if self.size == 0:
            return None
        self.size -= 1
        item = self.data[self.size]
        del self.data[self.size]
        return item

    def peek(self):
        if self.size == 0:
            return None
        return self.data[self.size - 1]

class Cola:
    def __init__(self):
        self.data = {}
        self.frente = 0  # Apunta al elemento a salir
        self.final = 0   # Apunta a la siguiente posición libre

    def enqueue(self, item):
        self.data[self.final] = item
        self.final += 1

    def dequeue(self):
        if self.frente == self.final:
            return None
        item = self.data[self.frente]
        del self.data[self.frente]
        self.frente += 1
        return item

    def peek(self):
        if self.frente == self.final:
            return None
        return self.data[self.frente]

# FUNCIONES

def agregar_tarea(cola_pendientes, tarea):
    cola_pendientes.enqueue(tarea)
    print(f"¡Tarea '{tarea['titulo']}' registrada con éxito!")

def procesar_siguiente_tarea(cola_pendientes, pila_deshacer):
    tarea = cola_pendientes.dequeue()
    if tarea is not None:
        pila_deshacer.push(tarea)
        print(f"Procesada: {tarea['titulo']}")
        return tarea
    print("No hay tareas pendientes para procesar.")
    return None

def deshacer_ultima_tarea(cola_pendientes, pila_deshacer):
    tarea = pila_deshacer.pop()
    if tarea is not None:
        cola_pendientes.enqueue(tarea)
        print(f"Deshecha acción. Tarea '{tarea['titulo']}' devuelta a pendientes.")
        return tarea
    print("No hay acciones para deshacer.")
    return None


# --- PRUEBA / DEMOSTRACIÓN ---

if __name__ == "__main__":
    cola_pendientes = Cola()
    pila_deshacer = Pila()

    t1 = {"id": 1, "titulo": "Calibrar sensores", "prioridad": "Alta"}
    t2 = {"id": 2, "titulo": "Compilar firmware", "prioridad": "Media"}
    t3 = {"id": 3, "titulo": "Revisar telemetría", "prioridad": "Baja"}

    print("--- AGREGANDO TAREAS ---")
    agregar_tarea(cola_pendientes, t1)
    agregar_tarea(cola_pendientes, t2)
    agregar_tarea(cola_pendientes, t3)

    print("\n--- PROCESANDO TAREAS ---")
    procesar_siguiente_tarea(cola_pendientes, pila_deshacer)
    procesar_siguiente_tarea(cola_pendientes, pila_deshacer)

    print("\n--- DESHACIENDO ÚLTIMA ACCIÓN ---")
    deshacer_ultima_tarea(cola_pendientes, pila_deshacer)
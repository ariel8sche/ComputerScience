from queue import Queue
from typing import List
from typing import Dict
from typing import Union
import json

def hayStock(pedido:Dict, stock_productos:Dict)->bool:
    res = True
    productosPedidos = pedido["productos"]
    for clave in dict.keys(productosPedidos):
        if productosPedidos[clave] <= stock_productos[clave]:
            res = res and True
        else:
            res = res and False
    return res

def productosEnviados(pedido:Dict, stock_productos:Dict)->Dict:
    productosPedidos = pedido["productos"]
    for producto in productosPedidos:
        if productosPedidos[producto] <= stock_productos[producto]:
            stock_productos[producto] = (stock_productos[producto] - productosPedidos[producto])
        else:
            productosPedidos[producto] = stock_productos[producto] 
            stock_productos[producto] = 0
    return productosPedidos

def precioTotal(pedido:Dict, precios_productos:Dict)->int:
    precio_total:int = 0
    productosPedidos = pedido["productos"]
    for producto in productosPedidos:
        precio_total += (productosPedidos[producto] * precios_productos[producto])
    return precio_total
  
# ACLARACIÓN: El tipo de "pedidos" debería ser: pedidos: Queue[Dict[str, Union[int, str, Dict[str, int]]]]
# Por no ser soportado por la versión de CMS, usamos simplemente "pedidos: Queue"
def procesamiento_pedidos(pedidos: Queue,
                          stock_productos: Dict[str, int],
                          precios_productos: Dict[str, float]) -> List[Dict[str, Union[int, str, float, Dict[str, int]]]]:
  pedidosResueltos:List[Dict[str, Union[int, str, float, Dict[str, int]]]] = [] 
  while not(pedidos.empty()):
    pedido = pedidos.get()
    if hayStock(pedido, stock_productos):
        pedido["productos"] = productosEnviados(pedido, stock_productos)
        pedido["precio_total"] = precioTotal(pedido, precios_productos)
        pedido["estado"] = "completo"
    else:
        pedido["productos"] = productosEnviados(pedido, stock_productos)
        pedido["precio_total"] = precioTotal(pedido, precios_productos)
        pedido["estado"] = "incompleto"
    pedidosResueltos.append(pedido)
  return pedidosResueltos

if __name__ == '__main__':
  pedidos: Queue = Queue()
  list_pedidos = json.loads(input())
  [pedidos.put(p) for p in list_pedidos]
  stock_productos = json.loads(input())
  precios_productos = json.loads(input())
  print("{} {}".format(procesamiento_pedidos(pedidos, stock_productos, precios_productos), stock_productos))

# Ejemplo input  
# pedidos: [{"id":21,"cliente":"Gabriela", "productos":{"Manzana":2}}, {"id":1,"cliente":"Juan","productos":{"Manzana":2,"Pan":4,"Factura":6}}]
# stock_productos: {"Manzana":10, "Leche":5, "Pan":3, "Factura":0}
# precios_productos: {"Manzana":3.5, "Leche":5.5, "Pan":3.5, "Factura":5}


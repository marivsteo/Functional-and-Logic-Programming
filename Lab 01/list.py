class Nod:
    def __init__(self, e):
        self.e = e
        self.urm = None


class Lista:
    def __init__(self):
        self.prim = None

def appendNode(lista, new_data):
    new_node = Nod(new_data)
    if lista.prim is None:
        lista.prim = new_node
        return

    last = lista.prim
    while last.urm:
        last = last.urm

    last.urm = new_node


'''
crearea unei liste din valori citite pana la 0
'''


def creareLista():
    lista = Lista()
    lista.prim = creareLista_rec()
    return lista


def creareLista_rec():
    x = int(input("x="))
    if x == 0:
        return None
    else:
        nod = Nod(x)
        nod.urm = creareLista_rec()
        return nod


'''
tiparirea elementelor unei liste
'''


def tipar(lista):
    tipar_rec(lista.prim)


def tipar_rec(nod):
    if nod != None:
        print(nod.e)
        tipar_rec(nod.urm)


'''
program pentru test
'''


#def main():
    #list = creareLista()
    #tipar(list)


#main()

from list import *
from list import Nod
from list import Lista



# maxElem(l1,..,ln,max)={0,n=0
#                        1,n=1
#                        maxElem(l2,...,ln,l1), if max<l1
#                        maxElem(l2,...,ln,max), otherwise
#
#
# invertList(l1,...,ln)={[],n=0
#                        [l1],n=1
#                        invertList(l2,...,ln) U l1, otherwise




def findmaxi(lista, maxi):
    if lista.prim is None:
        return 0
    elif lista.prim.urm is None and maxi == 0:
        return lista.prim.e
    elif lista.prim.urm is None:
        if maxi > lista.prim.e:
            return maxi
        else:
            return lista.prim.e
    elif lista.prim.e > maxi:
        e=lista.prim.e
        lista.prim = lista.prim.urm
        maxi = e

        return findmaxi(lista, maxi)
    else:
        lista.prim = lista.prim.urm
        return findmaxi(lista, maxi)


def invertlist(lista):
    if lista.prim is None:
        return 0
    elif lista.prim.urm is None:
        return lista
    elif lista.prim is not None and lista.prim.urm is not None:
        e = lista.prim.e
        #tipar(lista)
        lista.prim = lista.prim.urm
        lista2 = invertlist(lista)
        appendNode(lista2,e)
        return lista2
        #return invertlist(lista).appendNode(e)


def main():
    lista = creareLista()
    maxi = 0
    c = findmaxi(lista, maxi)
    print(c)
    lista2 = creareLista()
    lista2 = invertlist(lista2)
    tipar(lista2)

main()
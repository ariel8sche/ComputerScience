# declara diccionario
capitales = {'Chile':'Santiago',
              'España':'Madrid',
              'Francia':'París'}
              
print('La capital de Chile es', capitales['Chile'])  # 'Santiago'
del capitales['Francia']  # borra el par Francia:París
print('\nHay {0} países\n'.format(len(capitales)))  # 'Hay 2 países'
for pais, capital in capitales.items():  # recorre diccionario
    print('Capital de {0}: {1}'.format(pais, capital))  # muestra par

capitales['Portugal'] = 'Lisboa'  # agrega par Portugal:Lisboa
if 'Portugal' in capitales:  # comprueba si existe clave
    print('\nCapital Portugal:', capitales['Portugal']) # 'Lisboa's

print(capitales)

for c, v in capitales.items(): 
    print(c,':',v)  # recorre diccionario

for k in capitales.keys(): 
    print(k)  # recorre las claves
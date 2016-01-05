import matplotlib.pyplot as plt
import numpy as np

k, U = np.genfromtxt('datenb_2.txt', unpack = True)

for a in zip(k,U):
    keins, Ueins = a
    plt.plot((keins, keins), (0,Ueins),label = r'Amplituden')

plt.xlabel(r'$\text{Frequenz}$')
plt.ylabel(r'$U\:/\:\si{\milli\volt}$')

plt.tight_layout(pad=0, h_pad=1.08, w_pad=1.08)
plt.savefig('build/plotspdrei.pdf')

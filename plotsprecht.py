import matplotlib.pyplot as plt
import numpy as np

#Messdaten einladen
k, U = np.genfromtxt('datenb_1.txt', unpack = True)
#plt.plot(f, U, 'k.', label = r'Messdaten')

N=9

ind = np.arange(N)
width = 0.3
ax = plt.subplots()


rects = ax.bar(ind, U, width, color ='r')
ax.set_ylabel(r'$U\:/\:\si{\milli\volt}$')
ax.set_xlabel(r'$\text{Frequenz}$')
ax.set_xticks(ind)
ax.set_xticklabels((r'$\nu$', r'$3\nu$', r'$5\nu$', r'$7\nu$', r'$9\nu$', r'$11\nu$',
r'$13\nu$', r'$15\nu$', r'$17\nu$'))

ax.legend((rects[0]),('Linienspektrum'))

autolabel(rects)


plt.tight_layout(pad=0, h_pad=1.08, w_pad=1.08)
plt.savefig('build/plotsprecht.pdf')

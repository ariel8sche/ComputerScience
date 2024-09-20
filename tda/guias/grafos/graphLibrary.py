import networkx as nx
import matplotlib.pyplot as plt

g = nx.Graph()
g.add_edges_from([(0,1),(0,2),(0,3),(2,3),(2,4)])
nx.draw(g, with_labels=True)
plt.show()

from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import numpy as np
figsize = (16, 9)
from alc import QR_con_GS, QR_con_HH

def graficar_descomposicion(A):
    Q,R = QR_con_GS(A)
    print("Close" ,np.allclose(A, Q@R))
    plt.figure(figsize=figsize)
    plt.imshow(Q)
    plt.title("Q")
    plt.show()
    plt.figure(figsize=figsize)
    plt.imshow(Q.T @ Q)
    plt.title("Q.T @ Q")
    plt.show()
    plt.figure(figsize=figsize)
    plt.imshow(R)
    plt.title("R")
    plt.show()


def show_subespace(vs, ax=None, color="blue", alpha=0.4):
    v1 = vs[0]/np.linalg.norm(vs[0])
    if len(vs) ==1:
        v2 = v1*0
    else:
        v2 = vs[1]/np.linalg.norm(vs[1])

    a = np.linspace(-2, 2, 30)
    b = np.linspace(-2, 2, 30)
    A, B = np.meshgrid(a, b)
    X = A * v1[0] + B * v2[0]
    Y = A * v1[1] + B * v2[1]
    Z = A * v1[2] + B * v2[2]
    if ax is None:
        fig = plt.figure(figsize=figsize)
        ax = fig.add_subplot(111, projection='3d')
    if len(vs)==1:
        ax.plot(X,Y,Z)
    else:
        ax.plot([X[0,0], X[0,-1]], [Y[0,0], Y[0,-1]], [Z[0,0], Z[0,-1]], color='k', linewidth=1)
        ax.plot([X[0,0], X[-1,0]], [Y[0,0], Y[-1,0]], [Z[0,0], Z[-1,0]], color='k', linewidth=1)
        ax.plot([X[-1,0], X[-1,-1]], [Y[-1,0], Y[-1,-1]], [Z[-1,0], Z[-1,-1]], color='k', linewidth=1)
        ax.plot([X[0,-1], X[-1,-1]], [Y[0,-1], Y[-1,-1]], [Z[0,-1], Z[-1,-1]], color='k', linewidth=1)
        ax.plot_surface(X, Y, Z, alpha=alpha, linewidth=1, rstride=1, cstride=1, color=color)
    ax.set_xlabel('X')
    ax.set_ylabel('Y')
    ax.set_zlabel('Z')

    lims = 1.2
    ax.set_xlim(-lims, lims)
    ax.set_ylim(-lims, lims)
    ax.set_zlim(-lims, lims)
    return ax


# toma una lista de vectores entonces si queremos graficar los vectores columna de una matriz A hacemos plot_vectors(A.T)
def plot_vectors(vectors, ax=None, color="black"):
    origin = np.zeros(3)
    if ax is None:
        fig = plt.figure(figsize=figsize)
        ax = fig.add_subplot(111, projection='3d')
        ax.set_xlabel('X')
        ax.set_ylabel('Y')
        ax.set_zlabel('Z')

    for vec in vectors:
        ax.quiver(*origin, *vec, length=1.0, normalize=False, color=color, alpha=0.7, linewidths=3.5)
    ax.set_xlim(-1, 1)
    ax.set_ylim(-1, 1)
    ax.set_zlim(-1, 1)
    return ax



if __name__ == "__main__":
    U = np.array([[-1,1,1],[1,-1,0.3], [0.5,0.4,1]]) # esta es la matriz que vamos a usar, pueden probar con otras


    show_gramm_schmidt = True
    if show_gramm_schmidt:

        ax = plot_vectors(U.T)
        plt.title(f"Vectores columna de la matriz")
        plt.show()

        Q,R = QR_con_GS(U)
        for i in range(U.shape[1]):
            ax = None
            vs = U.T[:i+1]
            ax = plot_vectors(vs)
            ax = plot_vectors(Q.T[:i+1], ax, color="red")
            if i > 0:
                ax = show_subespace(U.T[:i],ax, alpha=0.1)
            plt.title(f"gram_shmidt: Ortogonalizando la componente {i}")
            plt.show()



    U = U[:,:2]  # sacamos uno de los vectores para ser mas facil de entender pero podriamos dejar los 3
    ax = plot_vectors(U.T)
    plt.title(f"Vectores columna de la matriz")
    plt.show()

    Q,R, extra_info = QR_con_HH(U, extras=True)


    Q_matrices = extra_info["Q_matrices"]

    for i in range(U.shape[1]):
        ax = None
        vs = U.T
        qs = Q_matrices[i].T
        ax = plot_vectors(vs)
        ax = plot_vectors(qs, ax, color="red")
        ax = show_subespace(qs, ax, color="red", alpha=0.1)

        if i == 0:
            ax.plot([qs[i][0], vs[i][0]], [qs[i][1], vs[i][1]], [qs[i][2], vs[i][2]], color="orange", linestyle="dashed")
        if i == 1:
            # eliminamos la componente de vs[1] en la direccion de qs[0]
            v_proj = np.dot(vs[1], qs[0]) * qs[0]
            v_ortho = vs[1] - v_proj
            ax.plot([0, v_ortho[0]], [0, v_ortho[1]], [0, v_ortho[2]], color="green", linestyle="dashed", label="Componente ortogonal")
            ax.plot([v_ortho[0], qs[1][0]], [v_ortho[1], qs[1][1]], [v_ortho[2], qs[1][2]], color="orange", linestyle="dashed", label="Componente paralelo")
        plt.title(f"householder: Ortogonalizando la componente {i}")
        plt.show()

        


    qs = Q.T[:2] # Nuestro algoritmo en realidad obtiene una base de R3 pero descartamos la ultima columna de Q y de R para la representacion reducida (habra 0s en esa direccion)
    ax = plot_vectors(vs)
    ax = plot_vectors(qs, ax, color="red")
    ax = show_subespace(qs, ax, color="red", alpha=0.1)
    plt.title(f"householder: Resultado final")
    plt.show()



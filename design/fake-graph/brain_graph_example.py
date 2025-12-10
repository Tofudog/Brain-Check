import matplotlib.pyplot as plt
import numpy as np

plt.style.use("dark_background")
plt.tight_layout()

def brainCellsPlot(age):
    f = lambda x: 100000/x
    fx_name = r'$f(x)=\frac{1}{x}$'
    x=np.linspace(0, age, 11)
    y=f(x)

    plt.ylabel("# Brain Cells")
    plt.xlabel("Age in years")
    plt.title("Graph of your brain cells")
    plt.plot(x, y, linewidth=2, color="pink")
    plt.savefig("brain_graph_example.png")
    plt.show()

brainCellsPlot(20)
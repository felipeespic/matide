# -*- coding: utf-8 -*-
"""
Created on Sun Jun 12 15:33:27 2016

@author: felipe

"""
# JEDI - Pyhton completion====================================================
try:
    from jedi.utils import setup_readline
    setup_readline()
    print("JEDI initialised")
except ImportError:
    # Fallback to the stdlib readline completer if it is installed.
    # Taken from http://docs.python.org/2/library/rlcompleter.html
    print("Jedi is not installed, falling back to readline")
    try:
        import readline
        import rlcompleter
        readline.parse_and_bind("tab: complete")
    except ImportError:
        print("Readline is not installed either. No tab completion is enabled.")



# PLOTTING FUNCTIONS:==========================================================
import numpy as np
import __builtin__ as builtins
import matplotlib
matplotlib.use("Qt4Agg")
from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

#matplotlib.rcParams['lines.antialiased'] = False
#matplotlib.rcParams['lines.linewidth']   = 1.0

matplotlib.rcParams['lines.antialiased'] = True
matplotlib.rcParams['lines.linewidth']   = 2.0


plt.ion()

def plot_interactive(*args, **kargs):
    '''
    Plot an array for interative mode.
    '''
    plt.figure()
    plt.plot(*args, **kargs)
    plt.grid()
    plt.show()
    return
builtins.plot = plot_interactive


def plotm_interactive(m_data):
    '''
    Plot a numpy 2D array (matrix) as image for interactive mode.
    '''
    plt.figure()
    ret = plt.imshow(m_data.T, cmap=plt.cm.inferno, aspect='auto', origin='lower', interpolation='nearest')
    #ret = lp.imshow(m_data.T, cmap=lp.cm.jet, aspect='auto', origin='lower', interpolation='spline16')
    plt.colorbar(ret)
    return
builtins.plotm = plotm_interactive


def surf(m_data):
    '''
    Plot a numpy 2D array (matrix) as 3D surface (A bit slow for interactive mode).
    '''
    v_x = np.arange(m_data.shape[0])
    v_y = np.arange(m_data.shape[1])
    m_y, m_x = np.meshgrid(v_y, v_x) # this order is intentional
    ax = plt.axes(projection='3d')
    ax.plot_surface(m_x, m_y, m_data, cmap=plt.cm.jet, rstride=1, cstride=1, linewidth=0)
    return
builtins.surf = surf




import numpy as np
import pandas as pd
import time
import matplotlib.pyplot as plt

def getDepth(g, S, t):
    '''
    g :: vector
    S :: a list of vectors
    t :: index of vector
    '''
    n = len(S)
    ans = 0
    for i in range(len(S)):
        if S[i][t] <= g[t]:
            ans += 1
        if S[i][t] > g[t]:
            ans += -1
    #return 1 - np.abs(ans)/n
    return 1 - (ans/n)

def getCDF(g, S):
    n = len(S)
    D = [i/n for i in range(0, n + 1)]

    Dgs = []
    for t in range(len(g)):
        Dgs.append(getDepth(g, S, t))

    cdf = []
    for r in D:
        cdf_r = 0
        for i in range(len(Dgs)):
            if Dgs[i] <= r:
                cdf_r += 1
            else:
                cdf_r += 0
        cdf.append(cdf_r/len(g))

    return cdf

def getExtDepth(S):
    n = len(S)
    df = pd.DataFrame(data = 0, index = ['Phi_{}'.format(i) for i in range(n)], columns = [i/n for i in range(0, n + 1)])

    for i in range(len(S)):
        df.loc['Phi_{}'.format(i)] = getCDF(S[i], S)

    return df

print("Imported Successfully")